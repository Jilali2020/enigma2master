#!/bin/sh
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/nl.sh -O /tmp/nl.sh
mkdir /tmp/lang &>/dev/null
mv /tmp/nl.sh /tmp/lang/
chmod 777 /tmp/lang/nl.sh
wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/functions.sh -O /tmp/functions.sh
chmod 777 /tmp/functions.sh
rm /tmp/locale.txt
again() {
	echo "Step 1"
	echo -e "\e[1m===================================================="
	echo -e "| Taalkeuze - Lingua - Language - Langue - Sprache | "
	echo -e "====================================================\e[0m"
	echo -e "\n |1| \e[1mNederlands \e[34m(Druk   1)\e[0m \n \e[0m|2| \e[1mItaliano   \e[34m(Premi  2)\e[0m"
	echo -e "\e[0m |3| \e[1mEnglish    \e[34m(Press  3)\e[0m"
	echo -e "\e[0m |4| \e[1mFrancais   \e[34m(Presse 4)\e[0m\n \e[0m|5| \e[1mDeutsch   \e[34m(Drucken 5)\e[0m"
	echo -e " \e[0m|0| \e[1mStop/Exit \e[1;33m(ZERO)\e[0m"
	read  LANG
	if [ "$LANG" = 1 ] || [ "$LANG" = 2 ] || [ "$LANG" = 3 ] || [ "$LANG" = 4 ] || [ "$LANG" = 5 ] || [ "$LANG" = 0 ];
		then
		if (( $LANG == 1));
			then
				LANGUAGE="nl"
				echo -e "\n \e[1;33mGekozen taal is Nederlands\e[0m"
			fi
			if (( $LANG == 2));
			then
				LANGUAGE="it"
				echo -e "\n \e[33mAvete scelto la lingua Italiana\e[0m"
			fi
			if (( $LANG == 3));
			then
				LANGUAGE="en"
				echo -e "\n \e[33mEnglish is choosen as Language\e[0m"
			fi
			if (( $LANG == 4));
				then
					LANGUAGE="fr"
					echo -e "\n \e[33mLe francais est choisi comme langue\e[0m"
			fi
			if (( $LANG == 5));
				then
					LANGUAGE="fr"
					echo -e "\n \e[33mAls Sprache wird Deutsch gewahlt\e[0m"
			fi
				if (( $LANG == 0));
				then
					echo -e "\n"
					exit
				fi
			else
					echo -e "\n  \e[41mERROR\e[0m"
					sleep 1
			fi
			}
			LANG="7"
			while [ "$LANG" != 1 ] && [ "$LANG" != 2 ] && [ "$LANG" != 3 ] && [ "$LANG" != 4 ] && [ "$LANG" != 5 ] && [ "$LANG" != 0 ]
			do
			clear
			again
			done

			installpath=/tmp/lang
			.  ${installpath}/$LANGUAGE.sh

			mkdir /usr/share/info/ &>/dev/null
			echo "$LANGUAGE" > /tmp/locale.txt

			echo -e "\e[1;33m$BASHCEHK\e[1;0m"
			echo -e ""
			opkg update  &>/dev/null
			apt update &>/dev/null
			echo -e "$UPDATELIBSSUCCES"
			if opkg list_installed bash* | grep "bash*" &>/dev/null; then
				echo -e "\e[1;32m$BASHPRESENT \e[1;0m"
			else
				opkg install bash &>/dev/null
				echo -e "\e[1;33m$BASHINSTALL\e[1;0m"
			fi
			sleep 3
				wget -q https://raw.githubusercontent.com/Jilali2020/enigma2master/master/essentials.sh -O /tmp/essentials.sh
				chmod 777 /tmp/essentials.sh
				/tmp/enigma2/essentials.sh

				rm ./essentials.sh

			exit
