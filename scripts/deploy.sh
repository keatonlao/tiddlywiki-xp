#!/usr/bin/env bash
# deploy.sh

USERNAME='keatonlao'
REPOSITORYNAME='tiddlywiki-xp'
WIKIPATH='/data/tiddlywiki/publish/tiddlywiki-xp'

# If a command fails then the deploy stops
set -e

echo -e "\033[0;31;1m+ $USERNAME/$REPOSITORYNAME\033[0m"
printf "\033[0;32mDeploying updates to remote repository...\033[0m\n"
cd $WIKIPATH

# PUSH
#--------------------------------------
# Commit Message
msg="Initial commit"
if [ -n "$*" ]; then
    msg="$*"
fi
#--------------------------------------
# Add changes to git
git add .
# Commit changes
git commit -m "$msg"
# Cleanup unnecessary files and optimize the local repository
git gc --prune=now
# Update the remote repository
git push origin master
#--------------------------------------
echo -e "\033[0;32mDone!\033[0m"

echo -e "\n\033[0;33mGitee Pages\033[0m: \033[0;34mhttps://gitee.com/$USERNAME/$REPOSITORYNAME/pages\033[0m"
echo -e "Please go to Gitee to update the site manually!\nSee also: https://gitee.com/help/articles/4136#article-header0"
