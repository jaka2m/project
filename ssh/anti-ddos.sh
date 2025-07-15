#!/bin/sh

#######################################
#  ANTI-DDOS BASH SCRIPT - IMPROVED   #
#######################################
#      DEVELOPER : GEO PROJECT        #
#     IMPROVED BY : AI Assistant      #
#######################################
clear

### Definisi Warna
export BLUE='\033[0;34m'
export GREEN='\033[0;32m'
export CYAN='\033[0;36m'
export YELLOW='\033[0;33m'
export RED='\033[0;31m'
export NC='\033[0m' # No Color / Reset

# Warna Teks Tebal dan Terang
export BOLD_BLUE='\033[1;94m'
export BOLD_GREEN='\033[1;92m'
export BOLD_CYAN='\033[1;96m'
export BOLD_YELLOW='\033[1;93m'
export BOLD_RED='\033[1;91m'

# Variabel Status & Info
export OK="[ ${BOLD_GREEN}OK${NC} ]"
export ERROR="[ ${BOLD_RED}ERROR${NC} ]"
export INFO="[ ${BOLD_CYAN}INFO${NC} ]"
# Variabel 'nc' sudah didefinisikan sebelumnya, jadi tetap dipertahankan
export nc="${NC}" 

# Variabel status ON/OFF untuk Wondershaper
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Font_color_suffix="\033[0m"
Status_ON="${Green_font_prefix}[ON]${Font_color_suffix}"
Status_OFF="${Red_font_prefix}[OFF]${Font_color_suffix}"

# Variabel untuk BBR TCP
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
cur_dir=$(pwd) # Direktori saat ini untuk log BBR


### Pengecekan Awal


# Cek apakah skrip dijalankan sebagai root
if [ "$(id -u)" -ne 0 ]; then
    echo "${BOLD_RED}Error:${NC} Harap jalankan skrip ini sebagai root."
    exit 1
fi

# Cek Sistem Operasi
if [[ -e /etc/debian_version ]]; then
    source /etc/os-release
    OS=$ID # debian or ubuntu
elif [[ -e /etc/centos-release ]]; then
    source /etc/os-release
    OS=centos
else
    echo "${BOLD_RED}Error:${NC} Sistem Operasi tidak didukung. Skrip ini hanya untuk Debian, Ubuntu, atau CentOS."
    exit 1
fi

# Dapatkan nama Network Interface Card (NIC) untuk Wondershaper
NIC=$(ip -o -4 route show to default | awk '{print $5}' | head -1)
if [ -z "$NIC" ]; then
    echo "${BOLD_RED}Error:${NC} Tidak dapat mendeteksi Network Interface Card (NIC). Wondershaper mungkin tidak berfungsi."
    # Lanjutkan skrip, tetapi Wondershaper akan dilewati jika NIC tidak terdeteksi.
fi


### Fungsi Umum


# Fungsi untuk memeriksa apakah input adalah digit
is_digit(){
    local input=${1}
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Fungsi untuk memeriksa arsitektur 64-bit
is_64bit(){
    if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ]; then
        return 0
    else
        return 1
    fi
}

# Fungsi untuk mendapatkan nama variabel yang valid
get_valid_valname(){
    local val=${1}
    local new_val=$(eval echo "$val" | sed 's/[-.]/_/g')
    echo "${new_val}"
}

# Fungsi untuk mendapatkan hint dari variabel
get_hint(){
    local val=${1}
    local new_val=$(get_valid_valname "$val")
    eval echo "\$hint_${new_val}"
}

