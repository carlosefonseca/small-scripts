#!/usr/bin/env python

import os
import shutil
import time
from datetime import timedelta

SSDP="/Users/carlos/Downloads/Series"
EXTP="/Volumes/DATA/ Series/"

TIME_TO_KEEP=timedelta(days=7).total_seconds()

os.chdir(SSDP)

for i in os.listdir(os.getcwd()):
	if not i.startswith("."):
		(name, season) = i.rsplit(" ", 1)
		season = "Season "+season.strip("x")
		#print name,"-", season

		destPath=EXTP+name+"/"+season
		print destPath,
		if not os.path.exists(destPath):
			os.makedirs(destPath)
			print " - created",
		print

		for filename in os.listdir(i):
			if not filename.startswith("."):
				fullFilePath = SSDP+"/"+i+"/"+filename
				filetime = os.path.getmtime(fullFilePath) + TIME_TO_KEEP
				shouldMove = filetime < time.time()
				print "  ",("Move" if shouldMove else "Keep"),filename

				if shouldMove:
					try:
						#print "moving ["+fullFilePath+"] to ["+destPath+"]"
						shutil.move(fullFilePath, destPath)
					except shutil.Error, err:
						print "!!!!",err

		print

print