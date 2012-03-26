#!/usr/bin/env sh

#EXECS
echo $s
RENAME="/Users/carlos/Code/tvrenamer.pl --scheme=XxYY --dubious --include-series --unattended --chdir='$s'"
HandBrakeCLI="/Users/carlos/Dropbox/Code/small-scripts/Video/HandBrakeCLI"

#PATHS
iTUNES="/Users/carlos/Dropbox/iTunes/iTunes Media/Automatically Add to iTunes.localized/"
CONVERT="/Users/carlos/Movies/MP4"

DIR=`dirname "$1"`


if [ ! -e "$1" ]; then
    echo "File doesn't exist."
    exit
fi

if [ ! -d "$CONVERT" ]; then
	mkdir $CONVERT
fi
INOD=`stat -f %i "$1"`

s=`echo $1 | perl -lane '$v="@F[0..20]"; $v=~m/(\/([^\/]+\/)+)/g; print \$1'`


/Users/carlos/Code/tvrenamer.pl --scheme=XxYY --dubious --include-series --unattended --chdir="$s"

NEWFILE=`find "$DIR" -inum $INOD -print`
F=$NEWFILE

NAME=`basename "$F"`
EXT=`echo $F | sed -E 's/^.*\.([^.*])/\1/'`
echo $EXT

if [ $EXT == "mp4" ]; then
	echo "no need to convert"
	cp -v "$F" "${F}0"
    mv "${F}0" "/Users/carlos/Dropbox/iTunes/iTunes Media/Automatically Add to iTunes.localized/$NAME"
    #echo mv "\"${F}0\" \"/Users/carlos/Music/iTunes/iTunes Media/Automatically Add to iTunes.localized/$NAME\""
else


FILE=`basename -s .avi "$F"`.m4v
OUT="$CONVERT/$FILE"
echo "Converting \"$F\" to \"$OUT\""
nice -n +100 $HandBrakeCLI -i "$F" -o "$OUT" --preset="iPhone & iPod Touch"
mv "$OUT" "$iTUNES"

fi