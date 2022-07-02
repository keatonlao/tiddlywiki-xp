#!/usr/bin/env bash
# cp2pub.sh
# copy files to publish dir

SRC='/DATA/TW5/workspace/tiddlywiki-xp'
DEST='/DATA/TW5/publish/tiddlywiki-xp'

rsync -avq $SRC/cp2pub.sh $DEST/scripts/

rsync -avzuP $SRC/tiddlywiki-xp_Tutorials.html $DEST/index.html
rsync -avzuP $SRC/{tiddlywiki-xp_Plugins.zip,tiddlywiki-xp_Server.zip,tiddlywiki-xp_Tutorials.zip} $DEST/version/
rsync -avzuP $SRC/PluginforSingleFileVersion.zip $DEST/plugins/