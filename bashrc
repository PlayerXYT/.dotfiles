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

findin() {
	if test -z $1; then
		echo No string specified!
		return
	fi

	for i in $(find -type f); do
		if grep -q $1 $i; then
			echo $i
		fi
	done
}

alias vi='nvim'
alias vim='nvim'

export LC_ALL="en_CA.UTF-8"

if test $(whoami) != root; then
	alias clear='clear ; neofetch'
	neofetch
fi
