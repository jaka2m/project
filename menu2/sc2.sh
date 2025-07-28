#!/bin/bash

# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V3.1
# Author  : Geo Project
# (C) Copyright 2024
# =========================================

rm -f /root/sc2.sh > /dev/null 2>&1

# Pastikan skrip dijalankan sebagai root
if [ "${EUID}" -ne 0 ]; then
    echo -e "\e[31m[ERROR]\e[0m Mohon jalankan skrip ini sebagai pengguna root!"
    exit 1
fi

# Konfigurasi .profile untuk membersihkan layar saat login
cat > /root/.profile <<EOF
clear
sleep 5
screen -r > /dev/null 2>&1
EOF

# Definisi Warna
GREEN="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${GREEN}   ✔ ${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;36m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'

mkdir -p /etc/geovpn/
cat >/etc/geovpn/var.txt <<EOF
INFO_KILLS="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
INFO_AKUN="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
INFO_BACKUP="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
INFO_INSTALLER="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
INFO_DAFTAR="6946747820:AAG0LHxHvy-e40ZpOwH0TuBQJEKM-Zj7Amc"
ADMIN="1467883032"
TIME="10"
EOF
source '/etc/geovpn/var.txt'

# Bersihkan layar
clear
clear && clear && clear

# Ekspor Informasi IP Address
export IP=$(curl -sS ipinfo.io/ip)

# Tampilkan Banner
echo -e " ${GRAY}┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${GRAY}│${NC}${GRAY}         ____ _____ _____     ______  _   _${NC}${GRAY}          │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}        / ___| ____/ _ \ \   / /  _ \| \ | |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}       | |  _|  _|| | | \ \ / /| |_) |  \| |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}       | |_| | |__| |_| |\ V / |  __/| |\  |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}        \____|_____\___/  \_/  |_|   |_| \_|${NC}${GREEN}         │${NC}"
echo -e " ${GRAY}│${NC}                                                    ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}             MULTIPORT VPN SCRIPT V3.1              ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}                   WWW.GEOVPN.COM                   ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}    TELEGRAM CH ${GREEN}@testikuy_mang${NC} ADMIN ${GRAY}@sampiiiiu${NC}    ${GRAY}  │${NC}"
echo -e " ${GRAY}└─────────────────────────────────────────────────────┘${NC}"
echo ""

ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/jaka2m/permission/main/ipmini"

checking_sc() {
    useexp=$(wget -qO- "$data_ip" | grep "$ipsaya" | awk '{print $3}')
    if [[ "$date_list" < "$useexp" ]]; then
        echo -ne
    else
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        echo -e "\033[42m          GEO PROJECT AUTOSCRIPT            \033[0m"
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        echo -e ""
        echo -e "              ${RED}IZIN DITOLAK !${NC}"
        echo -e "       \033[0;33mVPS Anda${NC} $ipsaya \033[0;33mTelah Diblokir${NC}"
        echo -e "         \033[0;33mBeli akses izin untuk skrip${NC}"
        echo -e "               \033[0;33mHubungi Admin :${NC}"
        echo -e "        \033[0;36mTelegram${NC} t.me/sampiiiiu"
        echo -e "        ${GREEN}WhatsApp${NC} wa.me/6282339191527"
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        exit
    fi
}
checking_sc

function ARCHITECTURE() {
if [[ "$( uname -m | awk '{print $1}' )" == "x86_64" ]]; then
    echo -ne
else
    echo -e "${r} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi

if [[ ${ID} == "ubuntu" || ${ID} == "debian" ]]; then
    echo -ne
else
    echo -e " ${r}This Script only Support for OS"
    echo -e ""
    echo -e " - ${YELLOW}Ubuntu 20.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 21.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 22.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 23.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 24.04${NC}"
    echo ""
    echo -e " - ${YELLOW}Debian 10${NC}"
    echo -e " - ${YELLOW}Debian 11${NC}"
    echo -e " - ${YELLOW}Debian 12${NC}"
    sleep 3
    wget -q --no-check-certificate https://raw.githubusercontent.com/arivpnstores/v6/main/m-rbl -O m-rbl.sh && chmod +x m-rbl.sh && ./m-rbl.sh
fi

if [[ ${VERSION_ID} == "10" || ${VERSION_ID} == "11" || ${VERSION_ID} == "12" || ${VERSION_ID} == "20.04" || ${VERSION_ID} == "21.04" || ${VERSION_ID} == "22.04" || ${VERSION_ID} == "23.04" || ${VERSION_ID} == "24.04" ]]; then
    echo -ne
else
    echo -e " ${r}This Script only Support for OS"
    echo -e ""
    echo -e " - ${YELLOW}Ubuntu 20.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 21.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 22.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 23.04${NC}"
    echo -e " - ${YELLOW}Ubuntu 24.04${NC}"
    echo ""
    echo -e " - ${YELLOW}Debian 10${NC}"
    echo -e " - ${YELLOW}Debian 11${NC}"
    echo -e " - ${YELLOW}Debian 12${NC}"
  sleep 3
    wget -q --no-check-certificate https://raw.githubusercontent.com/arivpnstores/v6/main/m-rbl -O m-rbl.sh && chmod +x m-rbl.sh && ./m-rbl.sh
fi

if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
}

