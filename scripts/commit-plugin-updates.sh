#!/usr/bin/env bash

printf "\033[0;32mCommit plugin updates... (local)\033[0m\n"

WIKIPATH='/data/tiddlywiki/publish/tiddlywiki-xp'
cd $WIKIPATH
# Add changes to git.
git add plugins/PluginforSingleFileVersion.zip version/{tiddlywiki-xp.zip,tiddlywiki-xp_Server.zip}
# Commit changes.
msg="fix: update plugins"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"