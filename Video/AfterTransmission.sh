#!/usr/bin/env bash

echo "TR_TORRENT_DIR: $TR_TORRENT_DIR"
echo "TR_TORRENT_NAME: $TR_TORRENT_NAME"

echo "$TR_TORRENT_DIR/$TR_TORRENT_NAME" > ~/Desktop/log

F="$TR_TORRENT_DIR/$TR_TORRENT_NAME"


/Users/carlos/Dropbox/Code/small-scripts/Video/autoConvert.sh "$TR_TORRENT_DIR/$TR_TORRENT_NAME" >>~/Desktop/log 2>&1
