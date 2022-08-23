#!/bin/bash
#indiancybertroops
#krishanu
clear
PURPLE='\033[1;30m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PINK='\033[1;35m'
LBLUE='\033[1;36m'
WHITE='\033[1;37m'

N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
B='\033[0;34m'
Y='\033[0;38m'       # Yellow
C='\033[0;36m'       # Cyan
W='\033[0;37m'

function banner() {
	
	echo -e "
	                               Indian Cyber Troops Presents
${N}██████╗ ██╗  ██╗ █████╗ ███╗   ██╗████████╗ ██████╗       ███╗   ███╗
${R}██╔══██╗██║  ██║██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗      ████╗ ████║
${G}██████╔╝███████║███████║██╔██╗ ██║   ██║   ██║   ██║█████╗██╔████╔██║
${O}██╔═══╝ ██╔══██║██╔══██║██║╚██╗██║   ██║   ██║   ██║╚════╝██║╚██╔╝██║
${C}██║     ██║  ██║██║  ██║██║ ╚████║   ██║   ╚██████╔╝      ██║ ╚═╝ ██║
${B}╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝       ╚═╝     ╚═╝
                ${WHITE}Version 2.o New Generation Tool
                ${C}A Tool By Indian Cyber Troops
                          ${Y} Author: Krishanu                                       
${W}Enum Subdomain From Web Within Seconds
${Y}A New Way To Gain Information In New Era
                         ${B}Github:https://github.com/indiancybertroops 
                           ${O}Instagram:instagram.com/indiancybertroops"
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m        \e[0m" ; done ; echo
}
banner

printf "\n\n${WHITE}[!] Enter site to Enumerate subdomains : ${BLUE}"
read -r url
printf "${GREEN}\n[+] Enumerating subdomains from Api1"
curl -s "https://sonar.omnisint.io/subdomains/$url" | jq -r '.[]' > sub
printf "${GREEN}\n[+] Enumerating subdomains from Api2"
lynx --dump  https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$url | jq -r ".subdomains[]" | sort -u > sub1
printf "${GREEN}\n[+] Enumerating subdomains from Api3"
lynx --dump  https://securitytrails.com/list/apex_domain/$url | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | grep ".$site" | grep -v  "https://www.facebook.com" | grep -v "https://www.linkedin.com" | grep -v "https://status.securitytrails.io" | grep -v "https://docs.securitytrails.com" | sort -u > sub3
printf "${GREEN}\n[+] Enumerating subdomains from Api4\n"
lynx --dump https://api.hackertarget.com/hostsearch/?q=$url |  sort -u >sub4
printf "${G}\n[-]---++++---Subdomains---++++---[-]\n\n ${PINK}"
sort -u sub sub1 sub3 sub4  | uniq -u | tee $url-all_subdomains
rm sub,sub*
printf "${GREEN}\n[*] Subdomain Enumeration Completed!\n"
num=$( wc -l $url-all_subdomains | uniq | awk '{print $1; exit}')
printf "${WHITE}\n[*] Found $num subdomains for ${G}$url\n"

printf "${BLUE}\n[!] view the $url-all_subdomains file for results!\n\n"
