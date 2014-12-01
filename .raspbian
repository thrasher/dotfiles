#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name
oldhostname=$(cat /etc/hostname)
newhostname=onionpi

for file in \
   /etc/exim4/update-exim4.conf.conf \
   /etc/printcap \
   /etc/hostname \
   /etc/hosts \
   /etc/motd \
   /etc/ssmtp/ssmtp.conf \
   `find /etc/ssh -type f | xargs sudo grep -l "$oldhostname" | grep -v "\.old$"`
do
   if [ -f $file ] ; then
     echo "Updating hostname in $file"
     sudo sed -i.old -e "s:$oldhostname:$newhostname:g" $file
   fi
done
sudo hostname $newhostname

function doIt() {
	rsync --exclude=".git/" \
		--exclude=".osx" \
		--exclude=".DS_Store" \
		--exclude=".gvimrc" \
		--exclude="bootstrap.sh" \
		--exclude="README.md" \
		--exclude="LICENSE-MIT.txt" \
		--exclude="Caskfile" \
		--exclude="Brewfile" \
		--exclude=".extras" \
		--exclude=".raspbian" \
		--exclude="bin/bash" \
		--exclude="bin/subl" \
		 -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

source .extras
# enable credential caching
git config --global credential.helper 'cache --timeout 3600'

echo "Done. Note that some of these changes require a logout/restart to take effect."
