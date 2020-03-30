#!/bin/bash

clear
rm -f /etc/enigma2/e2m3u2bouquet/Left1.txt
rm -f /etc/enigma2/e2m3u2bouquet/Right.txt
rm -f /etc/enigma2/e2m3u2bouquet/NewXMLFile.xml
rm -f /etc/enigma2/e2m3u2bouquet/New-ott-sort.xml
prefix=$(cat /etc/enigma2/e2m3u2bouquet/prefix.txt 2>/dev/null )
if [[ "$prefix" != "" ]]; then
	cd /etc/enigma2/e2m3u2bouquet/
	sed -rn 's/.*<category name="([^"]*)".*/\1/p' $prefix-sort-current.xml > /etc/enigma2/e2m3u2bouquet/Left.txt

	while IFS= read -r line; do
		count=$(($count+1))
		printf "$count-$line\n" >> Left1.txt
	done < Left.txt

	rm Left.txt
#
#	while IFS= read -r line; do
#		count=$(($count+1))
#		printf "$line\n"
#	done < Left1.txt
cat Left1.txt | tr '\n' '\0' | xargs -0 -n 2 printf '%-24s %-24s\n'

	while IFS= read -r line; do
		aantaalLijnen=$(($aantaalLijnen+1))
	done < Left1.txt
	echo "aantal: $aantaalLijnen"
	cp /etc/enigma2/e2m3u2bouquet/Left1.txt /etc/enigma2/e2m3u2bouquet/lookup.txt


	while [ 0 != "$number" ]; do
		read -p "Kies Bouquet, nummers tussen: 1 en $aantaalLijnen: " number
		[[ $number =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue; }
		if ((number >= 1 && number <= $aantaalLijnen)); then
			count1=$(($count1+1))
			string=$(grep "^$number-" Left1.txt)
			if [[ "$string" == "" ]]; then
				alGekozen=$(grep "^$number-" lookup.txt)
				removestring="$number-"
				namealgekozen=${alGekozen//$removestring/}
				echo "U heeft Nummer $number: $namealgekozen al gekozen"
			else
			removestring="$number-"
			name=${string//$removestring/}
			echo "$count1-$name" >> Right.txt
			grep -v "^$number-" Left1.txt > imd.txt
			rm Left1.txt
			cat imd.txt > Left1.txt
			rm imd.txt
			if test -f "Right.txt"; then
				cat Right.txt
			else
			echo "right bestaat niet"
		fi
	fi
else
if ((number == 0 )); then
	echo "proccess"
	break
else
echo "Invalid number"
fi
fi
done

echo "Even geduld nieuwe sorteerde XML aan het voorbereiden ..."

customtext=$(echo -e "<categories>\n" )

if test -f "Right.txt"; then
	while IFS= read -r line; do
		count2=$(($count2+1))
		removestring="$count2-"
		name=${line//$removestring/}
		customtext+=$(echo -e "<category name=\"$name\" nameOverride=\"\" enabled=\"true\" customCategory=\"false\"/>\n")
	done < Right.txt
else
echo "right.txt bestaat niet , u heeft waarschijnlijk op 0 gedrukt"
fi
while IFS= read -r line; do
	name=$(echo "$line" |sed 's/.*-//g')
	customtext+=$(echo -e "<category name=\"$name\" nameOverride=\"\" enabled=\"true\" customCategory=\"false\"/>\n")
done < Left1.txt


cat $prefix-sort-current.xml > $prefix-sort-override.xml

customtext+="</categories>\\"

sed -i '\%<categories>%,\%</categories>%c\ '"$customtext"'' $prefix-sort-override.xml

rm /etc/enigma2/e2m3u2bouquet/Left1.txt 2>/dev/null
rm /etc/enigma2/e2m3u2bouquet/Right.txt 2>/dev/null
rm /etc/enigma2/e2m3u2bouquet/prefix.txt 2>/dev/null
#rm /etc/enigma2/e2m3u2bouquet/lookup.txt 2>/dev/null

else
echo -e "Cant execute script, prefix not present"
fi
