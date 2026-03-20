# set my own ZSH parameters

# Configure Sublime Text as the default text editor, by default on MacOS it's not set
export EDITOR='vim' 

# java configuration can also be set from shell with jX, where X = the version, ex: j21
#export JAVA_HOME=$(/usr/libexec/java_home)

#export PATH=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD/:$PATH

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#!/bin/bash
if [ ! -f ~/.ssh/id_ed25519 ] ; then
  echo "You do not have a keypair setup yet, please run: ssh-keygen -t ed25519 -C $USER@`hostname`"
else
  if [ -z `which keychain` ] ; then
    echo "Please install keychain with Homebrew as: brew install keychain"
  else
    keychain id_ed25519
    source ~/.keychain/`uname -n`-sh
  fi
fi

# prefer the homebrew version of python because it is updated
# Source - https://stackoverflow.com/a
# Posted by TruMan1, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-12, License - CC BY-SA 4.0
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# Homebrew: Python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
# MacOS needs an alias, instead of a symlink, otherwise it tires to install developer tools every time python is called
#alias python='/usr/bin/python3'
# however let's use the homebrew version
#alias python='/opt/homebrew/opt/python/libexec/bin/python'
# actually, commenting that out because the alias breaks using python virtual environments

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
#alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Documents/dev"
alias g="git"
alias h="history"
alias j="jobs"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo???ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
#alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
#alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# IP addresses
alias ip="curl -s https://myipv4.p1.opendns.com/get_my_ip | jq -r .ip"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
#alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
#alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the ???Open With??? menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
#alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
#command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
#command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# set jdk version
alias j21="export JAVA_HOME=`/usr/libexec/java_home -v 21`; java -version"
#alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
#alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple???s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
#alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]));"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print (ul.unquote_plus(sys.argv[1]));"'

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn???t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen???s ProTip???s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
#alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# PiShrink via Docker
#alias pishrink='docker run -it --rm --platform linux/arm64 --privileged=true -v $(pwd):/workdir pishrink'

# Meld, see https://gitlab.com/dehesselle/meld_macos#usage
#alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
#alias meld="/usr/local/bin/meld.wrapper.sh"

# When two MacOS users are logged into separate accounts, and the screen size changes (unplugging USB-C monitor),
# the user who is not active will not have proper screen size unless logged out, but logout is difficult unless
# done via terminal due to screen problems.
alias logoutforce="launchctl bootout user/\$(id -u $USER)"
alias logoutconfirm="osascript -e 'tell app \"System Events\" to log out'"
alias logoutnoconfirm="osascript -e 'tell application \"loginwindow\" to  «event aevtrlgo»'"

alias top=top -o cpu

# run with cat ~/some.json| prettyjson
alias prettyjson='python -m json.tool'
