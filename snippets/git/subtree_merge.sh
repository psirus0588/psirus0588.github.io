#!/bin/bash
#Use subtree_merge.sh [sub_project_name] [sub_project_url]

git remote add -f $1 $2
git merge -s ours --allow-unrelated-histories --no-commit $1/master
git read-tree --prefix=$1 -u $1/master
git commit -m "Create folder and add sub project $1"
git pull -s subtree $1 master
