#!/usr/bin/env bash

# This file is intended to be used by Hazel.
# It takes an avi file calls tvrenamer.pl to rename the file

# Carlos Fonseca
# carlosefonseca@gmail.com
# 2011-04-30

~/Code/tvrenamer.pl --scheme=XxYY --dubious --include-series --unattended --chdir="`dirname "$1"`"