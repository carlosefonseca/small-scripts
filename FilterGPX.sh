#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
	curl -o tmp.gpx "http://against.org/munzee/generate_gpx.php?whatever-"
	GPX=tmp.gpx
	perl -pe 's/\n//;s/<wpt/\n<wpt/;' $GPX | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' > ~/Dropbox/munzee-centro.gpx
	~/Code/growl.sh -nosticky "Munzee GPX updated."
	rm tmp.gpx
else 
	GPX=$1
	perl -pe 's/\n//;s/<wpt/\n<wpt/;' $GPX | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' ; echo ""
fi

