# This file should only run once for the OSX configuration, so that static configurtation changes are made.
# New shell sessions should not run this file.

# change shell to bash
chsh -s /bin/bash
echo "Your shell is now $SHELL"

# create dev dir symlink
ln -s $HOME/Documents/dev $HOME/dev

# disable Airdrop - which fixes WiFi laptop dropout issues on older OSX (pre Lion)
#sudo ifconfig awdl0 down

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

# disable GPG signing every commit
git config --global --unset commit.gpgsign

# Set git to use the osxkeychain credential helper
git config --global credential.helper osxkeychain
git config -l

# Add Scala syntax handling to vi
mkdir -p ~/.vim/{ftdetect,indent,plugin,syntax} && for d in ftdetect indent syntax ; do curl -o ~/.vim/$d/scala.vim https://raw.githubusercontent.com/scala/scala-tool-support/master/tool-support/vim/$d/scala.vim; done
curl -o ~/.vim/plugin/31-create-scala.vim https://raw.githubusercontent.com/scala/scala-tool-support/master/tool-support/vim/plugin/31-create-scala.vim

# maven bash completion
cp -R osx/usr /.

# install vim pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
touch ~/.vimrc
sed -i .bak '1s/^/" add pathogen support\nexecute pathogen#infect()\n\n/' ~/.vimrc

# opt out of HomeBrew analytics
which brew &> /dev/null && brew analytics off

