#!/bin/bash
# instagram:IndianCyberTroops
clear
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
B='\033[0;34m'
Y='\033[0;38m'       # Yellow
C='\033[0;36m'       # Cyan
W='\033[0;37m'       # White
apt install jq -y >/dev/null
apt install sort -y >/dev/null
apt install lynx -y >/dev/null
apt install grep -y >/dev/null
clear
function banner() {
	
	echo -e "
	
${N}██████╗ ██╗  ██╗ █████╗ ███╗   ██╗████████╗ ██████╗       ███╗   ███╗
${R}██╔══██╗██║  ██║██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗      ████╗ ████║
${G}██████╔╝███████║███████║██╔██╗ ██║   ██║   ██║   ██║█████╗██╔████╔██║
${O}██╔═══╝ ██╔══██║██╔══██║██║╚██╗██║   ██║   ██║   ██║╚════╝██║╚██╔╝██║
${C}██║     ██║  ██║██║  ██║██║ ╚████║   ██║   ╚██████╔╝      ██║ ╚═╝ ██║
${B}╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝       ╚═╝     ╚═╝
                
                ${C}A Tool By Indian Cyber Troops
                          ${Y} Author:Phanatom & Krishanu                                        

${W}Enum Subdomain From Web Within Seconds
${Y}A New Way To Gain Information In New Era
                         ${B}Github:https://github.com/indiancybertroops 
                           ${O}Instagram:instagram.com/indiancybertroops"
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m        \e[0m" ; done ; echo
}
banner
if [[ $EUID -ne 0 ]]; then
   echo -e " ${C} This script must be run as root" 
   exit 1
fi
echo -e " ${C} " 
PS3='Please enter your choice: '
options=("Api 1" "Api 2 (Recommended)" "Api 3" "Combined Result From All Api Togetherly" "Api 4" "Wayback Url Scrap" "Api 5" "Api 6(recommended)" "Exit"
)
select opt in "${options[@]}"
do
case $opt in
"Api 1")
echo -e " ${B} Enter The Website For Api1"
read site
lynx --dump https://dns.bufferover.run/dns?q=$site | jq -r '.FDNS_A[]' |  sort -u > result.txt
echo -e " ${R} Results saved into ${B}result.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Api 2 (Recommended)")
echo -e " ${C} Enter The Website For Api 2"
read site
lynx --dump https://sonar.omnisint.io/subdomains/$site | jq -r '.[]' |  sort -u > result2.txt
echo -e " ${R} Results saved into ${B}result2.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Api 3")
echo -e " ${Y} Enter The Website For Api 3"
read site
lynx --dump https://jldc.me/anubis/subdomains/$site | jq -r '.[]' |  sort -u > result3.txt
echo -e " ${R} Results saved into ${B}result3.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Combined Result From All Api Togetherly")
echo -e " ${Y} Enter The Website For Api combined api" 
read site
lynx --dump https://jldc.me/anubis/subdomains/$site | jq -r '.[]' |  sort -u > result3.txt
lynx --dump https://sonar.omnisint.io/subdomains/$site | jq -r '.[]' |  sort -u > result2.txt
lynx --dump https://dns.bufferover.run/dns?q=$site | jq -r '.FDNS_A[]' |  sort -u > result.txt
lynx --dump https://api.hackertarget.com/hostsearch/?q=$site |  sort -u > result4.txt
lynx --dump http://web.archive.org/cdx/search/cdx?url=$site | grep -oE http.*://.*/ | sort -u > wayback.txt
lynx --dump  https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$site | jq -r ".subdomains[]" | sort -u > result5.txt
lynx --dump  https://securitytrails.com/list/apex_domain/$site | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | grep ".$site" | grep -v  "https://www.facebook.com" | grep -v "https://www.linkedin.com" | grep -v "https://status.securitytrails.io" | grep -v "https://docs.securitytrails.com" | sort -u > result6.txt
cat result.txt result2.txt result3.txt result4.txt wayback.txt result5.txt result6.txt > final.txt
echo " ${R} Results saved into ${B}final.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Api 4")
echo -e " ${Y} Enter The Website For Api 4"
read site
lynx --dump https://api.hackertarget.com/hostsearch/?q=$site |  sort -u > result4.txt
echo -e " ${R} Results saved into ${B}result4.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Wayback Url Scrap")
echo -e " ${Y}Enter Url For Result From Wayback Machine"
read site
lynx --dump http://web.archive.org/cdx/search/cdx?url=$site | grep -oE http.*://.*/ | sort -u > wayback.txt
echo -e " ${R} Results saved into ${B}wayback.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Api 5")
echo -e " ${Y}Enter Url For Result From Api 5"
read site
lynx --dump  https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$site | jq -r ".subdomains[]" | sort -u > result5.txt
echo -e " ${R} Results saved into ${B}result5.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Api 6(recommended)")
echo -e " ${Y}Enter Url For Result From Api 6"
read site
lynx --dump  https://securitytrails.com/list/apex_domain/$site | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | grep ".$site" | grep -v  "https://www.facebook.com" | grep -v "https://www.linkedin.com" | grep -v "https://status.securitytrails.io" | grep -v "https://docs.securitytrails.com" | sort -u > result6.txt
echo -e " ${R} Results saved into ${B}result6.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Exit")
break
;;
*) echo "invalid option $REPLY";;
esac
done
