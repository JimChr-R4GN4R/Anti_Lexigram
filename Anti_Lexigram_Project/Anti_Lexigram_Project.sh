cd /cygdrive/c/Anti_Lexigram_Project


urlencode() {
  python -c 'import urllib, sys; print urllib.quote(sys.argv[1], sys.argv[2])' \
    "$1" "$urlencode_safe"
}
ANTI_LEXIGRAM(){
clear
printf "Ti na kanw: "; read word

if [[ $word = "clear" ]]; then
	unset http_proxy
	unset https_proxy
else
printf "from (0<): "; read First_point
printf "to (>10767): "; read Last_point
 sed -n ${First_point},${Last_point}p Proxy_List.txt
echo
printf "set IP:"; read VarIP
printf "set Port:"; read VarPort
echo $VarIP
echo $VarPort

export http_proxy=$!http://${VarIP}:${VarPort}
export https_proxy=$!http://${VarIP}:${VarPort}
printf "leksh: "; read leksh

encodedleksh=$(urlencode "$leksh")

site=$!https://www.lexigram.gr/lex/enni/${encodedleksh} 
lynx $site
fi
ANTI_LEXIGRAM
}

ANTI_LEXIGRAM

#######################DISABLE_PROXY###########################



