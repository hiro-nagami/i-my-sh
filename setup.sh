{
	source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config.sh"

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
	brew install go
	brew install npm
	brew install peco
	brew tap Homebrew/bundle

	git clone https://github.com/git/git.git $GIT_REPOS

	mkdir $GOPATH

	go get github.com/motemen/ghq

	rm -rf $GIT_REPOS
	ghq get https://github.com/git/git.git
	ghq get https://github.com/hiro-nagami/mysh.git
	cd $HOME/.ghq/github.com/hiro-nagami/mysh

	rm -rf $(cd -)
	unset MYSH_DIR
	source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config.sh"

	ln -s $HOME/.ghq/github.com/git/git $GIT_REPOS

	ghq get https://github.com/zsh-users/zsh-autosuggestions.git
	ghq get https://github.com/sstephenson/rbenv.git
	ghq get https://github.com/sstephenson/ruby-build.git

	ln -s $HOME/.ghq/github.com/sstephenson/rbenv $HOME/.rbenv
	ln -s $HOME/.ghq/github.com/sstephenson/ruby-build $HOME/.rbenv/plugins/ruby-build

	# ssh-keygen -t rsa

    if [ -z "$SOURCED_MYSH" ] && [ "${SOURCED_MYSH:-A}" = "${SOURCED_MYSH-A}" ]; then
        echo "source $MYSH_DIR/my-zsh.sh" >> $HOME/.zshrc
        echo 'export SOURCED_MYSH=true' >> $HOME/.zshrc
	fi

	cd $HOME

	zsh
	source $HOME/.zshrc
}
