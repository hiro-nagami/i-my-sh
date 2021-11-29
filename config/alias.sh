#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

# alias (standard)
alias srczsh='source $ZSHRC && echo sink zsh.'
alias vimzsh='vim $ZSHRC && echo open zsh.'
alias editzsh='vimzsh && srczsh'
alias symbolicate='DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer" | /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash'

alias l='ls'
alias la='ls -a'
alias ll='l -l'
alias lla='ll -a'
alias lg='la | grep'
alias t='touch'

alias get_script_path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
alias get_script_name=$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")

alias psgrp='ps aux | grep'

function git_paths()
{
	echo $(ghq list -p | peco)
}

function gcd()
{
	cd $(git_paths)
}

function carthage_w()
{
	set -euo pipefail

	xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
	trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

	# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
	# the build will fail on lipo due to duplicate architectures.

	CURRENT_XCODE_VERSION=$(xcodebuild -version | grep "Build version" | cut -d' ' -f3)
	echo "EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_$CURRENT_XCODE_VERSION = arm64 arm64e armv7 armv7s armv6 armv8" >> $xcconfig

	echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_$(XCODE_PRODUCT_BUILD_VERSION))' >> $xcconfig
	echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $xcconfig

	export XCODE_XCCONFIG_FILE="$xcconfig"
	carthage "$@"
}