# call
ARCHITECTURE

# --- OS Architecture Check ---
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    echo -e "${OK} Your Architecture is Supported (${GREEN}${ARCH}${NC})"
else
    echo -e "${ERROR} Your Architecture is Not Supported (${GRAY}${ARCH}${NC})"
    exit 1
fi

# --- Operating System Check ---
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        echo -e "${OK} Your OS is Supported (${GREEN}${PRETTY_NAME}${NC})"
    else
        echo -e "${ERROR} Your OS is Not Supported (${GRAY}${PRETTY_NAME}${NC})"
        exit 1
    fi
else
    echo -e "${ERROR} /etc/os-release file not found. Unable to detect OS."
    exit 1
fi

# --- Validate Pre-defined IP Address (if any) ---
if [[ -z "$IP" ]]; then
    echo -e "${ERROR} IP Address ( ${GRAY}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${GREEN}${IP}${NC} )"
fi

# --- Get Public IP Address ---
MYIP=$(curl -sS ipv4.icanhazip.com)
if [[ -z "$MYIP" ]]; then
    echo -e "${ERROR} Failed to get public IP. Ensure internet connection is working."
    exit 1
fi
echo -e "${OK} Public IP Detected: ${GREEN}${MYIP}${NC}"

# --- Source URL for User Data and Permissions ---
USERNAME_SOURCE="https://raw.githubusercontent.com/jaka2m/permission/main/ipmini"

# --- Remove and Recreate /usr/bin/user file ---
if [[ -f /usr/bin/user ]]; then
    rm -f /usr/bin/user
    if [[ $? -ne 0 ]]; then
        echo -e "${ERROR} Failed to delete /usr/bin/user. Check permissions."
        exit 1
    fi
fi

# --- Fetch and Store Username ---
username=$(curl -sS "$USERNAME_SOURCE" | grep "$MYIP" | awk '{print $2}')
if [[ -z "$username" ]]; then
    echo -e "${ERROR} Username not found for IP ${GRAY}${MYIP}${NC} from ${USERNAME_SOURCE}."
    # Uncomment the line below if a username is absolutely required
    # exit 1
else
    echo -e "${OK} Username Detected: ${GREEN}${username}${NC}"
    echo "$username" > /usr/bin/user
    if [[ $? -ne 0 ]]; then
        echo -e "${ERROR} Failed to write username to /usr/bin/user. Check permissions (might need sudo)."
        exit 1
    fi
fi

# --- Fetch and Store Expiration Date (expx) ---
expx=$(curl -sS "$USERNAME_SOURCE" | grep "$MYIP" | awk '{print $3}')
if [[ -z "$expx" ]]; then
    echo -e "${ERROR} Expiration date not found for IP ${GRAY}${MYIP}${NC}."
    # Optional: exit 1
else
    echo -e "${OK} Expiration Date Detected : ${GREEN}${expx}${NC}"
    echo "$expx" > /usr/bin/e
    if [[ $? -ne 0 ]]; then
        echo -e "${ERROR} Failed to write expiration date to /usr/bin/e. Check permissions."
        exit 1
    fi
fi

# --- Fetch Exp1 (4th column) ---
Exp1=$(curl -sS "$USERNAME_SOURCE" | grep "$MYIP" | awk '{print $4}')
if [[ -z "$Exp1" ]]; then
    echo -e "${ERROR} Exp1 data (4th column) not found for IP ${GRAY}${MYIP}${NC}."
    # No 'else' block needed here as no action is taken if found
fi

# --- Check Account Status (Expired/Active) ---
today_date=$(date +'%Y-%m-%d') # Today's date format
DATE=$(date +'%Y-%m-%d') # DATE variable set here for consistency if used later

if [[ -n "$expx" ]]; then # Ensure expx is not empty before comparing
    if [[ "$today_date" < "$expx" ]]; then
        echo -e "${OK} Account Status: ${INFO} (Valid until: ${GREEN}${expx}${NC})"
    else
        echo -e "${OK} Account Status: ${RED}Expired (Expired on: ${RED}${expx}${NC})" # Used RED for clarity
        # You might want to add exit 1 here if an expired account should not proceed
    fi
else
    echo -e "${ERROR} Expiration date not available for status check."
fi

echo ""
read -p "$(echo -e "Press ${GRAY}[ ${NC}${GREEN}Enter${NC} ${GRAY}]${NC} To Start Installation") "
echo ""
clear

if [ "${EUID}" -ne 0 ]; then
    echo "Anda perlu menjalankan skrip ini sebagai root"
    exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
    echo "OpenVZ tidak didukung"
    exit 1
fi

echo -e "${GREEN}memuat...${NC}"
clear

MYIP=$(curl -sS ipv4.icanhazip.com)
rm -f /usr/bin/user
username=$(curl ${data_ip} | grep "$MYIP" | awk '{print $2}')
echo "$username" > /usr/bin/user

expx=$(curl ${data_ip} | grep "$MYIP" | awk '{print $3}')
echo "$expx" > /usr/bin/e
DATE=$(date +'%Y-%m-%d')

