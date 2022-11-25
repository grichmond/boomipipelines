#!/usr/bin/python

import getopt, sys, os

argv = sys.argv[1:]

try:
    opts, args = getopt.getopt(argv, "o:r:f:", 
                                   ["original=",
                                    "replacement=", 
                                    "outfile="])      
except:
    print("Error")

for opt, arg in opts:
    if opt in ['-o', '--original']:
        originalValue = arg
    elif opt in ['-r', '--replacement']:
        replacementValue = arg
    elif opt in ['-f', '--outfile']:
        outFile = arg
      
# Capture the standard input
stdIn = sys.stdin

with open(outFile, "a") as outputfile:
    # Loop through the lines and replace the string with the raw data
    # Sed has issues with strings with certain characters, so this handles all values properly
    for line in sys.stdin:
        line = line.replace(originalValue, replacementValue)
        line = line.replace("valueFrom", "value")
        outputfile.write(line)

