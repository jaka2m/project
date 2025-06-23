#!/bin/bash

# ====================================================
# Script: Menu Update & Management
# System Requirement: Debian 9+/Ubuntu 18.04+/20+
# Author: Geo Project
# Description: Script to manage and update Xray menu.
# Email: admin@geolstore.net
# Telegram: https://t.me/tau_samawa
# ====================================================

# --- Root Checking ---
if [ "${EUID}" -ne 0 ]; then
    echo -e "${RED} ERROR ${NC} Please Run This Script As Root User!"
    exit 1
fi

# --- Export Warna & Informasi ---
# Definisi Warna
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m' # No Color

# Pesan Status Banner
export ERROR_MSG="[${RED} ERROR ${NC}]"
export INFO_MSG="[${YELLOW} INFO ${NC}]"
export OKEY_MSG="[${GREEN} OKEY ${NC}]"
export PENDING_MSG="[${YELLOW} PENDING ${NC}]"
export SEND_MSG="[${YELLOW} SEND ${NC}]"
export RECEIVE_MSG="[${YELLOW} RECEIVE ${NC}]"

# Gaya Teks
export BOLD="\e[1m"
export WARNING_BLINK="${RED}\e[5m"
export UNDERLINE="\e[4m"

# --- Export Variabel Global ---
# Mengambil variabel dari file konfigurasi
# Pastikan file /etc/geovpn/var.txt ada dan berisi variabel seperti INFO_AKUN
source '/etc/geovpn/var.txt' 2>/dev/null

# URL Telegram API (jika digunakan, sesuai kebutuhan skrip lain)
TELEGRAM_API_URL="https://api.telegram.org/bot$INFO_AKUN/sendMessage"

# Konfigurasi Server & Script
export SERVER_URL="raw.githubusercontent.com/jaka1m/perizinan/main"
export SERVER_PORT="443"
export SERVER_IP_UNDEFINED="underfined" # Variabel ini sepertinya tidak digunakan
export SCRIPT_MODE="Stable"
export AUTHOR="geovpn"

# Mendapatkan IP publik dan domain
export MY_IP=$(curl -sS ipv4.icanhazip.com)
# export DOMAIN=$(cat /etc/xray/domain 2>/dev/null) # Asumsi domain digunakan di skrip lain

# Perintah IP (opsional, jika curl -s ifconfig.me gagal, gunakan ipv4.icanhazip.com)
export PUBLIC_IP=$(curl -s ifconfig.me || curl -sS ipv4.icanhazip.com)


