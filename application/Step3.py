import pandas as pd
import numpy as np
from sklearn import feature_extraction
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import difflib
import random
import json
import urllib.request as urllib
import time

ERROR = None
def miles(zip1, zip2):
    global ERROR
    js = urllib.urlopen("https://maps.googleapis.com/maps/api/directions/json?origin="+str(zip1)+"&destination="+str(zip2)+"&key=AIzaSyDA4cQx3HDliclGSXo8UeEfmXH-wB_Na-Q")
    j =json.load(js)
    js.close()
    try:
        distance = j['routes'][0]['legs'][0]['distance']['text'][:-3]
    except:
        print("distance!")
        distance = 0
        ERROR = "MAPS API CAN'T GET DISTANCE"
    return float(distance)

def Vectorize(hashtags):
    tfidf_vectorizer = TfidfVectorizer(max_df=0.99, max_features=200000, min_df=0.15, ngram_range=(1,1))
    tfidf_matrix = tfidf_vectorizer.fit_transform(hashtags)
    terms = tfidf_vectorizer.get_feature_names()
    return tfidf_matrix, terms

def similarities(M, studio, names, studionames, dataframe, clusternum, nearzip, distaway=10):
    global ERROR
    ind = names.index(studio)
    sims = M[ind][:]
    ordered = [(isim, sim) for isim, sim in enumerate(sims)]
    sortd = sorted(ordered, key=lambda tup: tup[1])

    numStudios = len(sortd)
    isSF = nearzip/1000. > 93

    zipsClusters = [(int(dataframe.loc[dataframe['rank']==sortd[i][0]]['zip'].values[0]), dataframe.loc[dataframe['rank']==sortd[i][0]]['cluster'].values[0], dataframe.loc[dataframe['rank']==sortd[i][0]]['studioName'].values[0]) for i in range(numStudios)]


    if distaway < 50 and isSF: zipClusters = [s for s in zipsClusters if s[0]/1000. > 93]
    elif distaway < 50 and not isSF: zipClusters = [s for s in zipsClusters if s[0]/1000. < 93]
    else: zipClusters = zipsClusters

    try:
        mostSim = next(s for s in zipClusters if (s[1] == clusternum and miles(nearzip, s[0]) < distaway))[2]
    except:
        mostSim = 0
        ERROR = "NOT ENOUGH STUDIOS IN THE AREA"

    try:
        secondSim = next(s for s in zipClusters if (s[1] != clusternum and miles(nearzip, s[0]) < distaway))[2]
    except:
        secondSim = 0
        ERROR = "NOT ENOUGH STUDIOS IN THE AREA"
    
    return mostSim, secondSim


def runIt(studioIn, studio_df, nearZip, milesAway, Print=False):
    global ERROR
    b1time = time.time()
    studio1 = studioIn

    #get some lists needed for input
    hashtags = studio_df['hashtags'].tolist() #hashtags for each studio
    studioNames = studio_df['studioName'].tolist() #proper studio names
    names = studio_df['title'].tolist() #hashtaged studio names

    #match the user input studio name to the true studio name
    studio_name = difflib.get_close_matches(studio1, studioNames, cutoff=0.5)
    #if it matches to more than one studio, redo with a more strict cutoff
    if len(studio_name) > 1:
        print("too close", studio_name)
        studio_name = difflib.get_close_matches(studio1, studioNames, cutoff=0.7)
        print ("studio name", studio_name)
    if len(studio_name) <1:
        studio_name = difflib.get_close_matches(studio1, studioNames, cutoff=0.6)
        print ("studio name", studio_name)
    if len(studio_name) <1:
        studio_name = difflib.get_close_matches(studio1, studioNames, cutoff=0.5)
        print ("studio name", studio_name)

    if len(studio_name) > 1:
        print ("may not have correct name")

    try:
        studio_name = studio_name[0]
    except:
        ERROR = "CAN'T FIND STUDIO"
        studio_name = "3 FIT"

    #match studio hashtag name to proper studio name
    studio = (studio_df.loc[studio_df['studioName'] == str(studio_name)])['title'].iloc[0]

    ##############################################
    #TF-IDF matrix
    tfidf_matrix, terms = Vectorize(hashtags)
    #dissimilarity matrix
    dist = 1 - cosine_similarity(tfidf_matrix)

    dense = tfidf_matrix.todense()
    denselist = dense.tolist()
    #############################################

    clusternum = (studio_df.loc[studio_df['title'] == str(studio)])['cluster'].iloc[0]    
    type = (studio_df.loc[studio_df['title'] == str(studio)])['genre'].iloc[0]    

    #find most similar studio, and most similar studio in another cluster
    btime = time.time()
    mm = similarities(dist, studio, names, studioNames, studio_df, clusternum, int(nearZip), float(milesAway))
    etime = time.time()
    print ("time", etime-btime)

    mostsimilar = mm[0]
    secondsimilar = mm[1]
    e1time = time.time()
    print ("total time", e1time - b1time)
    print ("ERRORS", ERROR)
    return mostsimilar, secondsimilar, str(type[0][0].lower()), ERROR

