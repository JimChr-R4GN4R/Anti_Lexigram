# Codded By JimChr
# Αφιερωμένο στη Βαλεντίνα!

cd /cygdrive/c/Anti_Lexigram_Project/

urlencode() {
  python -c 'import urllib, sys; print urllib.quote(sys.argv[1], sys.argv[2])' \
    "$1" "$urlencode_safe"
}



ANTI_LEXIGRAM(){
clear

unset http_proxy
unset https_proxy
if [[ "$First_point" != "" ]]; then
echo "===================================="
sed -n ${First_point},${Last_point}p Proxy_List.txt
echo "===================================="
else
printf "Από (0<): "; read First_point
printf "Μέχρι (>10767): "; read Last_point
	if [ -z "$First_point" ]; then
	ANTI_LEXIGRAM
	elif [ -z "$Last_point" ]; then
	unset First_point
	ANTI_LEXIGRAM
	fi
echo "===================================="
 sed -n ${First_point},${Last_point}p Proxy_List.txt
 echo "===================================="
 fi
echo
printf "Διάλεξε: "; read VarRAW
if [ -z "$VarRAW" ]; then
unset First_point
ANTI_LEXIGRAM
elif [ "$VarRAW" -gt "$Last_point" ]; then
ANTI_LEXIGRAM
fi

while IFS='=' read -r iVarRAW Use_Date; do 
if [ "$VarRAW" = "$iVarRAW" ]; then
echo "Χρησιμοποιημένο στις $Use_Date"
fi  
done <Used_Proxies.txt

while IFS='=' read -r iVarRAW iVarIP iVarPort; do 
if [ "$VarRAW" = "$iVarRAW" ]; then
VarIP=$iVarIP
VarPort=$iVarPort

fi  
done <Proxy_List.txt


#echo $VarIP
#echo $VarPort

export http_proxy=$!http://${VarIP}:${VarPort}
export https_proxy=$!http://${VarIP}:${VarPort}
#echo "$https_proxy"
printf "Λέξη: "; read leksh

if [ "$leksh" = "" ]; then
ANTI_LEXIGRAM
fi


encodedleksh=$(urlencode "$leksh")

site=$!https://www.lexigram.gr/lex/enni/${encodedleksh} 
lynx $site
#cd words
#lynx -source $site > $leksh.html
#cd ..
echo "$VarRAW=$(date)" >> Used_Proxies.txt
ANTI_LEXIGRAM
}

ANTI_LEXIGRAM
