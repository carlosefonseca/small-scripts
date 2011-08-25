#!/usr/bin/env bash

perl -pe 's/\n//;s/<wpt/\n<wpt/;' $1 | perl -ne 'my $hilat=39.3;my $lowlat=38.68;if(! m/wpt/) {print;}else{m/lat="(\d+\.\d+)/;if($1>$lowlat and $1<$hilat){print;}}' ; echo ""