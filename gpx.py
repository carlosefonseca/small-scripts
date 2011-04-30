#!/usr/bin/env python

# Extracts the most important information about each cache on a GPX file.
# It can output as text, with limited text size for each column or
# as a CSV with columns separated by ';' and without limits of the text size
# It is advisable to manually process the gchint text if it has more than a \
# language or useless text

# by Carlos Fonseca on 2011-04-30

# USAGE:     python gpx.py GPXfile
#    or      python gpx.py -csv GPXfile > file.csv

# This Python file uses the following encoding: utf-8
from xml.etree.ElementTree import ElementTree
import sys
import os.path

if len(sys.argv) == 2:
    csv = False
    gpx = sys.argv[1]
elif len(sys.argv) == 3 and sys.argv[1] != "-csv":
    print "switch '"+sys.argv[1]+"' not recognized"
    sys.exit()
elif len(sys.argv) == 3 and sys.argv[1] == "-csv":
    csv = True
    gpx = sys.argv[2]
else:
    print "Usage: "+sys.argv[0]+" [-csv] <gpx file>"
    sys.exit()

if not os.path.isfile(gpx):
    print "'%s' is not a file." % gpx
    sys.exit()


txt = ""

tree = ElementTree()
tree.parse(gpx)

caches = tree.findall("{http://www.topografix.com/GPX/1/0}wpt")

for cache in caches:
    gccode = cache.find("{http://www.topografix.com/GPX/1/0}name").text
    (gcname,s,rest) = (cache.find("{http://www.topografix.com/GPX/1/0}desc").
                                                      text.rpartition(", "))
    sp = rest.split('(')
    gctype = sp[0]
    (gcdif, s, gcterr) = sp[1][0:-1].partition("/")

    lat = cache.attrib["lat"]
    lon = cache.attrib["lon"]

    gchint = (cache.find("{http://www.groundspeak.com/cache/1/0}cache").
                find("{http://www.groundspeak.com/cache/1/0}encoded_hints").
                                            text.strip().replace("\n"," "))
    
    logs = (cache.find("{http://www.groundspeak.com/cache/1/0}cache").
                    find("{http://www.groundspeak.com/cache/1/0}logs").
                    findall("{http://www.groundspeak.com/cache/1/0}log"))
    
    lastLogs = ""
    for log in logs:
        logtype = log.find("{http://www.groundspeak.com/cache/1/0}type").text
        if logtype == "Found it":
            lastLogs += "F"
        elif logtype == "Didn't find it":
            lastLogs += "n"
        elif logtype == "Owner Maintenance":
            lastLogs += "o"
        else:
            lastLogs += "."

    if csv:
        txt += ("%s;%s;%s;%s;%s;%s;%s;%s;%s\n" % 
            (gccode, gcname, gctype, gcdif, gcterr, lat, lon, lastLogs, gchint))
    else:
        txt += ("%-7s %-20s %s %-3s %-3s %-9s %-9s %-5s %s\n" %
                        (gccode, gcname[0:20], gctype[0:5], gcdif, gcterr,
                         lat, lon, lastLogs, gchint))

txt = txt.strip()
txt = txt.encode('UTF-8')

print txt