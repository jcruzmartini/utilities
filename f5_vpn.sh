#!/bin/bash

VPN_USER="i99339"
VPN_PASS=""
VPN_SERVER="vpn.g2netview.com"

case $1 in
'start')
	PROGRESS="."
       	date
       	echo "Connecting to VPN user [$VPN_USER]"
	f5fpc -s -t $VPN_SERVER -u $VPN_USER -p $VPN_PASS
	OUTPUT="$(f5fpc --info | grep -1 'fav-Status' | grep 'established')"
	while [[ $OUTPUT != *"established"* ]]
	do	
		echo -ne $PROGRESS
		OUTPUT="$(f5fpc --info | grep -1 'fav-Status' | grep 'established')"
		PROGRESS+="."		
		sleep 1
		f5fpc --info	
	done
	echo "Connection Ready"
	f5fpc --info
        ;;
'stop')
       	date
       	echo "disconnecting to VPN for user [$VPN_USER]"
	f5fpc -o
	echo "Connection Closed"
        ;;
'info')
        date
        f5fpc --info
        ;;
esac