# Fungsi untuk menampilkan menu (digunakan oleh BBR)
display_menu(){
    local soft=${1}
    local default=${2}
    eval local arr=(\${${soft}_arr[@]})
    local default_prompt
    if [[ "$default" != "" ]]; then
        if [[ "$default" == "last" ]]; then
            default=${#arr[@]}
        fi
        default_prompt="(default ${arr[$default-1]})"
    fi
    local pick
    local hint
    local vname
    local prompt="which ${soft} you'd select ${default_prompt}: "

    while :
    do
        echo -e "\n ${soft} setting \n"
        for ((i=1;i<=${#arr[@]};i++ )); do
            vname="$(get_valid_valname "${arr[$i-1]}")"
            hint="$(get_hint "$vname")"
            [[ "$hint" == "" ]] && hint="${arr[$i-1]}"
            echo -e "${green}${i}${plain}) $hint"
        done
        echo
        read -p "${prompt}" pick
        if [[ "$pick" == "" && "$default" != "" ]]; then
            pick=${default}
            break
        fi

        if ! is_digit "$pick"; then
            prompt="Input error, please input a number: "
            continue
        fi

        if [[ "$pick" -lt 1 || "$pick" -gt ${#arr[@]} ]]; then
            prompt="Input error, please input a number between 1 and ${#arr[@]}: "
            continue
        fi

        break
    done

    eval ${soft}=${arr[$pick-1]}
    vname="$(get_valid_valname "${arr[$pick-1]}")"
    hint="$(get_hint "$vname")"
    [[ "$hint" == "" ]] && hint="${arr[$pick-1]}"
    echo -e "\nyour selection: $hint\n"
}

# Fungsi untuk membandingkan versi
version_ge(){
    test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"
}

# Fungsi untuk mendapatkan versi OS
get_opsy() {
    [ -f /etc/redhat-release ] && awk '{print ($1,$3~/^[0-9]/?$3:$4)}' /etc/redhat-release && return
    [ -f /etc/os-release ] && awk -F'[= "]' '/PRETTY_NAME/{print $3,$4,$5}' /etc/os-release && return
    [ -f /etc/lsb-release ] && awk -F'[="]+' '/DESCRIPTION/{print $2}' /etc/lsb-release && return
}

opsy=$( get_opsy )
arch=$( uname -m )
lbit=$( getconf LONG_BIT )
kern=$( uname -r )

# Fungsi untuk mendapatkan input karakter tunggal (tidak digunakan langsung, tapi dipertahankan)
get_char() {
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    # dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}

# Fungsi untuk mendapatkan versi
getversion() {
    if [[ -s /etc/redhat-release ]]; then
        grep -oE "[0-9.]+" /etc/redhat-release
    else
        grep -oE "[0-9.]+" /etc/issue
    fi
}

# Fungsi untuk memeriksa versi CentOS
centosversion() {
    # 'release' variabel tidak didefinisikan secara global. Gunakan 'OS' yang sudah didefinisikan.
    if [ x"${OS}" == x"centos" ]; then
        local code=$1
        local version="$(getversion)"
        local main_ver=${version%%.*}
        if [ "$main_ver" == "$code" ]; then
            return 0
        else
            return 1
        fi
    else
        return 1
    fi
}

# Fungsi untuk memeriksa status BBR
check_bbr_status() {
    local param=$(sysctl net.ipv4.tcp_congestion_control | awk '{print $3}')
    if [[ x"${param}" == x"bbr" ]]; then
        return 0
    else
        return 1
    fi
}

# Fungsi untuk memeriksa versi kernel
check_kernel_version() {
    local kernel_version=$(uname -r | cut -d- -f1)
    if version_ge "${kernel_version}" 4.9; then
        return 0
    else
        return 1
    fi
}


### Instalasi dan Pembaruan Sistem

echo ""
echo -e "${BOLD_GREEN}Memperbarui dan menginstal paket yang diperlukan...${NC}"
sleep 1.0
clear

# Paket umum yang dibutuhkan
COMMON_PACKAGES="zip unzip tar gzip p7zip-full dnsutils net-tools tcpdump dsniff grepcidr fail2ban netfilter-persistent"

if [[ $OS == 'ubuntu' || $OS == 'debian' ]]; then
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y $COMMON_PACKAGES
elif [[ ${OS} == 'centos' ]]; then
    yum -y update
    yum -y install $COMMON_PACKAGES
    # P7zip di CentOS mungkin perlu epel-release
    if ! command -v p7zip &> /dev/null; then
        echo -e "${INFO} Menginstal epel-release untuk p7zip...${NC}"
        yum install -y epel-release
        yum -y install p7zip p7zip-plugins
    fi
fi


### Informasi Awal Skrip

clear
echo -e "${BOLD_GREEN} ============================="
echo -e "${BOLD_YELLOW} # Protection VPS V2.0         #${NC}"
echo -e "${BOLD_YELLOW} # Credit jgmdev             #${NC}"
echo -e "${BOLD_YELLOW} # Made By Geo Project         #${NC}"
echo -e "${BOLD_GREEN} ============================="
echo ""
echo -e "${BOLD_GREEN}Protection-VPS Installer Versi 2.0 Akan Dimulai${NC}"
echo ""
sleep 0.5
echo -e "${BOLD_YELLOW}Laporkan Bug: https://t.me/sampiiiiu${NC}"
echo ""
sleep 0.5
echo -e "${BOLD_GREEN}Installer Protection-VPS akan dimulai sekarang...${NC}"
echo ""
sleep 0.5
clear


### Instalasi Anti-DDoS (ddos-deflate)

echo ""
echo -e "${BOLD_GREEN}Memulai instalasi Anti DDoS (ddos-deflate)...${NC}"
sleep 0.5
clear

cd /tmp # Gunakan direktori sementara untuk unduhan
wget -q "https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/ssh/ddos-deflate-master.zip" -O ddos-deflate-master.zip
if [ $? -eq 0 ]; then
    unzip -q ddos-deflate-master.zip
    cd ddos-deflate-master || { echo "${BOLD_RED}ERROR:${NC} Gagal masuk ke direktori ddos-deflate-master."; exit 1; }
    ./install.sh
    cd /tmp || { echo "${BOLD_RED}ERROR:${NC} Gagal kembali ke direktori /tmp."; exit 1; }
    rm -rf ddos-deflate-master.zip ddos-deflate-master
    echo -e "${BOLD_GREEN}Instalasi Anti DDoS Selesai.${NC}"
else
    echo -e "${BOLD_RED}Error:${NC} Gagal mengunduh ddos-deflate-master.zip. Instalasi Anti DDoS dihentikan."
fi
clear


### Instalasi Anti-Torrent

echo ""
echo -e "${BOLD_GREEN}Memulai instalasi Anti Torrent...${NC}"
sleep 0.5
clear

# Buat atau edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# Buat atau edit file /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Beri izin eksekusi
chmod +x /etc/rc.local

# Aktifkan dan mulai service rc-local
systemctl enable rc-local &>/dev/null
systemctl start rc-local.service &>/dev/null

# Nonaktifkan IPv6 Forwarding
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
# Tambahkan ke rc.local jika belum ada
grep -qxF 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local || sed -i '/exit 0/i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# Aktifkan IPv4 Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Aturan IPTables untuk memblokir torrent
# Hapus aturan yang mungkin ada sebelumnya untuk menghindari duplikasi
iptables -F FORWARD # Hapus semua aturan di chain FORWARD
iptables -X         # Hapus semua chain yang tidak digunakan

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

# Simpan dan muat ulang aturan netfilter-persistent
netfilter-persistent save >/dev/null 2>&1
netfilter-persistent reload >/dev/null 2>&1
echo -e "${BOLD_GREEN}Instalasi Anti Torrent Selesai.${NC}"
clear


### Instalasi BBR TCP

echo ""
echo -e "${BOLD_GREEN}Memulai instalasi BBR TCP...${NC}"
sleep 1.0
clear

# Fungsi BBR TCP (dipertahankan seperti aslinya dengan perbaikan kecil)
install_elrepo() {
    if centosversion 5; then
        echo -e "${red}Error:${plain} CentOS 5 tidak didukung untuk instalasi BBR."
        exit 1
    fi

    rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

    if centosversion 6; then
        rpm -Uvh https://www.elrepo.org/elrepo-release-6-8.el6.elrepo.noarch.rpm
    elif centosversion 7; then
        rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
    elif centosversion 8; then # Tambahkan dukungan CentOS 8 jika diperlukan ELRepo
        yum install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
    fi

    if [ ! -f /etc/yum.repos.d/elrepo.repo ]; then
        echo -e "${BOLD_RED}Error:${plain} Instalasi elrepo gagal, harap periksa koneksi internet Anda atau repositori."
        exit 1
    fi
}

sysctl_config() {
    sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
    echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
    sysctl -p >/dev/null 2>&1
}

install_config() {
    if [[ x"${OS}" == x"centos" ]]; then
        if centosversion 6; then
            if [ ! -f "/boot/grub/grub.conf" ]; then
                echo -e "${red}Error:${plain} /boot/grub/grub.conf tidak ditemukan. Instalasi BBR mungkin memerlukan konfigurasi manual Grub."
                # Tidak exit 1, agar tetap lanjut jika ada cara lain.
            else
                sed -i 's/^default=.*/default=0/g' /boot/grub/grub.conf
            fi
        elif centosversion 7 || centosversion 8; then # CentOS 7/8 menggunakan grub2
            if [ ! -f "/boot/grub2/grub.cfg" ]; then
                echo -e "${red}Error:${plain} /boot/grub2/grub.cfg tidak ditemukan. Instalasi BBR mungkin memerlukan konfigurasi manual Grub2."
                # Tidak exit 1
            else
                grub2-set-default 0
            fi
        fi
    elif [[ x"${OS}" == x"debian" || x"${OS}" == x"ubuntu" ]]; then
        /usr/sbin/update-grub >/dev/null 2>&1
    fi
}

get_latest_version() {
    # Cek ketersediaan wget
    if ! command -v wget &> /dev/null; then
        echo -e "${red}Error:${plain} wget tidak ditemukan. Instalasi BBR gagal."
        exit 1
    fi
    
    # Perbaikan URL dan pemrosesan yang lebih robust
    latest_version=($(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/ | awk -F'\"v' '/v[4-9]\.[0-9]+\.[0-9]+/{print $2}' | cut -d/ -f1 | grep -v -rc | sort -V))

    [ ${#latest_version[@]} -eq 0 ] && echo -e "${red}Error:${plain} Gagal mendapatkan versi kernel terbaru dari Ubuntu mainline PPA." && exit 1

    kernel_arr=()
    for i in ${latest_version[@]}; do
        if version_ge "$i" 4.14; then # BBR direkomendasikan pada 4.9+, tetapi 4.14+ lebih stabil untuk beberapa fitur
            kernel_arr+=("$i");
        fi
    done

    # Pastikan ada kernel yang memenuhi syarat
    [ ${#kernel_arr[@]} -eq 0 ] && echo -e "${red}Error:${plain} Tidak ada versi kernel yang sesuai (>= 4.14) ditemukan." && exit 1

    display_menu kernel last

    local kernel_download_base_url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${kernel}/"
    
    if is_64bit; then
        deb_kernel_image_pattern="linux-image-unsigned-${kernel}.*amd64.deb" # Ubuntu 20.04+ menggunakan unsigned
        deb_kernel_modules_pattern="linux-modules-${kernel}.*amd64.deb"
        
        # Cari nama file yang tepat
        deb_kernel_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_image_pattern}" | head -1)
        deb_kernel_modules_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_modules_pattern}" | head -1)
        
        # Fallback untuk nama file lama jika unsigned tidak ditemukan
        if [ -z "$deb_kernel_name" ]; then
            deb_kernel_image_pattern="linux-image-${kernel}.*amd64.deb"
            deb_kernel_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_image_pattern}" | head -1)
        fi

    else # 32-bit (i386)
        deb_kernel_image_pattern="linux-image-unsigned-${kernel}.*i386.deb"
        deb_kernel_modules_pattern="linux-modules-${kernel}.*i386.deb"
        
        deb_kernel_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_image_pattern}" | head -1)
        deb_kernel_modules_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_modules_pattern}" | head -1)

        if [ -z "$deb_kernel_name" ]; then
            deb_kernel_image_pattern="linux-image-${kernel}.*i386.deb"
            deb_kernel_name=$(wget -qO- "$kernel_download_base_url" | grep -oP "${deb_kernel_image_pattern}" | head -1)
        fi
    fi

    # Pastikan nama file ditemukan sebelum mencoba mengunduh
    [ -z "${deb_kernel_name}" ] && echo -e "${red}Error:${plain} Gagal mendapatkan nama paket biner kernel Linux (${kernel}). Mungkin pembuatan kernel gagal atau arsitektur tidak cocok. Silakan pilih kernel lain dan coba lagi." && exit 1

    deb_kernel_url="${kernel_download_base_url}${deb_kernel_name}"
    deb_kernel_modules_url="${kernel_download_base_url}${deb_kernel_modules_name}"
}

install_bbr() {
    check_bbr_status
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${BOLD_GREEN}Info:${nc} TCP BBR sudah terinstal dan aktif. Tidak ada yang perlu dilakukan."
        exit 0
    fi

    check_kernel_version
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${BOLD_GREEN}Info:${nc} Versi kernel Anda (${kern}) sudah mendukung BBR (>= 4.9). Langsung mengaktifkan TCP BBR..."
        sysctl_config
        echo -e "${BOLD_GREEN}Info:${nc} Pengaturan TCP BBR selesai. Reboot mungkin diperlukan untuk efek penuh."
        exit 0
    fi

    echo -e "${BOLD_YELLOW}Peringatan:${nc} Versi kernel Anda (${kern}) lebih rendah dari 4.9. Skrip akan mencoba menginstal kernel terbaru yang kompatibel."
    sleep 2

    if [[ x"${OS}" == x"centos" ]]; then
        install_elrepo
        [ ! "$(command -v yum-config-manager)" ] && yum install -y yum-utils > /dev/null 2>&1
        [ x"$(yum-config-manager elrepo-kernel | grep -w enabled | awk '{print $3}')" != x"True" ] && yum-config-manager --enable elrepo-kernel > /dev/null 2>&1
        
        if centosversion 6; then
            echo -e "${BOLD_YELLOW}Info:${nc} Menginstal kernel ML (Mainline) untuk CentOS 6. Ini mungkin mengunduh dari repositori pihak ketiga."
            if is_64bit; then
                rpm_kernel_name="kernel-ml-4.18.20-1.el6.elrepo.x86_64.rpm" # Versi spesifik, bisa jadi usang
                rpm_kernel_devel_name="kernel-ml-devel-4.18.20-1.el6.elrepo.x86_64.rpm"
            else
                rpm_kernel_name="kernel-ml-4.18.20-1.el6.elrepo.i686.rpm"
                rpm_kernel_devel_name="kernel-ml-devel-4.18.20-1.el6.elrepo.i686.rpm"
            fi
            
            # Coba unduh dari elrepo atau mirror
            wget -c -t3 -T60 -O "${rpm_kernel_name}" "https://www.elrepo.org/elrepo/kernel/el6/$(uname -i)/RPMS/${rpm_kernel_name}" || \
            wget -c -t3 -T60 -O "${rpm_kernel_name}" "http://repos.lax.quadranet.com/elrepo/archive/kernel/el6/$(uname -i)/RPMS/${rpm_kernel_name}" || \
            wget -c -t3 -T60 -O "${rpm_kernel_name}" "https://dl.lamp.sh/files/${rpm_kernel_name}"

            wget -c -t3 -T60 -O "${rpm_kernel_devel_name}" "https://www.elrepo.org/elrepo/kernel/el6/$(uname -i)/RPMS/${rpm_kernel_devel_name}" || \
            wget -c -t3 -T60 -O "${rpm_kernel_devel_name}" "http://repos.lax.quadranet.com/elrepo/archive/kernel/el6/$(uname -i)/RPMS/${rpm_kernel_devel_name}" || \
            wget -c -t3 -T60 -O "${rpm_kernel_devel_name}" "https://dl.lamp.sh/files/${rpm_kernel_devel_name}"

            if [ -f "${rpm_kernel_name}" ]; then
                rpm -ivh "${rpm_kernel_name}"
            else
                echo -e "${red}Error:${plain} Gagal mengunduh kernel RPM (${rpm_kernel_name}). Instalasi BBR dihentikan."
                exit 1
            fi
            if [ -f "${rpm_kernel_devel_name}" ]; then
                rpm -ivh "${rpm_kernel_devel_name}"
            else
                echo -e "${red}Peringatan:${plain} Gagal mengunduh kernel-devel RPM (${rpm_kernel_devel_name}). Ini mungkin diperlukan untuk modul tertentu, tetapi BBR tetap akan diinstal."
            fi
            rm -f "${rpm_kernel_name}" "${rpm_kernel_devel_name}"

        elif centosversion 7 || centosversion 8; then
            echo -e "${BOLD_GREEN}Info:${nc} Menginstal kernel ML (Mainline) untuk CentOS ${OS_VERSION_ID}..."
            yum -y install kernel-ml kernel-ml-devel
            if [ $? -ne 0 ]; then
                echo -e "${red}Error:${plain} Gagal menginstal kernel terbaru dari elrepo. Harap periksa repositori atau koneksi internet Anda."
                exit 1
            fi
        fi
    elif [[ x"${OS}" == x"debian" || x"${OS}" == x"ubuntu" ]]; then
        echo -e "${BOLD_GREEN}Info:${nc} Mendapatkan versi kernel terbaru untuk Debian/Ubuntu dari Ubuntu mainline PPA..."
        get_latest_version
        
        # Unduh modul kernel jika ada
        if [ -n "${deb_kernel_modules_name}" ]; then
            echo -e "${BOLD_GREEN}Info:${nc} Mengunduh modul kernel: ${deb_kernel_modules_name}${NC}"
            wget -c -t3 -T60 -O "${deb_kernel_modules_name}" "${deb_kernel_modules_url}"
            if [ $? -ne 0 ]; then
                echo -e "${red}Error:${plain} Gagal mengunduh modul kernel (${deb_kernel_modules_name}). Instalasi BBR dihentikan."
                exit 1
            fi
        fi
        
        echo -e "${BOLD_GREEN}Info:${nc} Mengunduh image kernel: ${deb_kernel_name}${NC}"
        wget -c -t3 -T60 -O "${deb_kernel_name}" "${deb_kernel_url}"
        if [ $? -ne 0 ]; then
            echo -e "${BOLD_RED}Error:${nc} Gagal mengunduh image kernel (${deb_kernel_name}). Instalasi BBR dihentikan."
            exit 1
        fi
        
        echo -e "${BOLD_GREEN}Info:${nc} Menginstal paket kernel..."
        [ -f "${deb_kernel_modules_name}" ] && dpkg -i "${deb_kernel_modules_name}"
        dpkg -i "${deb_kernel_name}"
        
        # Bersihkan file .deb
        rm -f "${deb_kernel_name}" "${deb_kernel_modules_name}"
        
        if [ $? -ne 0 ]; then
            echo -e "${BOLD_RED}Error:${nc} Gagal menginstal paket kernel. Harap periksa log di ${cur_dir}/install_bbr.log."
            exit 1
        fi

    else
        echo -e "${BOLD_RED}Error:${nc} Sistem Operasi tidak didukung untuk instalasi BBR, silakan gunakan CentOS/Debian/Ubuntu."
        exit 1
    fi

    install_config # Konfigurasi GRUB
    sysctl_config  # Aktifkan BBR di sysctl
    echo -e "${BOLD_GREEN}Instalasi TCP BBR Selesai. Harap ${BOLD_YELLOW}REBOOT${NC}${BOLD_GREEN} VPS Anda untuk mengaktifkan kernel dan BBR yang baru.${NC}"
}

install_bbr 2>&1 | tee "${cur_dir}/install_bbr.log"

clear


### Instalasi Limit Speed Bandwidth (Wondershaper)

echo ""
echo -e "${BOLD_GREEN}Mulai instalasi Limit Speed Bandwidth (Wondershaper) untuk melindungi bandwidth dari penggunaan berlebihan.${NC}"
sleep 1.0
clear

if [ -z "$NIC" ]; then
    echo -e "${BOLD_YELLOW}Peringatan:${NC} NIC tidak terdeteksi. Melewati konfigurasi Wondershaper."
else
    echo ""
    echo -e "${BOLD_YELLOW}Konfigurasi Batas Kecepatan Semua Layanan${NC}"
    sleep 1.0
    echo ""
    echo -e "${BOLD_YELLOW}100000 Kbps = 100 Mbps${NC}"
    sleep 1.0
    echo ""
    echo -e "${BOLD_YELLOW}50000 Kbps = 50 Mbps${NC}"
    sleep 1.0
    echo ""
    echo -e "${BOLD_YELLOW}Contoh: Atur kecepatan unduh maksimum (dalam Kbps): 100000${NC}"
    sleep 1.0
    echo ""
    echo -e "${BOLD_YELLOW}Contoh: Atur kecepatan unggah maksimum (dalam Kbps): 50000${NC}"
    sleep 1.0
    echo ""
    echo -e "${BOLD_YELLOW}Jika sudah paham, mari atur Batas Kecepatan Bandwidth di bawah ini!${NC}"
    sleep 1.0
    echo ""

    # Pastikan wondershaper terinstal
    if ! command -v wondershaper &> /dev/null; then
        echo -e "${BOLD_GREEN}Menginstal Wondershaper...${NC}"
        if [[ $OS == 'ubuntu' || $OS == 'debian' ]]; then
            sudo apt-get install -y wondershaper
        elif [[ ${OS} == 'centos' ]]; then
            # Wondershaper biasanya ada di EPEL, pastikan EPEL sudah ada atau instal
            if ! yum list installed epel-release &> /dev/null; then
                echo -e "${INFO} Menginstal epel-release untuk wondershaper...${NC}"
                yum install -y epel-release
            fi
            yum -y install wondershaper
        fi
        if ! command -v wondershaper &> /dev/null; then
            echo -e "${BOLD_RED}Error:${NC} Gagal menginstal Wondershaper. Instalasi Limit Speed Bandwidth dihentikan."
            sleep 3
            clear
            # Lanjutkan ke bagian akhir skrip
        fi
    fi

    read -rp "Atur kecepatan unduh maksimum (dalam Kbps) [Kosongkan untuk melewati]: " download_rate
    echo ""
    read -rp "Atur kecepatan unggah maksimum (dalam Kbps) [Kosongkan untuk melewati]: " upload_rate

    # Validasi input numerik
    if ! is_digit "$download_rate" && [ -n "$download_rate" ]; then
        echo -e "${BOLD_RED}Peringatan:${NC} Input unduh tidak valid. Mengatur nilai ke 0."
        download_rate=0
    fi
    if ! is_digit "$upload_rate" && [ -n "$upload_rate" ]; then
        echo -e "${BOLD_RED}Peringatan:${NC} Input unggah tidak valid. Mengatur nilai ke 0."
        upload_rate=0
    fi

    if [[ -z "$download_rate" && -z "$upload_rate" ]] || [[ "$download_rate" == "0" && "$upload_rate" == "0" ]]; then
        echo -e "${BOLD_YELLOW}Melewati konfigurasi Wondershaper karena tidak ada nilai yang valid dimasukkan.${NC}"
        # Hapus penanda jika sebelumnya ada dan pengguna memilih untuk tidak menyetel
        rm -f /home/limit 2>/dev/null
    else
        echo -e "${BOLD_GREEN}Memulai Konfigurasi Wondershaper...${NC}"
        sleep 0.5
        
        # Reset wondershaper sebelum menerapkan aturan baru
        wondershaper clear "$NIC" > /dev/null 2>&1

        # Terapkan batas
        if [ -n "$download_rate" ] && [ -n "$upload_rate" ]; then
            wondershaper -a "$NIC" -d "$download_rate" -u "$upload_rate" > /dev/null 2>&1
        elif [ -n "$download_rate" ]; then
            wondershaper -a "$NIC" -d "$download_rate" > /dev/null 2>&1
        elif [ -n "$upload_rate" ]; then
            wondershaper -a "$NIC" -u "$upload_rate" > /dev/null 2>&1
        fi

        systemctl enable --now wondershaper.service &>/dev/null
        echo "start" > /home/limit # Penanda bahwa wondershaper telah dikonfigurasi
        echo "$download_rate" > /home/limit_down # Simpan nilai
        echo "$upload_rate" > /home/limit_up   # Simpan nilai
        echo -e "${BOLD_GREEN}Selesai Konfigurasi Wondershaper.${NC}"
    fi
fi


### Tampilkan Status Wondershaper

clear
# Baca nilai yang disimpan, jika ada
download_rate_display=$(cat /home/limit_down 2>/dev/null)
upload_rate_display=$(cat /home/limit_up 2>/dev/null)

status_check=$(cat /home/limit 2>/dev/null) # Sembunyikan error jika file tidak ada
if [[ "$status_check" = "start" ]]; then
    current_status="${Status_ON}"
else
    current_status="${Status_OFF}"
fi

echo -e " ${BOLD_GREEN}===================================${NC}"
echo -e "${BOLD_YELLOW}         Batas Kecepatan Bandwidth       ${NC}"
echo -e " ${BOLD_GREEN}===================================${NC}"
echo -e " Status: $current_status"
echo ""
echo -e "${BOLD_YELLOW}Batas Kecepatan Unduh Saat Ini: ${download_rate_display:-Tidak disetel (atau 0)}${NC}"
echo ""
echo -e "${BOLD_YELLOW}Batas Kecepatan Unggah Saat Ini: ${upload_rate_display:-Tidak disetel (atau 0)}${NC}"
sleep 5


### Pesan Akhir

clear
echo -e ""
echo -e "${BOLD_GREEN}Protection-VPS Installer Versi 2.0 Berhasil Terinstal!${NC}"
echo -e ""
sleep 0.5
echo -e "${BOLD_CYAN}Laporkan Bug: https://t.me/sampiiiiu${NC}"
echo -e ""
sleep 0.5

echo -e "${BOLD_GREEN}=============================${NC}"
echo -e "${BOLD_YELLOW}# Protection VPS V2.0         #${NC}"
echo -e "${BOLD_YELLOW}# Credit: jgmdev              #${NC}"
echo -e "${BOLD_YELLOW}# Dibuat Oleh Geo Project     #${NC}"
echo -e "${BOLD_GREEN}=============================${NC}"
echo ""
echo -e "${BOLD_CYAN}Disarankan untuk me-REBOOT VPS Anda sekarang untuk mengaktifkan semua perubahan (terutama BBR).${NC}"
read -rp "Apakah Anda ingin me-REBOOT VPS sekarang? (y/n): " REBOOT_CHOICE
if [[ "$REBOOT_CHOICE" =~ ^[Yy]$ ]]; then
    echo -e "${BOLD_GREEN}Melakukan reboot...${NC}"
    sleep 2
    reboot
else
    echo -e "${BOLD_YELLOW}Reboot dibatalkan. Ingat untuk me-reboot VPS Anda secara manual nanti.${NC}"
fi
