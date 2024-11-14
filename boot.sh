#!/bin/bash

if [[ $(cat last_ip) != $(curl ident.me) ]]; then
	curl ident.me > last_ip
	curl https://www.duckdns.org/update/$(cat url)/$(cat key)
fi
