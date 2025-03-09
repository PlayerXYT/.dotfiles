#!/bin/bash

current_ip=$(curl ident.me)

if [[ $(cat last_ip) != $current_ip ]]; then
	echo -n $current_ip > last_ip
	curl https://www.duckdns.org/update/$(cat url)/$(cat key)
fi
