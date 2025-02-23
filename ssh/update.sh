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
# // Exporting IP Address
export IP=$( curl -s ifconfig.me )
function SAMAWA(){
clear
echo 'V2xkT2IySjVRV2xKUTFJM1VXdDRWbEpZTTJsc1NYcHBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NrRnJaVEExUkdaVFNVdGFWMDV2WW5sQmFVbERVamRSYTNoV1VsZ3phV3hKU1d0bE1EVkVabE5TTjFJeFNrWlNWVFU1U1VOQlowbERRV2RKUTBGbldERTVabGg1UW1aWU1UbG1XSGxDWmxneE9XWlllVUZuU1VOQloxZ3hPV1pZTVRsbVNVTkNaa2xEUVdkWWVWSTNWR3RPT1VwSWRFTlVSbFpHWmxOQlowbERRV2RKUTBGblNVTkVhV3hKU1d0bE1EVkVabE5KUzFwWFRtOWllVUZwU1VOU04xRnJlRlpTV0ROcGJFbEphMlV3TlVSbVUxSTNVakZLUmxKVk5UbEpRMEZuU1VOQlowbERRWFpKUmpsbVdETjNaMWd4T1daWWVUaG5XSGxDWTBsR2QyZEpRMEYyU1VNNFowbEdPR2RZU0hkbldFTkNPRWxJZDJ0bE1EVkVabE5TTjFGcmVGWlNXREJuU1VOQlowbERRV2RKUTBScGJFbEphMlV3TlVSbVUwbExXbGRPYjJKNVFXbEpRMUkzVVd0NFZsSllNMmxzU1VsclpUQTFSR1pUVWpkU01VcEdVbFUxT1VsRFFXZEpRMEZuU1VoM1oyWkRRV2RZTTNkblNVWTVPR1pEUWpoSlNIZG5XRU5DWTBsRE9HZE1NM2RuWmtZNGNFbElkMmRKUm5nNFNVaDNhMlV3TlVSbVUxSTNVV3Q0VmxKWU1HZEpRMEZuU1VOQlowbERSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTlNOMUl4U2taU1ZUVTVTVU5CWjBsRFFXZEpTSGRuWmtZNU9FbElkMmRtUmpsbVprTkNPRmd6ZDJkbVJuZG5WbWxCZGtsSWQyZEpSamxtVEROM1oyWkdkMmRKU0hkclpUQTFSR1pUVWpkUmEzaFdVbGd3WjBsRFFXZEpRMEZuU1VORWFXeEpTV3RsTURWRVpsTkpTMXBYVG05aWVVRnBTVU5TTjFGcmVGWlNXRE5wYkVsSmEyVXdOVVJtVTFJM1VqRktSbEpWTlRsSlEwRm5TVU5CWjBsRFFtTllNVGxtV0RONFpsZ3hPV1pZTVhobVdERTRka2xEUW1OWWVUaG5TVWg0Wm1aRFFXZEpTSGhtWmtOQ1kxZ3pkMnRsTURWRVpsTlNOMUZyZUZaU1dEQm5TVU5CWjBsRFFXZEpRMFJwYkVsSmEyVXdOVVJtVTBsTFdsZE9iMko1UVdsSlExSTNVV3Q0VmxKWU0ybHNTVWxyWlRBMVJHWlRRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQmEyVXdTazFXVlZZNVNVOUxWV2RwVWpkVWEwNDVTV2R3YkZreWFIWkpRMGxuU2toMFExUkdWa1ptWlV0VloybFNOMVJyVGpsSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VVeFZsUkdVa3BWUlRsVFZrTkNWMVZGTkdkVk1FNVRVMVpDVlVsR1dYcE1ha0ZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEVWpkUmEzaFdVbGd3WnpSd1UwTktTSFJQVVRNd2FVTnRWbXBoUnpoblNXbEJhMlV3U2sxV1ZWWTVOSEJUUTBwSWRFOVJNekJuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5WakZrV0V4clpFWlVNVnBSVkdrMVJGUXdNR2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEtTSFJEVkVaV1JtWlRSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTkJaMGxEUWxWU1ZYaEdVakZLUWxSVFFrUlRRMEZyWlRCa1UxSlZWazltVlVJd1dsaE9NR0ZYZERGbFZqbDBXVmMxYmtwSWRFOVJNekJuVVZWU1RsTlZOR2RLU0hSSVZXdFdSbFJ1TVVGa1IwWXhXRE5PYUdKWFJqTlpVMUkzVkd0T09VbERRV2RKUTFJM1VXdDRWbEpZTUdjMGNGTkRTa2gwVDFFek1HbERiVlpxWVVjNFowbHBRV3RsTUVwTlZsVldPVFJ3VTFVMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTFsS1NIUlBVVE13YVE9PQ==' | base64 -d | base64 -d | base64 -d | sh
}
function ins_menu(){
clear
echo -e " ${INFO} Downloading File"
sleep 2
    wget -O ~/menu.zip "https://geoproject.biz.id/ssh/menu.zip"
    mkdir /root/menu
    7z e -psumbawa   ~/menu.zip -o/root/menu/
    chmod +x /root/menu/*
    mv /root/menu/* /usr/local/sbin/
    rm -r /root/menu
    rm -r /root/update.sh
    rm -r /root/menu.zip
    rm -rf /usr/local/sbin/snap
    rm -rf /usr/local/sbin/geo.zip
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
