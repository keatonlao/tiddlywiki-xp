#!/usr/bin/env bash
# rebuild.sh
# 该脚本会删除所有历史记录！

USERNAME='keatonlao'
REPOSITORYNAME='tiddlywiki-xp'
WIKIPATH='/data/tiddlywiki/publish/tiddlywiki-xp'
LOGFILE='commit_deleted.log'

# If a command fails then the deploy stops
set -e  

echo -e "\033[0;31;1m+ $USERNAME/$REPOSITORYNAME\033[0m"
printf "\033[0;32mRebuilding local repository...\033[0m\n"
cd $WIKIPATH

# 删除历史记录
#--------------------------------------
# 对分支的历史提交信息进行保存
if [ ! -f "$LOGFILE" ]; then
    touch $LOGFILE
fi
echo -e "`git log --graph --pretty=format:"%cd %s" --date=format:"%F %T"`\n" | cat - $LOGFILE > temp && mv temp $LOGFILE
# 添加未被追踪的文件
git add -A
# 将当前工作区的内容修改暂存起来
git stash
# 新建分支
git checkout --orphan latest_branch
# 将暂存的修改放到新建分支中
git stash pop
# Add all the files
git add -A
# Commit changes
msg="Initial commit"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -am "$msg"
# Delete the branch
git branch -D master
# Rename the current branch to master
git branch -m master
#--------------------------------------

# 清理垃圾
#--------------------------------------
# 对 .git/objects/pack/ 下的包文件，进行重建索引
git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch .git/objects/pack/pack-*.pack' --prune-empty
# 删除和重建的索引
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
# 设置 reflog 过期
git reflog expire --expire=now --all
# Cleanup unnecessary files and optimize the local repository
git gc --aggressive --prune=now
#--------------------------------------

# PUSH
#--------------------------------------
echo -e "\n\033[0;32mDeploying updates to remote repository...\033[0m"
# Force update the remote repository
git push -f origin master
#--------------------------------------
echo -e "\033[0;32mDone!\033[0m"


echo -e "\n\033[0;33mGitee Pages\033[0m: \033[0;34mhttps://gitee.com/$USERNAME/$REPOSITORYNAME/pages\033[0m"
echo -e "Please go to Gitee to update the site manually!\nSee also: https://gitee.com/help/articles/4136#article-header0"