# --- Fungsi SAMAWA (Kode Terenkripsi) ---
# CATATAN: Fungsi ini menjalankan perintah yang di-enkripsi BASE64.
# Pastikan Anda memahami sepenuhnya apa yang dilakukan oleh kode ini.
function SAMAWA() {
    clear
    echo 'V2xkT2IySjVRV2xKUTFJM1VXdDRWbEpZTTJsc1NYcHBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NVUnBiRWxFYVd4SlJHbHNTVVJwYkVsRWFXeEpSR2xzU1VScGJFbEVhV3hKUkdsc1NrRnJaVEExUkdaVFNVdGFWMDV2WW5sQmFVbERVamRSYTNoV1VsZ3phV3hKU1d0bE1EVkVabE5TTjFJeFNrWlNWVFU1U1VOQlowbERRV2RKUTBGbldERTVabGg1UW1aWU1UbG1XSGxDWmxneE9XWlllVUZuU1VOQloxZ3hPV1pZTVRsbVNVTkNaa2xEUVdkWWVWSTNWR3RPT1VwSWRFTlVSbFpHWmxOQlowbERRV2RKUTBGblNVTkVhV3hKU1d0bE1EVkVabE5KUzFwWFRtOWllVUZwU1VOU04xRnJlRlpTV0ROcGJFbEphMlV3TlVSbVUxSTNVajZLUmxKVk5UbEpRMEZuU1VOQlowbERRWFpKUmpsbVdETjNaMWd4T1daWWVUaG5XSGxDWTBsR2QyZEpRMEYyU1VNNFowbEdPR2RZU0hkbldFTkNPRWxJZDJ0bE1EVkVabE5TTjFGcmVGWlNXREJuU1VOQlowbERRV2RKUTBScGJFbEphMlV3TlVSbVUwbExXbGRPYjJKNVFXbEpRMUkzVVd0NFZsSllNMmxzU1VsclpUQTFSR1pUVWpkU01VcEdVbFUxT1VsRFFXZEpRMEZuU1VoM1oyWkRRV2RZTTNkblNVWTVPR1pEUWpoSlNIZG5XRU5DWTBsRE9HZE1NM2RuWmtZNGNFbElkMmRKUm5nNFNVaDNhMlV3TlVSbVUxSTNVV3Q0VmxKWU1HZEpRMEZuU1VOQlowbERSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTlNOMUl4U2taU1ZUVTVTVU5CWjBsRFFXZEpTSGRuWmtZNU9FbElkMmRtUmpsbVprTkNPRmd6ZDJkbVJuZG5WbWxCZGtsSWQyZEpSamxtVEROM1oyWkdkMmRKU0hkclpUQTFSR1pUVWpkUmEzaFdVbGd3WjBsRFFXZEpRMEZuU1VORWFXeEpTV3RsTURWRVpsTkpTMXBYVG05aWVVRnBTVU5TTjFGcmVGWlNXRE5wYkVsSmEyVXdOVVJtVTFJM1VqRktSbEpWTlRsSlEwRm5TVU5CWjBsRFFtTllNVGxtV0RONFpsZ3hPV1pZTVhobVdERTRka2xEUW1OWWVUaG5TVWg0Wm1aRFFXZEpTSGhtWmtOQ1kxZ3pkMnRsTURWRVpsTlNOMUZyZUZaU1dEQm5TVU5CWjBsRFFXZEpRMFJwYkVsSmEyVXdOVVJtVTBsTFdsZE9iMko1UVdsSlExSTNVV3Q0VmxKWU0ybHNTVWxyWlRBMVJHWlRRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VOQmEyVXdTazFXVlZZNVNVOUxWV2RwVWpkVWEwNDVTV2R3YkZreWFIWkpRMGxuU2toMFExUkdWa1ptWlV0VloybFNOMVJyVGpsSlEwRm5TVU5CWjBsRFFXZEpRMEZuU1VVeFZsUkdVa3BWUlRsVFZrTkNWMVZGTkdkVk1FNVRVMVpDVlVsR1dYcE1ha0ZuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEVWpkUmEzaFdVbGd3WnpSd1UwTktTSFJQVVRNd2FVTnRWbXBoUnpoblNXbEJhMlV3U2sxV1ZWWTVOSEJUUTBwSWRFOVJNekJuU1VOQlowbERRV2RKUTBGblNVTkJaMGxEUVdkSlEwRm5WakZrV0V4clpFWlVNVnBSVkdrMVJGUXdNR2RKUTBGblNVTkJaMGxEUVdkSlEwRm5TVU5CWjBsRFFXZEtTSFJEVkVaV1JtWlRSR2xzU1VsclpUQTFSR1pUU1V0YVYwNXZZbmxCYVVsRFVqZFJhM2hXVWxnemFXeEpTV3RsTURWRVpsTkJaMGxEUWxWU1ZYaEdVakZLUWxSVFFrUlRRMEZyWlRCa1UxSlZWazltVlVJd1dsaE9NR0ZYZERGbFZqbDBXVmMxYmtwSWRFOVJNekJuVVZWU1RsTlZOR2RLU0hSSVZXdFdSbFJ1TVVGa1IwWXhXRE5PYUdKWFJqTlpVMUkzVkd0T09VbERRV2RKUTFJM1VXdDRWbEpZTUdjMGNGTkRTa2gwVDFFek1HbERiVlpxWVVjNFowbHBRV3RsTUVwTlZsVldPVFJ3VTFVMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTBFMGNGTkJOSEJUUVRSd1UwRTBjRk5CTkhCVFFUUndVMEUwY0ZOQk5IQlRRVFJ3VTFsS1NIUlBVVE13YVE9PQ==' | base64 -d | base64 -d | base64 -d | sh
}

# --- Fungsi Instalasi/Update Menu ---
function install_menu() {
    echo -e " ${INFO_MSG} Downloading Menu Files..."
    sleep 2 # Memberi waktu pengguna untuk membaca pesan

    # Hapus file lama yang mungkin ada sebelum mengunduh yang baru
    rm -f ~/menu.zip /root/update.sh /usr/local/sbin/snap /usr/local/sbin/geo.zip

    wget -O ~/menu.zip "https://jaka2m.github.io/project/ssh/menu.zip" &>/dev/null
    
    if [ ! -f ~/menu.zip ]; then
        echo -e " ${ERROR_MSG} Failed to download menu.zip. Aborting update."
        return 1
    fi

    mkdir -p /root/menu # Pastikan direktori ada
    7z e -psumbawa ~/menu.zip -o/root/menu/ &>/dev/null

    if [ $? -ne 0 ]; then
        echo -e " ${ERROR_MSG} Failed to extract menu.zip. Check 7z or password."
        rm -f ~/menu.zip
        rm -rf /root/menu
        return 1
    fi

    chmod +x /root/menu/*
    mv /root/menu/* /usr/local/sbin/
    rm -r /root/menu
    rm -f ~/menu.zip
    
    echo -e " ${OKEY_MSG} Menu Downloaded and Installed Successfully!"
    echo ""
    
    local sec=2
    local spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
    while [ $sec -gt 0 ]; do
        echo -ne " ${GREEN} ${spinner[sec]} Back to Menu $sec seconds...${NC}\r"
        sleep 1
        sec=$((sec - 1))
    done
    echo ""
    
    # Asumsi 'menu' adalah fungsi atau skrip yang dapat dipanggil.
    # Jika tidak ada, ganti dengan 'exit 0' atau panggil skrip menu utama Anda.
    menu 2>/dev/null || exit 0
}

# --- Main Logic ---
SAMAWA # Eksekusi kode tersembunyi
echo -e ""
read -p "Apakah Anda yakin ingin melakukan update? (Y/N): " user_confirm
echo ""

case "$user_confirm" in
    y|Y)
        clear
        echo -e "${INFO_MSG} Starting Update Process!"
        install_menu
        ;;
    n|N)
        echo -e "${INFO_MSG} Update Canceled!"
        exit 0
        ;;
    *)
        echo -e "${ERROR_MSG} Invalid input. Automatic Update Triggered!"
        install_menu
        ;;
esac