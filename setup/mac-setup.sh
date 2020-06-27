{
    if $(type ruby > /dev/null 2>&1); then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo 'Ruby is not installed. Cannot install brew.'
	fi

    printf "${GREEN}"
    echo "Do you install nvm? (y/n)"
    printf "${NORMAL}"
    read answer
    if [ ${answer} = "y" ]; then
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
        echo 'Finished installing nvm.'
    fi

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
