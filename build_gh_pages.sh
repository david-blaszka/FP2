#!/bin/sh
<<<<<<< HEAD
git_branch="$(git rev-parse --abbrev-ref HEAD)"
echo $git_branch
=======
working_git_branch="$(git rev-parse --abbrev-ref HEAD)"
>>>>>>> uwpce
git checkout gh-pages
rm -rf build/*
git merge --commit --no-edit $working_git_branch
touch .nojekyll  # Make sure the repo has this file in its root, otherwise it will not render on github.io
make html
open build/html/index.html  # On OS X this launches the rendered page into a browser; need something else for Linux or Windows
git add *
git commit -a --no-edit -m "Updating presentation materials"
git pull -s ours --no-edit
git push
git checkout $working_git_branch
