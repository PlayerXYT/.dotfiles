alias ls='ls -A --color=auto'
alias l='ls -la --color=auto'

alias rm='rm -rfd'
alias mkdir='mkdir -p'
alias pwd='pwd -P'
alias egrep='grep -E'

mkfl() {
	mkdir -p $1
	rm -d $1
	touch $1
}

alias vi='nvim'
alias vim='nvim'

export LC_ALL="en_CA.UTF-8" # Idiot

neofetch
