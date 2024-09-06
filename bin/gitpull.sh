#!/usr/bin/env bash
#
# Pull an update for a bunch of git repos in my dev env
# assume ln -s Documents/dev dev on OSX
#

for path in `pwd`/*; do
    [ -d "${path}" ] || continue # if not a directory, skip
    [ -d "${path}/.git" ] || continue # skip if not a git repo
    dirname="$(basename "${path}")"
    echo "found git repo: $path"
    #continue
    cd $path  && git pull
done

### Another way of doing this, may be more reliable

# find . -type d -depth 1
#set REPOS = `find repos -type d -depth 1`
#echo $REPOS
#find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
#find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;