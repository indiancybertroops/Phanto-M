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
apt install lynx -y >/dev/null
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
options=("Api 1" "Api 2 (Recommended)" "Api 3" "Combined Result From All Api Togetherly" "Exit"
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
echo -e " ${Y} Enter The Website For Api 3"
read site
lynx --dump https://jldc.me/anubis/subdomains/$site | jq -r '.[]' |  sort -u > result3.txt
lynx --dump https://sonar.omnisint.io/subdomains/$site | jq -r '.[]' |  sort -u > result2.txt
lynx --dump https://dns.bufferover.run/dns?q=$site | jq -r '.FDNS_A[]' |  sort -u > result.txt
cat result.txt result2.txt result3.txt > final.txt
echo " ${R} Results saved into ${B}final.txt ${R}checkout file created on same Directory where You've Installed Tool"
;;
"Exit")
break
;;
*) echo "invalid option $REPLY";;
esac
done