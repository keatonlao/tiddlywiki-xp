#!/usr/bin/env bash

printf "\033[0;32mRefactor commit... (local)\033[0m\n"

WIKIPATH='/DATA/TW5/publish/tiddlywiki-xp'
cd $WIKIPATH
# Add changes to git.
git add .
# Commit changes.
msg="refactor"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"