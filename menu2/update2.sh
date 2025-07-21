#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Geo Project
# //	Dscription: Xray Menu Management
# //	email: admin@geolstore.net
# //  telegram: https://t.me/tau_samawa
# //====================================================
# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
OR='\033[1;93m'
Lred='\e[91m'
LLgreen='\e[92m'
Lyellow='\e[93m'
yellow="\033[1;33m"
green="\e[92;1m"
yellow="\033[1;33m"
cyan="\033[1;36m"
# // Export Banner Status Information
export EROR="[${RED} ERROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
# // Exporting URL Host
source '/etc/geovpn/var.txt'
URL="https://api.telegram.org/bot$INFO_AKUN/sendMessage"
export Server_URLL="raw.githubusercontent.com/jaka1m/perizinan/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="geovpn"
MYIP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
rm -f /root/update2.sh
# // Exporting IP Address
export IP=$( curl -s ifconfig.me )
function SAMAWA(){
clear
echo -e " ${BLUE}┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BLUE}│${NC}${GREEN}         ____ _____ _____     ______  _   _${NC}${BLUE}          │${NC}"
echo -e " ${BLUE}│${NC}${GREEN}        / ___| ____/ _ \ \   / /  _ \| \ | |${NC}${BLUE}         │${NC}"
echo -e " ${BLUE}│${NC}${GREEN}       | |  _|  _|| | | \ \ / /| |_) |  \| |${NC}${BLUE}         │${NC}"
echo -e " ${BLUE}│${NC}${GREEN}       | |_| | |__| |_| |\ V / |  __/| |\  |${NC}${BLUE}         │${NC}"
echo -e " ${BLUE}│${NC}${GREEN}        \____|_____\___/  \_/  |_|   |_| \_|${NC}${BLUE}         │${NC}"
echo -e " ${BLUE}│${NC}                                                    ${BLUE} │${NC}"
echo -e " ${BLUE}│${NC}             MULTIPORT VPN SCRIPT V3.0              ${BLUE} │${NC}"
echo -e " ${BLUE}│${NC}                   WWW.GEOVPN.COM                   ${BLUE} │${NC}"
echo -e " ${BLUE}│${NC}    TELEGRAM CH ${GREEN}@testikuy_mang${NC} ADMIN ${GREEN}@tau_samawa${NC}    ${BLUE} │${NC}"
echo -e " ${BLUE}└─────────────────────────────────────────────────────┘${NC}"
}
function ins_menu(){
clear
echo -e " ${INFO} Downloading File"
sleep 2
    wget https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu2/menu.zip >/dev/null 2>&1
7z e -psumbawa menu.zip
    unzip geo.zip
    mv geo /home
    chmod +x *
    cd
    mv * /usr/local/sbin/
    rm -f /usr/local/sbin/menu.zip
    rm -f /usr/local/sbin/geo.zip
    rm -rf /home/geo/var.txt
    rm -f /usr/local/sbin/on.sh
    rm -rf /usr/local/sbin/snap >/dev/null 2>&1
echo -e " ${INFO} Dwonload File Successfully"
sec=2
echo ""
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
  echo -ne "\e[32m ${spinner[sec]} Back to Menu $sec seconds...\r"
  sleep 1
  sec=$(($sec - 1))
done
echo ""
menu
}
# // Exporting Network Interface
SAMAWA
echo -e ""
read -p "Apakah Anda Yakin Melakukan Update ? ( Y / N ) " update
echo ""
echo ""
if [[ $update == "Y" ]]; then
clear
echo -e "${INFO} Update !"
ins_menu
elif [[ $update == "y" ]]; then
clear
echo -e "${INFO} Update !"
ins_menu
elif [[ $update == "N" ]]; then
echo -e "${INFO} Update Canceled !"
exit 1
elif [[ $update == "n" ]]; then
echo -e "${INFO} Update Canceled !"
exit 1
else
echo -e "${EROR} Update Otomatis !"
ins_menu
fi
