# This file should only run once for the OSX configuration, so that static configurtation changes are made.
# New shell sessions should not run this file.

# Configure my git preferences
git config --global user.name "Jason Thrasher"
git config --global user.email "jasonthrasher@gmail.com"
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.unstage 'reset HEAD'
git config --global alias.last 'log -1 HEAD'

git config --global alias.mrg 'merge --no-ff --no-commit'
git config --global alias.lola 'log --graph --decorate --pretty=oneline --abbrev-commit --all'
git config --global alias.glog "log --graph --full-history --all --color --date=short --pretty=format:'%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %aE %s'"
git config --global branch.mergeoptions '--no-ff --no-commit'
git config --global color.diff auto
git config --global color.ui true

# Set git to use the osxkeychain credential helper
git config --global credential.helper osxkeychain
git config -l

# Add Scala syntax handling to vi
mkdir -p ~/.vim/{ftdetect,indent,syntax} && for d in ftdetect indent syntax ; do curl -o ~/.vim/$d/scala.vim https://raw.githubusercontent.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim; done
