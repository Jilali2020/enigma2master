#!/bin/bash
mkdir /tmp/lang &>/dev/null 
installpath=/tmp/lang
.  ${installpath}/$LANGUAGE.sh

###########       OPENLI     ###############################
function openpli(){
	
	#CRON
	#
	CRONVERSIE=$( opkg list_installed *cron* )
	echo -e "$CRONCHECK"
	if opkg list_installed *cron* | grep "cron*" &>/dev/null
		then
			echo -e "$CRONPRESENT"
		else
		echo -e "$CRONINSTALL"
		opkg install cron &>/dev/null
		opkg install busybox-cron &>/dev/null
		if opkg list-installed *cron* | grep "cron*" &>/dev/null
			then
				croninst=$(opkg list-installed *cron*)
				testcronremote $croninst
			fi
	fi	
	#
	# CURL
	CURLVERSIE=$( opkg list_installed curl* )
	echo -e "$CURLCHECK"
	if opkg list_installed *curl* | grep "curl*" &>/dev/null
		then
			echo -e "$CURLPRESENT"
		else
		echo -e "$CURLINSTALL"
		opkg install curl &>/dev/null
		if  opkg list_installed *curl* | grep "curl*" &>/dev/null
			then
				testcurlremote $(opkg list_installed *curl*)
			fi
	fi
	#
	# RDATE
	KLOKVERSIE=$( opkg list_installed ntpdate* )
	echo -e "$KLOKCHECK"
	if opkg list_installed ntpdate* | grep "ntpdate*" &>/dev/null
		then
			echo -e "$KLOKPRESENT"
		else
		echo -e "$KLOKINSTALL"
		opkg install ntpdate &>/dev/null
		apt install ntpdate &>/dev/null
		
	fi
		ntpdate fr.pool.ntp.org &>/dev/null
		echo -e "$NTPTOSTARTUP"
		wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/ntp.sh -O /tmp/ntp.sh
		cp /tmp/ntp.sh /etc/init.d/ntp.sh
		rm -f /tmp/ntp.sh
		chmod 755 /etc/init.d/ntp.sh
		cd /etc/init.d
		update-rc.d ntp.sh defaults &>/dev/null
		./ntp.sh &>/dev/null
		
		echo -e "$NOWKLOK"
		echo -e "$PYTHONARGCHECK"
		if opkg list_installed python-argpars* | grep "python-argparse*" &>/dev/null
			then
					echo -e "$PYTHONARGPRESENT"
			else
					echo -e "$PYTHONARGINSTALL"
					opkg install python-image python-imaging python-argparse &>/dev/null					
			fi
			
}
