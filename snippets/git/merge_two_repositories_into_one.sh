#!/bin/bash
# Use merge_two_repositories_into_one.sh [repository_one_name] [repository_one_url] [repository_two_name] [repository_two_url]
# ToDo add loop to merge many repositories from list in file .git_merged_repositories

git init

echo "add repository $1" > merge_two_repositories.txt
git add .
git commit -m "add repository $1"
git remote add -f $1 $2
git merge $1/master
mkdir $1
dir –exclude $1 | %{git mv $_.Name $1}
git commit -m “Move $1 files into subdir”

git remote add -f $3 $4
git merge $3/master
mkdir $3
dir –exclude $3 | %{git mv $_.Name $3}
git commit -m “Move $1 files into subdir”
