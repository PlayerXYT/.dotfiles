alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias l='ls -la --color=auto'

alias rm='rm -rfd'
alias mkdir='mkdir -p'
alias pwd='pwd -P'
alias egrep='grep -E --color=auto'
alias grep='grep --color=auto'
alias psql='psql -U postgres'

mkfl() {
	if [[ $1 = -h ]]; then
		echo -e "Makes a file and its parent directories\nUsage: mkfl [file path]"
		return
	fi
	mkdir -p $1
	rm -d $1
	touch $1
}

whipe() {
	if [[ -z $1 ]]; then
		echo No file specified!
		return
	elif [[ $1 = -h ]]; then
		echo -e "Overwrites a file with random data before removing it\nUsage:\n whipe [file] - Scramble file once\n whipe -r [count] [file] - Scramble file multiple times"
		return
	fi

	if [[ $1 = -r ]]; then
		if [[ -z $3 ]]; then
			echo Invalid usage
			return
		fi

		for i in $(seq 2 $2); do
			head /dev/urandom -c $(du -b $FILE | cut -f1) > $FILE
		done
		FILE=$3
	else
		FILE=$1
	fi

	head /dev/urandom -c $(du -b $FILE | cut -f1) > $FILE
	rm $FILE
}

jvmver() {
	if [[ -z $1 ]]; then
		echo No version specified!
		ls /usr/lib/jvm
	elif [[ $1 = -h ]]; then
		echo -e "Changes the JVM version in use\nUsage:\n jvmver - lists jvm versions available\n jvmver c - prints the current jvm version\n jvmver [version] - changes the jvm version (requires sudo)"
	elif [[ $1 = c ]]; then
		ls -l /usr/lib/jvm | head -n 3 | tail -n 2
	elif [[ $1 =~ [^0-9] ]]; then
		echo Invalid command or version, version must be a number
	else
		sudo rm /usr/lib/jvm/default-runtime
		sudo rm /usr/lib/jvm/default
		sudo ln -s /usr/lib/jvm/java-$1-openjdk /usr/lib/jvm/default-runtime
		sudo ln -s /usr/lib/jvm/java-$1-openjdk /usr/lib/jvm/default
	fi
}

wayland() {
	if [[ -z $WAYLAND_DISPLAY ]]; then
		echo Not using wayland
	else
		echo Using wayland
	fi
}

efeh() {
	if [[ -z $1 ]]; then
		echo No image specified!
		return
	elif [[ $1 = -h ]]; then
		echo -e "Shows a remote image by downloading it via curl\nUsage: efeh [image url]"
		return
	fi
	TYPE=${1##*.}
	curl -o /tmp/efeh.$TYPE $1
	feh /tmp/efeh.$TYPE
	rm /tmp/efeh.$TYPE
}

evlc() {
	if [[ -z $1 ]]; then
		echo No video specified!
		return
	elif [[ $1 = -h ]]; then
		echo -e "Shows a remote video by downloading it via curl\nUsage: evlc [video url]"
		return
	fi
	TYPE=${1##*.}
	curl -o /tmp/evlc.$TYPE $1
	vlc /tmp/evlc.$TYPE
	rm /tmp/evlc.$TYPE
}

# For some reason this doesn't work in the vimrc
nvim1() {
	nvim $@
	echo -ne "\e[5 q"
}

alias vi='nvim1'
alias vim='nvim1'

export PATH=$PATH:/opt/custom

if [[ $(whoami) != root ]]; then
	alias clear='clear ; neofetch'
	neofetch
fi
