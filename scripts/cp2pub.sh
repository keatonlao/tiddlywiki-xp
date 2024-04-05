#!/usr/bin/env bash
# cp2pub.sh
# copy files to publish dir

SRC='/data/tiddlywiki/workspace/tiddlywiki-xp'
DEST='/data/tiddlywiki/publish/tiddlywiki-xp'

rsync -avq $SRC/cp2pub.sh $DEST/scripts/

rsync -avzuP $SRC/tiddlywiki-xp_Tutorials.html $DEST/index.html
rsync -avzuP $SRC/{tiddlywiki-xp.zip,tiddlywiki-xp_Server.zip,tiddlywiki-xp_Tutorials.zip,tiddlywiki_Empty.zip} $DEST/version/
rsync -avzuP $SRC/PluginforSingleFileVersion.zip $DEST/plugins/