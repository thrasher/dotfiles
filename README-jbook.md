# jbook.local machine setup notes

## OSX Updates and Command Line Tools

    # Initiate command line tools installation
    git clone https://github.com/thrasher/dotfiles

    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
    brew install keychain

    # create a private/public keypair
    ssh-keygen -t rsa -C jason@jbook.thrasher.me

    # config OSX
    cd dotfiles
    ./bootstrap.sh
    ./bootstrap-osx.sh
    ./.macos

## App Store Apps

	Slack.app
	Pixelmator.app
	Go2Shell.app
    Magnet.app

## Download and Install

    (JDK8)[http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html]
    (JDK10)[http://www.oracle.com/technetwork/java/javase/downloads/jdk10-downloads-4416644.html]
    (Eclipse.app)[https://www.eclipse.org/downloads/]
    (SizeUp.app)[http://www.irradiatedsoftware.com/sizeup/] (optional)
    (Arduino.app)[https://www.arduino.cc/download_handler.php?f=/arduino-1.8.5-macosx.zip]
    (Sublime Text.app)[https://www.sublimetext.com/3]
    (Google Chrome.app)[https://www.google.com/chrome/]
