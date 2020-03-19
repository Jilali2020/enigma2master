#!/bin/sh

echo "> Proccesing Update"
opkg update &>/dev/null
apt update &>/dev/null
echo "> Linux updates ready"
echo "> Moment please installing Bash"
if opkg list_installed bash* | grep "bash*" &>/dev/null; then			
		echo "> Bash Installed ... skipping"			
	else
		opkg install bash &>/dev/null
		echo "> Bash install ready"
fi
rm -r /tmp/start.sh
