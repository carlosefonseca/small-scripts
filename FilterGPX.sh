#!/usr/bin/env bash

# This script takes a GPX file and filters out the waypoints that are out of the bounds.
# For what I need, uptter and lower latitude bounds are enough but
# adding left and right bounds for the longitude is easy.
#
# I've made this for the http://against.org/munzee/top_players.php GPX files.
# I don't know how well this works with other formatings.
#
# If a file is not specified as an argument, it will be downloaded

if [[ $# -eq 0 ]]; then
	curl -o tmp.gpx "http://against.org/munzee/generate_gpx.php?whatever-"
	GPX=tmp.gpx
	perl -pe 's/\n//;s/<wpt/\n<wpt/;' $GPX | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' > ~/Dropbox/munzee-centro.gpx
	/usr/local/bin/growlnotify -t "Munzee GPX" -m "updated"
	rm tmp.gpx
else 
	GPX=$1
	perl -pe 's/\n//;s/<wpt/\n<wpt/;' $GPX | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' ; echo ""
fi
