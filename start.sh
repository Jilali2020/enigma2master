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
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/nl.sh -O /tmp/nl.sh
mkdir /tmp/lang &>/dev/null
mv /tmp/nl.sh /tmp/lang/
chmod 777 /tmp/lang/nl.sh
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/functions.sh -O /tmp/functions.sh
chmod 777 /tmp/functions.sh
rm /tmp/locale.txt
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/install2.sh -O /tmp/install2.sh
chmod 777 /tmp/install2.sh
#rm -r /tmp/start.sh
bash /tmp/install2.sh
