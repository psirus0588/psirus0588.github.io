# Git

#### Update .gitignore in repository
    git rm -r --cached .

  
#### Create a new branch from commit:
    git checkout -b new_branch commit_hash

back N commits from HEAD

    git checkout -b new_branch HEAD~N


### Update fork from upstream

    git remote add upstream [ssh_or_https_link_to_upstream_repository]
    git fetch upstream
    git pull upstream master
