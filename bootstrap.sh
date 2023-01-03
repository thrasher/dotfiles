#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "bootstrap-osx.sh" \
		--exclude ".bash*" \
		--exclude "brew.sh" \
		--exclude "README*" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "shell.png" \
		--exclude "osx" \
		--exclude "osx-terminal.app-colors-solarized" \
		-avh --no-perms . ~;
	source ~/.zprofile;
}
echo "$1"

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	doIt;
else
	read -q "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
