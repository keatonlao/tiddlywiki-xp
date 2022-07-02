#!/usr/bin/env bash

printf "\033[0;32mCommit plugin updates... (local)\033[0m\n"

WIKIPATH='/DATA/TW5/publish/tiddlywiki-xp'
cd $WIKIPATH
# Add changes to git.
git add plugins/PluginforSingleFileVersion.zip version/{tiddlywiki-xp_Plugins.zip,tiddlywiki-xp_Server.zip}
# Commit changes.
msg="fix: update plugins"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"