{
	if [ "$(uname)" == 'Darwin' ]; then
	  OS='Mac'
	elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	  OS='Linux'
	elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	  OS='Cygwin'
	else
	  echo "Your platform ($(uname -a)) is not supported."
	  exit 1
	fi

	source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config.sh"


	if $(type ruby > /dev/null 2>&1); then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo 'Ruby is not installed. Cannot install brew.'
	fi

	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
	echo 'Finished installing nvm.'

	if $(type brew > /dev/null 2>&1); then
		brew install go
		brew install npm
		brew install peco
		brew install shellcheck
		brew tap Homebrew/bundle
	else
		echo 'Brew is not installed. Cannot install go, npm, peco, shellcheck and brewBundler.'
	fi


	if $(type go > /dev/null 2>&1); then
		mkdir $GOPATH
		go get github.com/motemen/ghq
	else
		echo 'Go is not installed. Cannot install go, npm, peco, shellcheck and ghq.'
	fi

	if $(type ghq > /dev/null 2>&1); then
		ghq get https://github.com/git/git.git
		ghq get https://github.com/hiro-nagami/mysh.git
		cd $HOME/.ghq/github.com/hiro-nagami/mysh

		#rm -rf $(cd -)
		unset MYSH_DIR
		source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config.sh"

		ghq get https://github.com/zsh-users/zsh-autosuggestions.git
		ghq get https://github.com/sstephenson/rbenv.git
		ghq get https://github.com/sstephenson/ruby-build.git

		ln -s $HOME/.ghq/github.com/sstephenson/rbenv $HOME/.rbenv
		ln -s $HOME/.ghq/github.com/sstephenson/ruby-build $HOME/.rbenv/plugins/ruby-build
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
		if [ "$(OS)" == 'Mac']; then
			if $(type brew > /dev/null 2>&1); then
				brew install zsh
			fi
		elif [ "$(OS)" == 'Linux' ]; then
			if $(type yum > /dev/null 2>&1); then
				sudo yum update && sudo yum -y install zsh
			fi
		fi
	fi

	if $(type zsh > /dev/null 2>&1); then
		zsh
		source $HOME/.zshrc
	fi
}
