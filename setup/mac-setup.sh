{
    if $(type ruby > /dev/null 2>&1); then
		echo 'Start installing homebrew.'
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
		echo 'Finished installing homebrew.'
	else
		echo 'Ruby is not installed. Cannot install brew.'
	fi

	if $(type brew > /dev/null 2>&1); then
		echo 'Start installing brew packages.'
		brew upgrade
		brew bundle
		echo 'Finished installing brew packages.'
	else
		echo 'Brew is not installed. Cannot install go, npm, peco, shellcheck and brewBundler.'
	fi

	if $(type git > /dev/null 2>&1); then
		echo 'Start installing goenv.'
		# https://github.com/syndbg/goenv
		git clone https://github.com/syndbg/goenv.git ~/.goenv
		echo 'Finished installing goenv.'
	fi

	if $(type goenv > /dev/null 2>&1); then
		echo 'Start installing go.'
		goenv install 1.17.3
		goenv global 1.17.3
		echo 'Finished installing go.'
	fi

	if $(type go > /dev/null 2>&1); then
		echo 'Start installing ghq.'
		go get github.com/x-motemen/ghq
		git config --global ghq.root '~/.ghq'
		echo 'Finished installing ghq.'
	else
		echo 'Go is not installed. Cannot install go, npm, peco, shellcheck and ghq.'
	fi


	if $(type rbenv > /dev/null 2>&1); then
		echo 'Start installing ruby.'
		rbenv install 2.6.0
		rbenv global 2.6.0
		echo 'Finished installing ruby.'
	fi

	if $(type gem > /dev/null 2>&1); then
		gem install cocoapods
	fi

	if $(type ghq > /dev/null 2>&1); then
		echo 'Start installing ghq packages.'
		ghq get https://github.com/git/git.git
		ghq get https://github.com/hiro-nagami/i-my-sh.git
		cd $HOME/.ghq/github.com/hiro-nagami/i-my-sh

		#rm -rf $(cd -)
		unset MYSH_DIR
		source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config/config.sh"

		ghq get https://github.com/zsh-users/zsh-autosuggestions.git
		ghq get https://github.com/sstephenson/rbenv.git
		ghq get https://github.com/sstephenson/ruby-build.git

		ln -s $HOME/.ghq/github.com/sstephenson/rbenv $HOME/.rbenv
		ln -s $HOME/.ghq/github.com/sstephenson/ruby-build $HOME/.rbenv/plugins/ruby-build
		echo 'Finished installing ghq packages.'
	else
		echo 'ghq is not installed.'
	fi

	if [ -z "$SOURCED_MYSH" ] && [ "${SOURCED_MYSH:-A}" = "${SOURCED_MYSH-A}" ]; then
		echo "source $MYSH_DIR/my-zsh.sh" >> $HOME/.zshrc
		echo 'export SOURCED_MYSH=true' >> $HOME/.zshrc
	else
		echo 'SOURCED_MYSH is already set.'
	fi

	cd $HOME

	if ! [ $(type zsh > /dev/null 2>&1) ]; then
		echo 'zsh is not installed.'

		if $(type brew > /dev/null 2>&1); then
			brew install zsh
		fi
	fi
}
