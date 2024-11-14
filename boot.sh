if [[ $(cat last_ip) != $(curl ident.me) ]]; then
	curl https://www.duckdns.org/update/$(cat url)/$(cat key)
fi
