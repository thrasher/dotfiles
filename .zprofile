# .zprofile is run for the login shell in Terminal, but not for each interactive shell invoked (ex: calling /bin/zsh in an existing shell)

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# disable HomeBrew Google Analytics
export HOMEBREW_NO_ANALYTICS=1

# install gcloud tools
#   curl https://sdk.cloud.google.com | bash
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/opt/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/opt/google-cloud-sdk/completion.bash.inc'; fi
