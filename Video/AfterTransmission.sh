#!/usr/bin/env bash

echo "TR_TORRENT_DIR: $TR_TORRENT_DIR"
echo "TR_TORRENT_NAME: $TR_TORRENT_NAME"

echo "$TR_TORRENT_DIR/$TR_TORRENT_NAME" > ~/Desktop/log

F="$TR_TORRENT_DIR/$TR_TORRENT_NAME"

EXT=`echo $F | sed -E 's/^.*\.([^.*])/\1/'`
if [ $EXT == "m4v" ]; then
    cp "$F" "/Users/carlos/Music/iTunes/iTunes Media/Automatically Add to iTunes.localized/"
elif [ $EXT == "mp4" ]; then
    F2=`echo $TR_TORRENT_NAME | sed 's/mp4/m4v/'`
    cp "$F" "/Users/carlos/Music/iTunes/iTunes Media/Automatically Add to iTunes.localized/$F2"
else
    /Users/carlos/Dropbox/Code/small-scripts/Video/autoConvert.sh "$TR_TORRENT_DIR/$TR_TORRENT_NAME" >>~/Desktop/log 2>&1
fi