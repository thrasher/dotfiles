#!/bin/bash
#
# Simplify protected access to password protected plaintext file using openssl to access a base64 encoded file.
# by: Jason Thrasher 3/11/2014
#

RET=0

PLAIN=$HOME/.notes.csv
# allow for setting the plain file from the command line's second argument
if [[ "$2" ]] ; then
	PLAIN="$2"
fi
ENCODED="$PLAIN.enc"

echo "Using file: $PLAIN"

function encrypt {
	if [[ ! -e "$PLAIN" ]] ; then
		echo "Could not find plain file: $PLAIN"
		exit 1
	fi
	
	# the same, only the output is base64 encoded for, e.g., e-mail
	openssl enc -aes-256-cbc -base64 -salt -in "$PLAIN" -out "$ENCODED"
	
	if [[ -e "$ENCODED" ]] ; then
		rm "$PLAIN" && echo "Removed plain text file: $PLAIN"
		chmod 600 "$ENCODED"
	else
		rm "$ENCODED" && echo "Failed to encrypt plain text file: $PLAIN"
	fi
}

function decrypt {
	if [[ ! -e "$ENCODED" ]] ; then
		echo "Could not find encoded file: $ENCODED"
		exit 1
	fi
	
	# decrypt base64-encoded version
	openssl enc -d -aes-256-cbc -base64 -in "$ENCODED" | native2ascii
}

case $1 in
in)
  encrypt
  ;;
out)
  decrypt
  ;;
*)
  echo "Usage: $0 [in|out] [plain-file]"
  ;;
esac

exit $RET

