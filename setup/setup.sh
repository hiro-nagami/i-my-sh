{
	source "$(cd ../$(dirname ${BASH_SOURCE:-$0}); pwd)/config/config.sh"

	if [ "$(uname)" == 'Darwin' ]; then
	  OS='Mac'
	  ./mac-setup.sh
	elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	  OS='Linux'
	  ./centos-setup.sh
	elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	  OS='Cygwin'
	else
	  echo "Your platform ($(uname -a)) is not supported."
	  exit 1
	fi


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
		env zsh
	fi
}
