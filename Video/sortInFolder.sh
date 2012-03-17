#!/usr/bin/env bash

echo "\$1:	  $1"
FILENAME=`basename "$1"`
echo "FILENAME: $FILENAME"
DIRNAME=`echo $FILENAME | perl -pe 's/(.*) ([0-9]{1,2}x)[0-9]{1,2} - .*/\1 \2/i ; \
																		s/(.*)[\. -_]S0([0-9]).*/\1 \2x/i ; \
																		s/(.*)[\. -_]S([0-9]{2}).*/\1 \2x/i ; \
																		s/.2009// ; \
																		s/\./ /g'`


DIRNAMEs=`echo "$DIRNAME" | perl -pe '$_=lc;s/([^ ]+)/\u$1/g'`

echo "DIRNAMEs:  $DIRNAMEs"


if [ "$DIRNAMEs" = "O-n-c-e-u-p-o-n-a-t-i-m-e 1x" ]; then
    DIRNAMEs="Once Upon A Time 1x"
    echo "######### NEW DIRNAME: $DIRNAMEs"
fi

FULLDIRNAME="`dirname "$1"`/$DIRNAMEs"
echo "FULLDIRN: $FULLDIRNAME"


if [ ! -d "$FULLDIRNAME" ]; then
	echo "FULLDIRNAME does not exist"
	mkdir "$FULLDIRNAME"
fi

if [ $# -eq 1 ]; then
	mv "$1" "$FULLDIRNAME"
else
	echo "mv \"$1\" \"$FULLDIRNAME\""
fi

echo "$FULLDIRNAME/$FILENAME"