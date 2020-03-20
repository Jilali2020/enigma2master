#!/bin/bash
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/nl.sh -O /tmp/nl.sh
mkdir /tmp/lang &>/dev/null
mv /tmp/nl.sh /tmp/lang/
chmod 777 /tmp/lang/nl.sh
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/functions.sh -O /tmp/functions.sh
chmod 777 /tmp/functions.sh


LANGUAGE=$( cat /tmp/locale.txt )
installpath=/etc/enigma2/lang
.  ${installpath}/$LANGUAGE.sh
FUNTIONPATH=/tmp
.  ${FUNTIONPATH}/functions.sh

clear
#echo "$LANGUAGE"
echo "Step 2"
echo -e "\e[1m===================================================="
echo -e "| $HEADPAGE2 | "
echo -e "====================================================\e[0m\n"	

echo -e "\e[1m $READSPECS\n"
echo -e "$SPECRESULTS"
wget -q -O - http://127.0.0.1/web/about > /tmp/about.txt
uname -a > /tmp/proc.txt
INFOBOX=$( cat /tmp/proc.txt )
echo -e "  \e[1;33m$INFOBOX\n\e[1;0m"
if [ -d /usr/lib/enigma2/python/Plugins/PLi ] ; then
	echo "openpli" >> /tmp/about.txt
fi
if [ -d /usr/lib/enigma2/python/Plugins/SystemPlugins/VTIPanel ] ; then
	 echo "vti" >> /tmp/about.txt
fi
#Linux vuzero 3.13.5 #1 SMP Tue May 8 21:29:59 CEST 2018 mips GNU/Linux
echo "" >> /etc/image-version
arm1=$( grep -ic "armv7l" /tmp/proc.txt )
mip1=$( grep -ic "mips" /tmp/proc.txt )
mip2=$( grep -ic "dm" /tmp/proc.txt )
mip3=$( grep -ic "bm750" /tmp/proc.txt )
mip4=$( grep -ic "7401c0" /tmp/proc.txt )
mip5=$( grep -ic "7325b0" /tmp/proc.txt )
sh1=$( grep -ic "sh4" /tmp/proc.txt )
sh2=$( grep -ic "sh_4" /tmp/proc.txt )
atv1=$( grep -ic "openatv" /tmp/about.txt )
atv2=$( grep -ic "openATV" /etc/image-version )
pli1=$( grep -ic "openpli" /tmp/about.txt )
pli2=$( grep -ic "openpli" /etc/image-version )
newnig1=$( grep -ic "newnigma2" /tmp/about.txt )
newnig2=$( grep -ic "newnigma2" /etc/image-version )
black1=$( grep -ic "BlackHole" /tmp/about.txt )
black2=$( grep -ic "BlackHole" /etc/image-version )
black3=$( grep -ic "openbh" /etc/image-version )
black4=$( grep -ic "openbh" /tmp/about.txt )
vti1=$( grep -ic "vti" /tmp/about.txt )
vti2=$( grep -ic "vti" /etc/image-version )

# Pre info receiver
wget -q -O - http://127.0.0.1/web/about > /tmp/about.txt
ONTVANGER=$(awk -F'[<>]' '/<e2model>/{print $3}' /tmp/about.txt )
IMAGE=$(awk -F'[<>]' '/<e2distroversion>/{print $3}' /tmp/about.txt)
IPADRES=$(awk -F'[<>]' '/<e2lanip>/{print $3}' /tmp/about.txt )
E2VERSION=$(awk -F'[<>]' '/<e2imageversion>/{print $3}' /tmp/about.txt )

if [ $IMAGE = "openpli" ]; then
		openpli
fi