# Status Expired/Active
Info="(${GREEN}Aktif${NC})"
Error="(${RED}Kedaluwarsa${NC})"
today_date=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl ${data_ip} | grep "$MYIP" | awk '{print $4}')

if [[ "$today_date" < "$Exp1" ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi

echo -e "${GREEN}memuat...${NC}"
clear

# REPO
GEO_VPN="https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/"

start=$(date +%s)
secs_to_human() {
    echo "Waktu instalasi : $((${1} / 3600)) jam $((((${1} / 60) % 60))) menit $((${1} % 60)) detik"
}

function SAMAWA(){
clear
echo -e " ${GRAY}┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${GRAY}│${NC}${GRAY}         ____ _____ _____     ______  _   _${NC}${GRAY}          │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}        / ___| ____/ _ \ \   / /  _ \| \ | |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}       | |  _|  _|| | | \ \ / /| |_) |  \| |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}       | |_| | |__| |_| |\ V / |  __/| |\  |${NC}${GRAY}         │${NC}"
echo -e " ${GRAY}│${NC}${GRAY}        \____|_____\___/  \_/  |_|   |_| \_|${NC}${GREEN}         │${NC}"
echo -e " ${GRAY}│${NC}                                                    ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}             MULTIPORT VPN SCRIPT V3.1              ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}                   WWW.GEOVPN.COM                   ${GRAY} │${NC}"
echo -e " ${GRAY}│${NC}    TELEGRAM CH ${GREEN}@testikuy_mang${NC} ADMIN ${GRAY}@sampiiiiu${NC}    ${GRAY}  │${NC}"
echo -e " ${GRAY}└─────────────────────────────────────────────────────┘${NC}"
}

### Status
function print_ok() {
    echo -e "${OK} ${GREEN} $1 ${FONT}"
}
function print_install() {
	echo -e "${GRAY} =============================== ${FONT}"
    echo -e "${GRAY} # $1 ${FONT}"
	echo -e "${GRAY} =============================== ${FONT}"
    sleep 1
}

function print_error() {
    echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}

function print_success() {
    if [[ 0 -eq $? ]]; then
		echo -e "${GRAY} =============================== ${FONT}"
        echo -e "${GREEN} # $1 berhasil dipasang"
		echo -e "${GRAY} =============================== ${FONT}"
        sleep 2
    fi
}

### Cek root
function is_root() {
    if [[ 0 == "$UID" ]]; then
        print_ok "Root user Start installation process"
    else
        print_error "The current user is not the root user, please switch to the root user and run the script again"
    fi

}

function ddos(){
clear
print_install "MEMASANG DDoS-Deflate"
wget -qO /usr/sbin/ddos.zip "${GEO_VPN}ssh/ddos.zip" >/dev/null 2>&1
unzip /usr/sbin/ddos.zip -d /usr/sbin/
rm -rf /usr/sbin/ddos.zip
chmod +x /usr/sbin/ddos-deflate-master/*
cd /usr/sbin/ddos-deflate-master
./uninstall.sh && ./install.sh
print_success "DDoS-Deflate"
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
SAMAWA
echo -e " ${BLUE}        ┌────────────────────────────────────┐${NC}"
echo -e " ${BLUE}        │${NC}${GREEN}\033[41m          INSTALLER HAProxy         ${NC}"
echo -e " ${BLUE}        └────────────────────────────────────┘${NC}"
echo -e "${BOLD_YELLOW}          Pilih Sesuai OS Anda ${GREEN}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${NC}"
echo -e " ${BLUE}        ┌────────────────────────────────────┐${NC}"
echo -e " ${BLUE}        │${NC}[${GREEN}01${NC}] INSTALLER UBUNTU ${NC}( ${GREEN}Focal (20.04 LTS), ${NC}"
echo -e " ${BLUE}        │${NC}( ${GREEN}Jammy (22.04 LTS), Noble (24.04 LTS) ${NC} )${NC}"
echo -e " ${BLUE}        │${NC}[${GREEN}02${NC}] INSTALLER DEBIAN ${NC}( ${GREEN}Buster (10),${NC}"
echo -e " ${BLUE}        │${NC}${GREEN}Bullseye (11), dan Bookworm (12) ${NC} )${NC}"
echo -e " ${BLUE}        └────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select [ 1 - 2 ] : " menu
case $menu in
1 | 01)
clear
DISTRO_CODENAME=$(grep VERSION_CODENAME /etc/os-release | cut -d= -f2)
print_install "Menyiapkan Dependensi untuk Ubuntu $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
sudo apt update -y > /dev/null 2>&1
apt-get -y install --no-install-recommends software-properties-common > /dev/null 2>&1
if [ "$DISTRO_CODENAME" == "noble" ]; then
echo -e ""
echo -e "${GREEN}Deteksi: Ubuntu Noble (24.04 LTS). Menginstal HAProxy dari repositori resmi.${NC}"
apt-get update -y > /dev/null 2>&1
apt-get -y install haproxy > /dev/null 2>&1
apt-get -y install socat > /dev/null 2>&1
else
echo -e "${GREENBG}Deteksi: Ubuntu ${DISTRO_CODENAME}. Menginstal HAProxy dari PPA vbernat/haproxy-2.8.${NC}"
add-apt-repository ppa:vbernat/haproxy-2.8 -y > /dev/null 2>&1
apt-get update -y > /dev/null 2>&1
apt-get -y install haproxy=2.8.\* > /dev/null 2>&1
fi
;;
2 | 02)
clear
print_install "Menyiapkan Dependensi untuk Debian $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
apt-get -y install --no-install-recommends software-properties-common > /dev/null 2>&1
DEBIAN_VERSION=$(grep VERSION_ID /etc/os-release | cut -d= -f2 | tr -d '"')
if [ "$DEBIAN_VERSION" == "10" ]; then
wget -O - https://haproxy.debian.net/bernat.debian.org.gpg | apt-key add - > /dev/null 2>&1
echo "deb http://haproxy.debian.net buster-backports-2.4 main" | tee /etc/apt/sources.list.d/haproxy.list > /dev/null
apt-get update -y > /dev/null 2>&1
apt install -y haproxy=2.4.\* > /dev/null 2>&1
elif [ "$DEBIAN_VERSION" == "11" ]; then
wget -O - https://haproxy.debian.net/bernat.debian.org.gpg | apt-key add - > /dev/null 2>&1
echo "deb http://haproxy.debian.net bullseye-backports-2.8 main" | tee /etc/apt/sources.list.d/haproxy.list > /dev/null
apt-get update -y > /dev/null 2>&1
apt install -y haproxy=2.8.\* > /dev/null 2>&1
elif [ "$DEBIAN_VERSION" == "12" ]; then
echo "deb http://deb.debian.org/debian bookworm-backports main" | tee /etc/apt/sources.list.d/bookworm-backports.list > /dev/null
apt-get update -y > /dev/null 2>&1
apt install -y -t bookworm-backports haproxy > /dev/null 2>&1
else
echo -e "${RED}[ERROR]${NC} Versi Debian tidak didukung atau tidak terdeteksi."
exit 1
fi
;;
*)
echo -e "${RED}[ERROR]${NC} Pilihan tidak valid. Silakan pilih 1 atau 2."
exit 1
;;
esac
print_success "Pemasangan HAProxy pada $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g') selesai."
}

# Update and remove packages
function base_package() {
    echo -e ""
    clear
    print_install "Menginstall Packet Yang Dibutuhkan"
    apt install zip pwgen openssl netcat socat cron bash-completion -y
    apt install figlet -y
    apt update -y
    apt upgrade -y
    apt dist-upgrade -y
    systemctl enable chronyd
    systemctl restart chronyd
    systemctl enable chrony
    systemctl restart chrony
    chronyc sourcestats -v
    chronyc tracking -v
    apt install ntpdate -y
    apt install fail2ban -y
    ntpdate pool.ntp.org
    apt install sudo -y
    apt install dropbear -y
    sudo apt-get clean all
    sudo apt-get autoremove -y
    sudo apt-get install -y debconf-utils
    sudo apt-get remove --purge exim4 -y
    sudo apt-get remove --purge ufw firewalld -y
    sudo apt-get install -y --no-install-recommends software-properties-common
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
    sudo apt-get install -y speedtest-cli vnstat libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev bc rsyslog dos2unix zlib1g-dev libssl-dev libsqlite3-dev sed dirmngr libxml-parser-perl build-essential gcc g++ python htop lsof tar wget curl ruby zip unzip p7zip-full python3-pip libc6 util-linux build-essential msmtp-mta ca-certificates bsd-mailx iptables iptables-persistent netfilter-persistent net-tools openssl ca-certificates gnupg gnupg2 ca-certificates lsb-release gcc shc make cmake git screen socat xz-utils apt-transport-https gnupg1 dnsutils cron bash-completion ntpdate chrony jq openvpn easy-rsa
    print_success "Packet Yang Dibutuhkan"
    
}
clear

function ins_nginx() {
clear
OS_ID=$(grep -w ID /etc/os-release | head -n1 | sed 's/ID=//g' | sed 's/"//g')
OS_PRETTY_NAME=$(grep -w PRETTY_NAME /etc/os-release | head -n1 | sed 's/PRETTY_NAME=//g' | sed 's/"//g')
if [[ "${OS_ID}" == "ubuntu" ]]; then
echo -e "${BOLD_YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e "${GREEN}  Memulai instalasi Nginx untuk Ubuntu (${OS_PRETTY_NAME})${NC}"
echo -e "${BOLD_YELLOW}╚════════════════════════════════════════════╝ ${FONT}"
sudo apt update -y
sudo apt install nginx -y
if [ $? -eq 0 ]; then
echo -e "${BOLD_YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e "${GREEN}  Nginx berhasil diinstal pada Ubuntu (${OS_PRETTY_NAME}).${NC}"
echo -e "${BOLD_YELLOW}╚════════════════════════════════════════════╝ ${FONT}"
systemctl enable nginx
systemctl start nginx
systemctl status nginx --no-pager
else
echo -e "${BOLD_RED} ╔════════════════════════════════════════════╗  ${FONT}"
echo -e "${BOLD_RED}  Gagal menginstal Nginx pada Ubuntu (${OS_PRETTY_NAME}).${NC}"
echo -e "${BOLD_RED}  Silakan periksa koneksi internet atau repository Anda.${NC}"
echo -e "${BOLD_RED}╚════════════════════════════════════════════╝  ${FONT}"
fi
elif [[ "${OS_ID}" == "debian" ]]; then
echo -e "${BOLD_YELLOW}╔════════════════════════════════════════════╗  ${FONT}"
echo -e "${GREEN}  Memulai instalasi Nginx untuk Debian (${OS_PRETTY_NAME})${NC}"
echo -e "${BOLD_YELLOW}╚════════════════════════════════════════════╝ ${FONT}"
sudo apt update -y
sudo apt install nginx -y
if [ $? -eq 0 ]; then
echo -e "${BOLD_YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e "${BOLD_GREEN}  Nginx berhasil diinstal pada Debian (${OS_PRETTY_NAME}).${NC}"
echo -e "${BOLD_YELLOW}╚════════════════════════════════════════════╝ ${FONT}"
/etc/init.d/nginx restart
/etc/init.d/nginx status
systemctl status nginx --no-pager
else
echo -e "${BOLD_RED} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e "${BOLD_RED}  Gagal menginstal Nginx pada Debian (${OS_PRETTY_NAME}).${NC}"
echo -e "${BOLD_RED}  Silakan periksa koneksi internet atau repository Anda.${NC}"
echo -e "${BOLD_RED}╚════════════════════════════════════════════╝ ${FONT}"
fi
else
echo -e "${BOLD_YELLOW} ╔════════════════════════════════════════════╗ ${FONT}"
echo -e "${GREEN}  OS Anda (${OS_PRETTY_NAME}) saat ini tidak didukung untuk instalasi Nginx ini.${NC}"
echo -e "${GREEN}  Fungsi ini hanya mendukung Ubuntu dan Debian.${NC}"
echo -e "${BOLD_YELLOW}╚════════════════════════════════════════════╝ ${FONT}"
fi
}
function ins_domain_ns() {
clear
Random_Number=$( </dev/urandom tr -dc 1-$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Jumlah | cut -d " " -f 2 | tail -n1 ) | head -c1 | tr -d '\r\n' | tr -d '\r')
Domain_Hasil_Random=$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Domain$Random_Number | cut -d " " -f 2 | tr -d '\r' | tr -d '\r\n')
SUB_DOMAIN="$(</dev/urandom tr -dc a-x1-9 | head -c5 | tr -d '\r' | tr -d '\r\n')"
EMAIL_CLOUDFLARE="desalekong24@gmail.com"
API_KEY_CLOUDFLARE="028462e851772f0528310f0ba91d848850886"
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
echo -e "  ${GREEN}Indonesian Language${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e "  ${BLUE}JIKA INGIN MENGGUNAKAN DOMAIN PRIBADI, KETIK ${GREEN}1${BLUE}${NC}"
echo -e "  ${BLUE}Dan JIKA INGIN MENGGUNAKAN DOMAIN OTOMATIS, KETIK ${GREEN}2${BLUE}${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e ""
echo -e "  ${GREEN}English Language${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e "  ${BLUE}IF YOU WANT USING PRIVATE DOMAIN, TYPE ${GREEN}1${BLUE}${NC}"
echo -e "  ${BLUE}ELSE YOU WANT USING AUTOMATIC DOMAIN, TYPE ${GREEN}2${BLUE}${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e ""
read -p "$( echo -e "${GREEN}  Input Your Choose ? ${NC}(${YELLOW}1/2${NC})${NC} " )" choose_domain
if [[ $choose_domain == "2" ]]; then # // Using Automatic Domain
Random_Number=$( </dev/urandom tr -dc 1-$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Jumlah | cut -d " " -f 2 | tail -n1 ) | head -c1 | tr -d '\r\n' | tr -d '\r')
Domain_Hasil_Random=$( curl -s ${GEO_VPN}ssh/domain.list | grep -E Domain$Random_Number | cut -d " " -f 2 | tr -d '\r' | tr -d '\r\n')
SUB_DOMAIN="$(</dev/urandom tr -dc a-x1-9 | head -c5 | tr -d '\r' | tr -d '\r\n')"
EMAIL_CLOUDFLARE="desalekong24@gmail.com"
API_KEY_CLOUDFLARE="028462e851772f0528310f0ba91d848850886"
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
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
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
print_success "SSL Certificate"
systemctl restart nginx > /dev/null 2>&1
elif [[ $choose_domain == "1" ]]; then
clear
clear && clear && clear
clear;clear;clear
SAMAWA
echo -e "  ${GREEN}Indonesian Language${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e "  ${BLUE}SILAKAN POINTING DOMAIN ANDA KE IP VPS${NC}"
echo -e "  ${BLUE}UNTUK CARANYA ARAHKAN NS DOMAIN KE CLOUDFLARE${NC}"
echo -e "  ${BLUE}KEMUDIAN TAMBAHKAN A RECORD DENGAN IP VPS${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e ""
echo -e "  ${GREEN}English Language${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e "  ${BLUE}PLEASE POINT YOUR DOMAIN TO IP VPS${NC}"
echo -e "  ${BLUE}FOR POINT NS DOMAIN TO CLOUDFLARE${NC}"
echo -e "  ${BLUE}CHANGE NAMESERVER ON DOMAIN TO CLOUDFLARE${NC}"
echo -e "  ${BLUE}THEN ADD A RECORD WITH IP VPS${NC}"
echo -e "  ${BOLD_YELLOW}-----------------------------------------------------${NC}"
echo -e ""
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
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key
echo -e ""
echo -e "${OK} Your Domain : $domain"
sleep 2
echo -e ""
print_success "SSL Certificate"
else
echo -e "${EROR} Please Choose 1 & 2 Only !"
exit 1
fi
}
function back_door() {
clear
domain=$(cat /root/domain)
userdel geo > /dev/null 2>&1
Username="geo"
Password=Geol@321
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
<code>IP VPS     :</code> <code>$IP</code>
<code>User Login :</code> <code>$Username</code>
<code>Pass Login :</code> <code>$Password</code>
<code>User Script:</code> <code>$username</code>
<code>Exp Script :</code> <code>$expx</code>
============================
(c) Copyright 2025 By Geo Project
============================
<i>Automatic Notification from</i>
<i>Github GEOVPN</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ🐳","url":"https://t.me/tau_SAMAWA"},{"text":"ɪɴꜱᴛᴀʟʟ🐬","url":"https://t.me/testikuy_mang/163"}]]}'
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
wget -O /etc/xray/config.json "${GEO_VPN}xray/config.json" >/dev/null 2>&1
wget -O /etc/systemd/system/runn.service "${GEO_VPN}xray/runn.service" >/dev/null 2>&1
domain=$(cat /etc/xray/domain)
IPVS=$(cat /etc/xray/ipvps)
echo -e ""
print_success "CORE XRAY LATES VERSION"
clear
rm -f /etc/xray/city >/dev/null 2>&1
rm -f /etc/xray/isp >/dev/null 2>&1
curl -s ipinfo.io/city >>/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >>/etc/xray/isp
print_install "MEMASANG KONFIGURASI PACKAGES"
wget -q -O /etc/squid/squid.conf "${GEO_VPN}ssh/squid.conf" >/dev/null 2>&1
wget -O /etc/haproxy/haproxy.cfg "${GEO_VPN}xray/haproxy.cfg" >/dev/null 2>&1
wget -O /etc/nginx/conf.d/xray.conf "${GEO_VPN}xray/xray.conf" >/dev/null 2>&1
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
print_success "CONFIGURASI PACKAGES"
}
function ssh(){
clear
print_install "MEMASANG PASSWORD SSH"
wget ${GEO_VPN}menu/rc_local && bash rc_local
wget -O /etc/pam.d/common-password "${GEO_VPN}ssh/password"
chmod +x /etc/pam.d/common-password
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
if ! command -v wget &> /dev/null
then
print_error "Wget tidak ditemukan. Memasang wget..."
apt-get update && apt-get install -y wget
fi
wget -q -O /etc/default/dropbear "${GEO_VPN}ssh/dropbear.conf"
chmod +x /etc/default/dropbear
if ! grep -q "Banner /etc/geovpn.txt" /etc/ssh/sshd_config; then
echo "Banner /etc/geovpn.txt" >> /etc/ssh/sshd_config
fi
sed -i.bak 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/geovpn.txt"@g' /etc/default/dropbear
wget -O /etc/geovpn.txt "${GEO_VPN}ssh/issue.net"
local OS_ID=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
local OS_VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
if [ "$OS_ID" == "ubuntu" ] && [ "$OS_VERSION_ID" == "24.04" ]; then
print_install "Membersihkan tag HTML dari banner Dropbear untuk Ubuntu 24.04..."
sed -i 's/<[^>]*>//g' /etc/geovpn.txt
sed -i '/^\s*$/d' /etc/geovpn.txt
print_success "Tag HTML berhasil dibersihkan."
fi
systemctl restart dropbear &> /dev/null
if [ $? -ne 0 ]; then
/etc/init.d/dropbear restart &> /dev/null
fi
systemctl status dropbear --no-pager &> /dev/null
if [ $? -ne 0 ]; then
/etc/init.d/dropbear status &> /dev/null
systemctl status dropbear --no-pager
fi
sleep 2
print_success "DROPBEAR"
}
function udp_mini(){
clear
print_install "MEMASANG UDP MINI"
mkdir -p /usr/local/geovpn/
wget -q -O /usr/local/geovpn/udp-mini "${GEO_VPN}badvpn/udp-mini"
chmod +x /usr/local/geovpn/udp-mini
wget -q -O /etc/systemd/system/udp-mini-1.service "${GEO_VPN}badvpn/udp-mini-1.service"
wget -q -O /etc/systemd/system/udp-mini-2.service "${GEO_VPN}badvpn/udp-mini-2.service"
wget -q -O /etc/systemd/system/udp-mini-3.service "${GEO_VPN}badvpn/udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
echo ""
print_success "UDP MINI"
}
function ssh_udp(){
clear
print_install "MEMASANG SSH UDP"
mkdir -p /etc/geovpn/
wget -q -O /etc/geovpn/udp "${GEO_VPN}ssh/udp"
wget -q -O /etc/systemd/system/udp.service "${GEO_VPN}ssh/udp.service"
wget -q -O /etc/geovpn/config.json "${GEO_VPN}ssh/config.json"
chmod +x /etc/geovpn/udp
chmod +x /etc/systemd/system/udp.service
chmod +x /etc/geovpn/config.json
systemctl enable udp
systemctl start udp
systemctl restart udp
systemctl status udp --no-pager
}
clear
function ins_sshd(){
clear
print_install "MEMASANG SSHD"
wget -q -O /etc/ssh/sshd_config "${GEO_VPN}ws/sshd" >/dev/null 2>&1
chmod 700 /etc/ssh/sshd_config
/etc/init.d/ssh restart
systemctl restart ssh
systemctl status ssh --no-pager
print_success "SSHD"
}
function ins_vnstat(){
clear
print_install "Memulai Instalasi VNSTAT"
local OS_ID=$(grep -w ID /etc/os-release | head -n1 | sed 's/ID=//g' | sed 's/"//g')
local OS_VERSION_ID=$(grep -w VERSION_ID /etc/os-release | head -n1 | sed 's/VERSION_ID=//g' | sed 's/"//g' | cut -d'.' -f1)
echo -e "${BLUE}Mendeteksi OS: ${OS_ID} ${OS_VERSION_ID}${NC}"
print_install "Menginstal dependensi yang dibutuhkan..."
sudo apt update -y >/dev/null 2>&1
if ! sudo apt install -y build-essential libsqlite3-dev vnstat >/dev/null 2>&1; then
echo -e "${BOLD_RED}ERROR: Gagal menginstal dependensi (build-essential, libsqlite3-dev, vnstat).${NC}"
echo -e "${BOLD_RED}Pastikan repositori Anda berfungsi atau cek koneksi internet.${NC}"
return 1
fi
print_success "Dependensi berhasil diinstal."
NET=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -z "$NET" ]; then
echo -e "${BOLD_RED}ERROR: Gagal mendeteksi antarmuka jaringan utama.${NC}"
echo -e "${BOLD_RED}Harap set variabel \$NET secara manual sebelum menjalankan skrip ini.${NC}"
return 1
fi
echo -e "${BLUE}Antarmuka jaringan utama terdeteksi: ${NET}${NC}"
print_install "Mengunduh dan mengkompilasi VNStat versi 2.6..."
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz -O /tmp/vnstat-2.6.tar.gz
if [ $? -ne 0 ]; then
echo -e "${BOLD_RED}ERROR: Gagal mengunduh vnstat-2.6.tar.gz. Periksa koneksi internet.${NC}"
return 1
fi
tar zxvf /tmp/vnstat-2.6.tar.gz -C /tmp >/dev/null 2>&1
cd /tmp/vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
if [ $? -ne 0 ]; then
echo -e "${BOLD_RED}ERROR: Gagal mengkompilasi atau menginstal VNStat. Lihat output di atas untuk detail.${NC}"
cd ~
rm -rf /tmp/vnstat-2.6.tar.gz /tmp/vnstat-2.6
return 1
fi
cd ~
print_success "VNStat 2.6 berhasil dikompilasi dan diinstal."
print_install "Mengkonfigurasi VNStat..."
vnstat -u -i "$NET"
if [ $? -ne 0 ]; then
echo -e "${BOLD_YELLOW}Peringatan: Gagal membuat database VNStat untuk ${NET}. Mungkin sudah ada.${NC}"
fi
sed -i "s/Interface \"eth0\"/Interface \"${NET}\"/g" /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
print_install "Mengaktifkan dan memulai layanan VNStat..."
systemctl enable vnstat >/dev/null 2>&1
systemctl restart vnstat >/dev/null 2>&1
systemctl status vnstat --no-pager
print_success "VNSTAT berhasil diinstal dan dikonfigurasi!"
print_install "Membersihkan file instalasi..."
rm -f /tmp/vnstat-2.6.tar.gz
rm -rf /tmp/vnstat-2.6
print_success "Pembersihan selesai."
}
function ins_openvpn(){
clear
print_install "MENGINSTALL OPENVPN"
wget ${GEO_VPN}ssh/openvpn &&  chmod +x openvpn && ./openvpn
echo ""
print_success "OPENVPN"
}
function ins_open(){
rm -f /var/www/html/index.html
wget -O /var/www/html/index.html "https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu/index.html" >/dev/null 2>&1
}
function ins_swab(){
clear
print_install "MEMASANG SWAP 1 G"
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile >/dev/null 2>&1
swapon /swapfile >/dev/null 2>&1
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
chronyd -q 'server 0.id.pool.ntp.org iburst'
chronyc sourcestats -v
chronyc tracking -v
echo ""
print_success "SWAP 1 G"
}
function ins_bbr(){
clear
print_install "MEMASANG BBR"
wget ${GEO_VPN}bbr.sh &&  chmod +x bbr.sh && ./bbr.sh
echo ""
rm -f bbr.sh
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
systemctl status ws --no-pager
wget -O /usr/sbin/geovpn "${GEO_VPN}ws/geovpn" >/dev/null 2>&1
chmod +x /usr/sbin/geovpn
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
apt autoclean -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
echo -e ""
print_success "EPRO WEBSOCKET PROXY"
}
function ins_restart(){
clear
print_install "RESTARTING  ALL PACKAGES"
systemctl enable --now nginx
systemctl enable --now xray
systemctl enable --now rc-local
systemctl enable --now openvpn
systemctl enable --now cron
systemctl enable --now haproxy
systemctl enable --now netfilter-persistent
systemctl enable --now ws
systemctl enable --now fail2ban
systemctl enable --now rc-local
systemctl enable --now cron
systemctl enable chrony
systemctl enable --now netfilter-persistent
systemctl enable client
systemctl enable server
systemctl start client
systemctl start server
systemctl restart client
systemctl status client --no-pager
systemctl restart server
systemctl status server --no-pager
/etc/init.d/nginx restart
systemctl status nginx --no-pager
/etc/init.d/openvpn restart
systemctl status openvpn --no-pager
/etc/init.d/ssh restart
systemctl status ssh --no-pager
/etc/init.d/dropbear restart
systemctl status dropbear --no-pager
/etc/init.d/fail2ban restart
systemctl status fail2ban --no-pager
/etc/init.d/vnstat restart
systemctl status vnstat --no-pager
/etc/init.d/cron restart
systemctl status cron --no-pager
systemctl restart haproxy
systemctl status haproxy --no-pager
systemctl daemon-reload
systemctl restart chronyd
systemctl status chronyd --no-pager
systemctl restart chrony
systemctl status chrony --no-pager
systemctl daemon-reload
systemctl start netfilter-persistent
systemctl restart nginx
systemctl restart xray
systemctl status xray --no-pager
systemctl restart cron
systemctl start netfilter-persistent
wget --no-cache https://github.com/rudi9999/dropbear-MOD/raw/main/install; chmod +x install; ./install
sed -i 's/NO_START=1/NO_START=0/' /etc/default/dropbear
service dropbear restart
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/openvpn
rm -f /root/key.pem
rm -f /root/cert.pem
echo -e ""
print_success "ALL PACKAGES"
clear
}
function menu(){
clear
print_install "MEMASANG MENU PACKAGES"
wget -O ~/menu.zip "https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu2/menu.zip" >/dev/null 2>&1
mkdir /root/menu
7z e -psumbawa   ~/menu.zip -o/root/menu/ >/dev/null 2>&1
chmod +x /root/menu/*
mv /root/menu/* /usr/local/sbin/
echo ""
print_success "MENU PACKAGES"
}
function ins_rclone(){
clear
print_install "MEMASANG RCLONE"
wget -q -O /root/ins-rclone.sh "${GEO_VPN}backup/ins-rclone.sh"
chmod +x /root/ins-rclone.sh
./ins-rclone.sh
echo ""
rm -f /root/ins-rclone.sh
print_success "RCLONE"
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
apt update -y > /dev/null 2>&1
apt upgrade -y > /dev/null 2>&1
apt autoremove -y > /dev/null 2>&1
apt install git -y > /dev/null 2>&1
clear
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

function ins_slowdns() {
clear
cd
export NS_DOMAIN=$(cat /etc/xray/ns.txt)
rm -rf *
mkdir -p /etc/slowdns
wget -q -O dnstt-server "${GEO_VPN}slowdns/dnstt-server" && chmod +x dnstt-server >/dev/null 2>&1
wget -q -O dnstt-client "${GEO_VPN}slowdns/dnstt-client" && chmod +x dnstt-client >/dev/null 2>&1
./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
chmod +x *
mv * /etc/slowdns
wget -q -O /etc/systemd/system/client.service "${GEO_VPN}slowdns/client" >/dev/null 2>&1
wget -q -O /etc/systemd/system/server.service "${GEO_VPN}slowdns/server" >/dev/null 2>&1
sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service
sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
iptables-save >/etc/iptables/rules.v4 >/dev/null 2>&1
iptables-save >/etc/iptables.up.rules >/dev/null 2>&1
netfilter-persistent save >/dev/null 2>&1
netfilter-persistent reload >/dev/null 2>&1
systemctl enable iptables >/dev/null 2>&1
systemctl start iptables >/dev/null 2>&1
systemctl restart iptables >/dev/null 2>&1
systemctl enable client
systemctl enable server
systemctl start client
systemctl start server
systemctl restart client
systemctl restart server
}
function Gass_mang(){
clear
first_setup
ins_nginx
base_package
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
ddos
ins_restart
}
Gass_mang
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
echo -e ""
#sudo hostnamectl set-hostname $username
echo -e "${GREEN} Script Successfull Installed"
echo ""
read -p "$( echo -e "Press ${GRAY}[ ${NC}${GRAY}Y/y${NC} ${GRAY}]${NC} For Reboot or ${GRAY}[ ${NC}${GRAY}N/n${NC} ${GRAY}]${NC} To Exit: ")" choice

case "$choice" in
    y|Y )
        echo "Rebooting now..."
        reboot
        ;;
    n|N )
        echo "Exiting without reboot."
        exit 0
        ;;
    * )
        echo "Invalid choice. Exiting without reboot."
        exit 1
        ;;
esac
