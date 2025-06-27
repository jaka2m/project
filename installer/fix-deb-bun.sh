#!/bin/bash

echo "Memperbarui daftar paket..."
sudo apt update
sudo apt upgrade -y

echo "Mendeteksi sistem operasi..."

# Deteksi OS
if grep -q "ID=debian" /etc/os-release; then
    OS_TYPE="debian"
    echo "Terdeteksi: Debian"
elif grep -q "ID=ubuntu" /etc/os-release; then
    OS_TYPE="ubuntu"
    echo "Terdeteksi: Ubuntu"
else
    echo "Sistem operasi tidak didukung atau tidak dapat dideteksi."
    echo "Skrip akan keluar."
    exit 1
fi

# Konfigurasi sources.list berdasarkan OS
if [ "$OS_TYPE" == "debian" ]; then
    echo "Mengatur sources.list untuk Debian..."
    sudo cat >/etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main
deb http://security.debian.org/debian-security bullseye-security main
deb-src http://security.debian.org/debian-security bullseye-security main
deb http://deb.debian.org/debian/ bullseye-updates main
deb-src http://deb.debian.org/debian/ bullseye-updates main
EOF
elif [ "$OS_TYPE" == "ubuntu" ]; then
    echo "Mengatur sources.list untuk Ubuntu..."
    sudo cat >/etc/apt/sources.list <<EOF
# Repositori Mirror Data Utama - Ubuntu 20.04 (Focal Fossa)
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-updates main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-security main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-backports main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ focal-proposed main restricted universe multiverse

# Repositori Mirror Poliwangi - Ubuntu 20.04 (Focal Fossa)
deb http://mirror.poliwangi.ac.id/ubuntu/ focal main restricted universe multiverse
deb http://mirror.poliwangi.ac.id/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirror.poliwangi.ac.id/ubuntu/ focal-security main restricted universe multiverse
deb http://mirror.poliwangi.ac.id/ubuntu/ focal-backports main restricted universe multiverse
deb http://mirror.poliwangi.ac.id/ubuntu/ focal-proposed main restricted universe multiverse
EOF
fi

echo "Memperbarui daftar paket lagi setelah perubahan sources.list..."
sudo apt update

echo "Menginstal paket yang diperlukan..."
sudo apt install -y liblua5.3-0 libssl1.1

clear
echo "Proses instalasi selesai!"
