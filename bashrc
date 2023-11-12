alias ls='ls -A --color=auto'
alias l='ls -la --color=auto'

alias rm='rm -rfd'
alias mkdir='mkdir -p'
alias pwd='pwd -P'
alias egrep='grep -E'
alias psql='psql -U postgres'

mkfl() {
	mkdir -p $1
	rm -d $1
	touch $1
}

whipe() {
	if test -z $1; then
		echo No file specified!
		return
	fi
	head /dev/urandom -c $(du -b $1 | cut -f1) > $1
	rm $1
}

jvmver() {
	if test -z $1; then
		echo No version specified!
		ls /usr/lib/jvm
		return
	fi
	sudo rm /usr/lib/jvm/default-runtime
	sudo ln -s /usr/lib/jvm/java-$1-openjdk /usr/lib/jvm/default-runtime
}

alias vi='nvim'
alias vim='nvim'

export LC_ALL="en_CA.UTF-8"

if test $(whoami) != root; then
	alias clear='clear ; neofetch'
	neofetch
fi
