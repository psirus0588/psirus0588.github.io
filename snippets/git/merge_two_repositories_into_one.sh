#!/bin/bash
# Use merge_two_repositories_into_one.sh [new_repository_name] [repository_one_name] [repository_one_url] [repository_two_name] [repository_two_url]
# ToDo add loop to merge many repositories from list in file .git_merged_repositories

mkdir $1 && cd $1
git init

echo "add repository $2" > merge_two_repositories.txt
git add .
git commit -m "add repository $2"
git remote add -f $2 $3
git merge $2/master
mkdir $2
dir –exclude $2 | %{git mv $_.Name $2}
git commit -m “Move $2 files into subdir”

git remote add -f $4 $5
git merge $4/master
mkdir $4
dir –exclude $4 | %{git mv $_.Name $4}
git commit -m “Move $4 files into subdir”
