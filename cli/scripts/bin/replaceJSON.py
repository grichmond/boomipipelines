#!/usr/bin/python

import os
import csv 
import json 
import sys

# Get environment variables
csvFile = sys.argv[1]
valueText = '"' + sys.argv[2] + '"'
outFile = sys.argv[3]
stdIn = sys.stdin
# Getting non-existent keys
def csv_to_json(csvFilePath):
    jsonArray = []
    #read csv file
    with open(csvFilePath) as csvf:
        #load csv file data using csv library's dictionary reader
        csvReader = csv.DictReader(csvf)

        # convert each csv row into python dict
        for row in csvReader: 
            #add this python dict to json array
            jsonArray.append(row)

    jsonString = json.dumps(jsonArray, indent=0).replace("\n", "").replace("_type", "@type")

    return jsonString

jsonString = csv_to_json(csvFile)

with open(outFile, "a") as outputfile:
    # Loop through the lines and replace the string with the raw json
    # Remove the quotes since this needs to be treated as json not a string
    for line in sys.stdin:
        line = line.replace(valueText, jsonString)
        outputfile.write(line)

