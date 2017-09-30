from Step3 import runIt
from flask import render_template
from flaskexample import app
from flask import request
import pandas as pd

@app.route('/')


@app.route('/input')
def input():
    return render_template("input.html")

@app.route('/output')
def output():
    query_results = pd.read_pickle("FinalDF")
    studio_name = request.args.get('studio_name')
    nearZip = request.args.get('nearZip')
    milesAway = request.args.get('milesAway')
    the_result = runIt(studio_name, query_results, nearZip, milesAway)
    if the_result[3] is not None:
        return render_template("output_error.html", the_error = the_result[3])
    else:
        return render_template("output.html", the_result_one = the_result[0], the_result_two = the_result[1], the_type = the_result[2])

