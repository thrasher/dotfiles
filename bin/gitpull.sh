#/bin/bash
#
# Pull an update for a bunch of git repos in my dev env
# assume ln -s Documents/dev dev on OSX
#

for path in $HOME/dev/*; do
    [ -d "${path}" ] || continue # if not a directory, skip
    [ -d "${path}/.git" ] || continue # skip if not a git repo
    dirname="$(basename "${path}")"
    echo "found git repo: $path"
    #continue
    cd $path  && git pull
done
