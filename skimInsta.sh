#!/bin/bash
#declare -a studios=("barrysbootcamp","yogaflowsf",  "karmayogasf","movesf","whybaptisteyoga","bodyrok","purebarre", "purushayoga","bikramyoga","yogatreesf","livefitgym","oceanbeachyogasf","yogabeachsf","mightypilates","bodytemptyoga","onpointesf","thedaileymethod","thisavidfitlife","revisionathletics","tayloryourfitness","thepadstudios","basecampsf","popphysique","pelofitness","konefitness","cfgoldengate","glowyogasf","vrv3studios","sheilakelleysfactor","bodyfi","bootcampsf","rowclubsf","raestudios", "swingsf","eskabodaan","bodybyburesh","bayjiujitsu","mindfulbodymysore","thecentersf","yogagardensf","flagshipapc","bendsf","lavationstudio","sivanandasf","studio505dance","elevategroupfitness", "movingartsstudio","abmixedmartialarts", "zaccho","cardiotone","jungshinfitness","sanchezstreetstudio","ehspilates","yogamayusf","missionyogasf","odcdance", "17thstreetathleticclubsf","ascendbody","rougeandsaintfitness","lovestoryyoga","laughinglotussf", "bombayjam","astayoga","bodychemistrystudio","aerialartique","ravenfitness","alonzowisdom","centeredbodypilates","thirdstreetboxing","dogpatchtribe","ritualhotyoga","MNTstudio","doonyasf","sfpoleanddance","bodybeatzbeyonddance","hwarangkwan","alexiscraigfit","jbodyworks","avantbarre","epichybridtraining","ompowersf","flywheel","corepower","graceyogamillbrae","beingyogaburlingame","brienshampfitbodybootcamp","basecampsf","nandiyoga","rocksaltfitness","scoopstudiopilates","teamcfoc","jazzercise","prajnacommunity","balancetread","undisputedboxinggym","reelride","goyhc","impactkbf","justbreathyogarivermark","zenithsp","bmifitness","livelotus","reddotfitness", "bethechangeyoga","burnshakeroll","fieldfitness","flexfusionstudios","method3fitness","breathtogetheryoga", "crossfitsj","knoxxmartialartsandfitness","mintconditionfitness","yogasourcepaloalto", "crossfitmyo","soulpilates2014","liftbbb", "slimfitness", "uforiastudios", "avalonyoga","purebarre","samyamayogacenter", "my3fit", "koafitness", "peacebankyoga", "studiorincon","poletential","B3strong","tosettiinstitute", "yogasourcepaloalto","","studiokickspaloalto","yogaworkspaloalto", "megamv","corestudiospx", "fnsstrong", "stuidkfit", "barmethodpaloalto", "planetgranite", "impactkbf", "tandezacademy","ironwillfitnesscg", "otfdtsv","fieldfitness", "teamaka","crossfitlosaltos","corepoweryoga", "momentumcyclingstudio", "fun2befit", "bomitrayogamountainview","danceidentity", "amitycrossfit","wearerevelry","equinoxpaloalto","crunchgym","fusionbeatzbollywoodfitness","coretotalfitness", "sickfitbootcamp", "svmma","mobiusfit","<3core*","hgxfit","ncfit","mfp_cross_training","ftstrong","evolvetrainingcenter","fitlocalfit","urbanmystics","theparkgym", "pilatesproworks","burnpilates","wheelhousesf","studiomixsf","verticalmethod","truvefit","core40","hitfitsf","soulcycle","fitnesssf","koifitness", "omulucapoeira")
declare -a studios=('17thstreetathleticclubsf',
 '24hourfitness',
 'my3fit',
 'thirdstreetboxing',
 'abmixedmartialarts',
 'advanceyourself',
 'aerialartique',
 'alkalignme',
 'linesballet',
 'teamaka',
 'amitycrossfit',
 'ascendbody',
 'astayoga',
 'avalonyoga',
 'avantbarre',
 'B3strong',
 'bmifitness',
 'baptisteyoga',
 'barrysbootcamp',
 'barrysbootcamp',
 'basecampsf',
 'bethechangeyoga',
 'beingyogaburlingame',
 'bendsf',
 'bikramyoga',
 'blakefit',
 'bodybyburesh',
 'bodychemistrystudio',
 'bodytemptyoga',
 'bodyrok',
 'bomitrayogamountainview',
 'brienshampfitbodybootcamp',
 'B3strong',
 'core40',
 'burnshakeroll',
 'cardiotone',
 'centeredbodypilates',
 'citysportsclub',
 'corestudiospx',
 'coretotalfitness',
 'corepoweryoga',
 'cfgoldengate',
 'crossfitlosaltos',
 'teamcfoc',
 'crossfitsj',
 'crunchgym',
 'danceidentity',
 'doonyasf',
 'ehspilates',
 'elevategroupfitness',
 'equinoxpaloalto',
 'eskabodaansep',
 'evolvetrainingcenter',
 'f45',
 'evolvetrainingcenter',
 'fitlocalfit',
 'fitforlifesolutions',
 'fitnesssf',
 'fitnessurbano',
 'flagshipapc',
 'flexfusionstudios',
 'flywheel',
 'xtrimbollywood',
 'glowyogasf',
 'graceyogamillbrae',
 'hitfitsf',
 'iheartcore',
 'amitycrossfit',
 'hwarangkwansf',
 'impactkbf',
 'ironwillfitnesscg',
 'justbreatheyogarivermark',
 'knoxxmartialartsandfitness',
 'bomitrayogamountainview',
 'laughinglotussf',
 'lavationstudio',
 'uforiastudios',
 'livefitgym',
 'livelotus',
 'lovestoryyoga',
 'mntstudio',
 'mynulifstudio',
 'method3fitness',
 'mightypilates',
 'mintconditionfitness',
 'missionyogasf',
 'mobiusfit',
 'momentumcyclingstudio',
 'monarchcrossfit',
 'moxieyogafitness',
 'nandiyoga',
 'ompowersf',
 'oceanbeachyogasf',
 'mfp_cross_training',
 'orangetheoryfitness',
 'peacebankyoga',
 'pelofitness',
 'pilatesproworks',
 'planetgranite',
 'poletential',
 'popphysique',
 'prajnacommunity',
 'purebarre',
 'purushayoga',
 'raestudios',
 'tandezacademy',
 'ravenfitness',
 'koafitness',
 'reddotfitness',
 'revelryfitness',
 'ritualhotyoga',
 'rocksaltfitness',
 'rougeandsaintfitness',
 'rowclubsf',
 'samyamayogacenter',
 'sfpoleanddance',
 'sanchezstreetstudio',
 'sheilakelleysfactor',
 'sickfitbootcamp',
 'soulcycle',
 'soulcycle',
 'studiokfit',
 'studiokickspaloalto',
 'studiorincon',
 'SVMAA',
 'swingsf',
 'uforiastudios',
 'verticalmethod',
 'thecentersf',
 'thedaileymethod',
 'fieldfitness',
 'mindfulbodymysore',
 'thepadstudios',
 'theparkgym',
 'uforiastudios',
 'truvefit',
 'uforiastudios',
 'undergroundfitnessii',
 'undisputedboxinggym',
 'vrv3studios',
 'verticalmethod',
 'vibeyogaca',
 'wheelhousesf',
 'yogagardensf',
 'goyhc',
 'yogamayusf',
 'yogasourcepaloalto',
 'yogatreesf',
 'yogaworkspaloalto',
 'B3strong',
 'bodyfi',
 'fitlocalfit',
 'movesf',
 'yogabeachsf',
 'alkalignme',
 'core40',
 'soulcycle',
 'core40')

for studio in "${studios[@]}"
do
    instagram-scraper ${studio} --tag  --maximum 1000 --include-location --media_type none
done