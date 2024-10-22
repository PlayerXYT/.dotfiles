alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias l='ls -la --color=auto'

alias rm='rm -rfd'
alias mkdir='mkdir -p'
alias pwd='pwd -P'
alias egrep='grep -E --color=auto'
alias grep='grep --color=auto'
alias psql='psql -U postgres'
alias cp='cp -r'

mkfl() {
	if [[ -z $1 ]]; then
		echo No file specified!
		return
	elif [[ $1 = -h ]]; then
		echo -e "Makes a file and its parent directories\nUsage:\n mkfl [file path]\n mkfl [file path] [permissions]"
		return
	fi
	mkdir -p $1
	rm -d $1
	touch $1

	if [[ -n $2 ]]; then
		chmod $2 $1
	fi
}

chmod-calc() {
	if [[ -z $1 ]]; then
		echo No permission specified!
		return
	elif [[ $1 = -h ]]; then
		echo -e "Calculates the chmod value for a permission\nUsage: chmod-calc [r][w][x]"
		return
	fi
	TOTAL=0
	if [[ $1 = *r* ]]; then
		TOTAL=4
	fi
	if [[ $1 = *w* ]]; then
		TOTAL=$(($TOTAL+2))
	fi
	if [[ $1 = *x* ]]; then
		TOTAL=$(($TOTAL+1))
	fi
	echo $TOTAL
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
		echo -en "Versions available: \e[0;1m"
		\ls /usr/lib/jvm -1 | tail -n +3 | sed -E "s/java-([0-9]+)-\w+/\1/" | tr "\n" " "
		echo -e "\e[0m"
		\ls -l /usr/lib/jvm | head -n 3 | tail -n 2 | sed -E "s/^.+?def/def/; s/\/.+?\///"
	elif [[ $1 = -h ]]; then
		echo -e "Changes the JVM version in use\nUsage:\n jvmver - lists jvm versions available\n jvmver [version] - changes the jvm version (requires sudo)"
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
alias vidiff='nvim1 -d'
alias vimdiff='nvim1 -d'
alias nvimdiff='nvim1 -d'

if [[ $PATH != */opt/custom* ]]; then
	export PATH=$PATH:/opt/custom
fi

if [[ $(whoami) != root ]]; then
	alias clear='clear ; neofetch'
	neofetch
fi
