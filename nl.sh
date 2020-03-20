#!/bin/sh

wget -q -O - http://127.0.0.1/web/about > /tmp/about.txt
ONTVANGER=$(awk -F'[<>]' '/<e2model>/{print $3}' /tmp/about.txt )
IMAGE=$(awk -F'[<>]' '/<e2distroversion>/{print $3}' /tmp/about.txt)
IPADRES=$(awk -F'[<>]' '/<e2lanip>/{print $3}' /tmp/about.txt )
E2VERSION=$(awk -F'[<>]' '/<e2imageversion>/{print $3}' /tmp/about.txt )
UPDATELIBSSUCCES="\e[1;36m LINUX Pakketten met succes geupdated"
BASHCEHK=" Even Geduld .. Bash versie controle."
BASHINSTALL=" Geen Bash gevonden , begin met installatie."
BASHPRESENT=" Bash aanwezig, installatie onnodig.\n"
HEADPAGE2="         INSTALLATIE VAN NODIGE PAKKETTEN       "
READSPECS=" \e[1;36mEven geduld, ophalen van de nodige informatie\e[1;0m"
SPECRESULTS="  \e[0mOntvanger \e[1m$ONTVANGER \e[0mgevonden met image \e[1m$IMAGE $E2VERSION \e[0mop ipadres \e[1m$IPADRES \e[0m"
#Step 2
CRONVERSIE=$( opkg list_installed *cron* )
CRONCHECK="  Installatie Cron...\e[1;36m[1/5]\e[1;0m"
CRONPRESENT="\e[1m  Versie $CRONVERSIE is al \e[32mgeinstalleerd! \e[32m[\e[32m1\e[32m/\e[32m5]\e[0m\n"
CRONINSTALL="\e[1m  Cron niet \e[31maanwezig! \e[0mWordt nu installeerd!!\n"
CURLVERSIE=$( opkg list_installed curl* )
CURLCHECK="\e[0m  Installatie Curl...\e[1;36m[2/5]\e[1;0m"
CURLPRESENT="  \e[1mVersie $CURLVERSIE is al \e[32mgeinstalleerd!\e[32m[\e[32m2\e[32m/\e[32m5]\e[0m\n"
CURLINSTALL="\e[1m  Curl niet \e[31maanwezig! \e[0mWordt nu installeerd!!\n"
KLOKVERSIE=$( opkg list_installed ntpdate* )
KLOKCHECK="  Installatie Ntpdate...\e[1;36m[3/5]\e[1;0m"
KLOKPRESENT="  \e[1mVersie $KLOKVERSIE is al \e[32mgeinstalleerd!\e[32m[\e[32m3\e[32m/\e[32m5]\e[0m"
KLOKINSTALL="  \e[1mSysteem EPG klok Installatie begonnen \e[33m$NU\e[0m"
NU=$(date) &> /dev/null
NOWKLOK="  \e[1mSysteem EPG klok ingesteld op: \e[33m$NU\e[0m\n"
PYTHONARG=$( opkg list_installed python-argpars*)
PYTHONARGCHECK="> Installatie Python Args...\e[1;36m[4/5]\e[1;0m"
PYTHONARGPRESENT="  \e[1mVersie $PYTHONARG is al \e[32mgeinstalleerd!\e[32m[\e[32m4\e[32m/\e[32m5]\e[0m"
PYTHONARGINSTALL=">  \e[1mInstallatie $PYTHONARG gestart\e[32m[\e[32m5\e[32m/\e[32m5]\e[0m\n"