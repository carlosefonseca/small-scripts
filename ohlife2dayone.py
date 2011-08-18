#!/usr/bin/env python
# coding: utf-8

# By Carlos Fonseca
# 2011-08-17

# Import OfLife's entries into Day One.



from datetime import datetime
import os, sys



def sendToDayOne(date, body):
    command = 'echo "'+body.strip()+'" | /Applications/Day One.app/Contents/MacOS/dayone -d="'+date.strip()+'" new'
    print command
    print u"—————————————————————————————————————————————————————————————————"
    os.system(command)
    


f = open("ohlife.txt")

date = "";
body = "";
for line in f:
    try:
        datetime.strptime(line,"%Y-%m-%d\n")
        if date != "":
            sendToDayOne(date, body)
        date = line
        body = ""
    except ValueError:
        body += line        
sendToDayOne(date, body)