#!/usr/bin/env bash
s=`echo $1 | perl -lane '$v="@F[0..20]"; $v=~m/(\/([^\/]+\/)+)/g; print \$1'`
~/Code/tvrenamer.pl --scheme=XxYY --dubious --include-series --unattended --chdir="$s"