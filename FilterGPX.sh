#!/usr/bin/env bash

# This script takes a GPX file and filters out the waypoints that are out of the bounds.
# For what I need, uptter and lower latitude bounds are enough but
# adding left and right bounds for the longitude is easy.

# I've made this for the http://against.org/munzee/top_players.php GPX files.
# I don't know how well this works with other formatings.

perl -pe 's/\n//;s/<wpt/\n<wpt/;' $1 | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' ; echo ""