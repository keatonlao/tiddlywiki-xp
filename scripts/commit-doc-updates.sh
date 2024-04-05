#!/usr/bin/env bash

printf "\033[0;32mCommit doc updates... (local)\033[0m\n"

WIKIPATH='/data/tiddlywiki/publish/tiddlywiki-xp'
cd $WIKIPATH
# Add changes to git.
git add index.html version/tiddlywiki-xp_Tutorials.zip
# Commit changes.
msg="docs: update tutorial"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"