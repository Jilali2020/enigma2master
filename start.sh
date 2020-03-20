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
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/install2.sh -O /tmp/install2.sh
chmod 777 /tmp/install2.sh
rm -r /tmp/start.sh
bash /tmp/install2.sh
