#!/bin/bash

# --- Definisi Warna ---
# (Menggunakan definisi warna yang sudah dirapikan sebelumnya untuk konsistensi)
export NC='\033[0m'       # No Color (Reset warna)
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export BOLD_GREEN="\e[92;1m" # Bold Green (mirip grenbo)
export OR='\033[1;93m'    # Orange/Bold Yellow

# --- Informasi Dasar ---
MYIP=$(wget -qO- ipinfo.io/ip) || { echo -e "${RED}ERROR: Gagal mendapatkan IP publik.${NC}"; exit 1; }
clear

# --- Memuat Variabel dari var.txt ---
# Asumsi var.txt berisi DOMAIN, PUB, DNS, dan INFO_INSTALLER
if [ -f "/etc/geovpn/var.txt" ]; then
    source '/etc/geovpn/var.txt'
else
    echo -e "${RED}ERROR: File '/etc/geovpn/var.txt' tidak ditemukan. Pastikan sudah ada.${NC}"
    exit 1
fi

# --- Persiapan Instalasi ---
echo -e "${BOLD_GREEN}Memulai proses instalasi...${NC}"

# Hapus file/folder lama yang tidak perlu
echo -e "${GREEN}Menghapus sisa instalasi sebelumnya...${NC}"
rm -f /root/on.sh
rm -rf /home/geo

# Update sistem dan instal dependensi
echo -e "${GREEN}Memperbarui sistem dan menginstal dependensi...${NC}"
apt update -y
apt upgrade -y # Sebaiknya dilakukan terpisah untuk melihat output upgrade
apt install python3 python3-pip sqlite3 p7zip-full unzip -y # Tambahkan p7zip-full dan unzip

# --- Unduh dan Ekstrak File Bot ---
echo -e "${GREEN}Mengunduh dan mengekstrak file bot...${NC}"
wget -q --show-progress "https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu/menu.zip" -O menu.zip || { echo -e "${RED}ERROR: Gagal mengunduh menu.zip.${NC}"; exit 1; }
7z e -psumbawa menu.zip || { echo -e "${RED}ERROR: Gagal mengekstrak menu.zip.${NC}"; rm -f menu.zip; exit 1; }

# Pastikan geo.zip ada setelah ekstraksi dari menu.zip
if [ ! -f "geo.zip" ]; then
    echo -e "${RED}ERROR: geo.zip tidak ditemukan setelah ekstraksi dari menu.zip.${NC}"
    rm -f menu.zip
    exit 1
fi

unzip geo.zip || { echo -e "${RED}ERROR: Gagal unzip geo.zip.${NC}"; rm -f menu.zip geo.zip; exit 1; }

# Pindahkan file ke lokasi yang benar
echo -e "${GREEN}Memindahkan file bot...${NC}"
mv geo /home
chmod +x /home/geo/* # Berikan izin eksekusi pada semua file di direktori geo
chmod +x /usr/local/sbin/* # Asumsi semua file yang dipindahkan ke sbin perlu izin eksekusi
mv * /usr/local/sbin/ # Pindahkan sisa file yang tidak diekstrak ke /home/geo
rm -f /usr/local/sbin/menu.zip # Hapus zip files
rm -f /usr/local/sbin/geo.zip
rm -rf /home/geo/var.txt # Hapus var.txt dari home/geo jika tidak diperlukan
rm -f /usr/local/sbin/on.sh
rm -rf /usr/local/sbin/snap >/dev/null 2>&1

# --- Instal Dependensi Python ---
echo -e "${GREEN}Menginstal dependensi Python...${NC}"
cd /home/geo || { echo -e "${RED}ERROR: Gagal masuk ke direktori /home/geo.${NC}"; exit 1; }
pip3 install -r requirements.txt || { echo -e "${RED}ERROR: Gagal menginstal dependensi dari requirements.txt.${NC}"; exit 1; }
pip install pillow || { echo -e "${RED}ERROR: Gagal menginstal pillow.${NC}"; }
pip install speedtest-cli || { echo -e "${RED}ERROR: Gagal menginstal speedtest-cli.${NC}"; }
clear

# --- Konfigurasi Bot Telegram ---
echo -e " ${OR}===========================${NC}"
echo -e " \e[1;92m ☀️ BOT SIMPLE GEO TELEGRAM ☀️"
echo -e " ${OR}===========================${NC}"
echo ""

# Dapatkan status bot
BOT_STATUS=$(systemctl is-active geo) # Gunakan is-active untuk status yang lebih ringkas
if [[ "$BOT_STATUS" == "active" ]]; then
    STATBOT="${BOLD_GREEN}🟢 Online${NC}"
else
    STATBOT="${RED}🔴 Offline${NC}"
fi

echo -e " YOUR BOT STATUS $STATBOT"
echo -e " Telegram Bot Setup menu"
echo -e " make vpn in the telegram bot"
echo -e " short tutorials :"
echo -e " get this value from @BotFather, required"
echo -e " take your id at @MissRose_bot,cmd (/id)"
echo -e " ${OR}===========================${NC}"

read -e -p " Input your Bot Token : " bottoken
read -e -p " Input your Id Telegram : " idtelegram

# Dapatkan informasi sistem
# Asumsi /etc/xray/city, /etc/xray/isp, /etc/slowdns/server.pub, /etc/slowdns/server.key, /etc/xray/ns.txt, /etc/xray/domain sudah ada.
# Jika tidak, ini akan kosong atau menyebabkan error.
city=$(cat /etc/xray/city 2>/dev/null || echo "N/A")
dat=$(date +"%d-%B-%Y")
isp=$(cat /etc/xray/isp 2>/dev/null || echo "N/A")
PUB=$(cat /etc/slowdns/server.pub 2>/dev/null || echo "N/A")
KEY=$(cat /etc/slowdns/server.key 2>/dev/null || echo "N/A") # KEY tidak digunakan di var.txt, tapi mungkin relevan
DNS=$(cat /etc/xray/ns.txt 2>/dev/null || echo "N/A")
domain=$(cat /etc/xray/domain 2>/dev/null || echo "N/A")
uuid=$(tr </dev/urandom -dc a-z0-9 | head -c15) # Menggunakan a-z0-9 untuk UUID lebih standar

# Hapus database lama jika ada
rm -rf /home/geo/database.db >/dev/null 2>&1

# Buat file var.txt di home/geo
cat >/home/geo/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$idtelegram"
DOMAIN="$domain"
PUB="$PUB"
DNS="$DNS"
SESSIONS="$uuid"
USER1="empty1"
USER2="empty2"
USER3="empty3"
USER4="empty4"
USER5="empty5"
USER6="empty6"
USER7="empty7"
USER8="empty8"
USER9="empty9"
USER10="empty0"
EOF

# Buat file unit systemd untuk layanan bot
cat > /etc/systemd/system/geo.service << END
[Unit]
Description=GEO BOT
Documentation=GeoProject
After=network.target

[Service]
WorkingDirectory=/home/geo # Ubah ke /home/geo tempat kode bot berada
ExecStart=/usr/bin/python3 -m geo
Restart=always
User=root # Jalankan sebagai root jika memang diperlukan, tapi lebih aman sebagai user non-privilege jika bot tidak memerlukan akses root.
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
END

# Reload systemd, stop, enable, dan start layanan bot
echo -e "${GREEN}Mengatur dan memulai layanan bot...${NC}"
systemctl daemon-reload
systemctl stop geo # Hentikan dulu untuk memastikan start bersih
systemctl enable geo
systemctl start geo
systemctl restart geo # Restart untuk memastikan layanan benar-benar aktif setelah perubahan

# --- Kirim Notifikasi ke Telegram ---
clear
echo ""
URL="https://api.telegram.org/bot${INFO_INSTALLER}/sendMessage"
# Gunakan sintaks HERE document (EOT) agar lebih rapi untuk pesan panjang
TEXT=$(cat <<EOT
Installasi VPN BOT Telegram V3.1
============================
<code>DOMAIN      :</code> <code>$domain</code>
<code>API TOKEN   :</code> <code>$bottoken</code>
<code>ID          :</code> <code>$idtelegram</code>
<code>IP VPS      :</code> <code>$MYIP</code>
============================
(C) Copyright 2024 By Geo Project
============================
<i>Automatic Notification from</i>
<i>Github GEO</i>
EOT
)

# Gunakan printf %q untuk mengutip JSON jika ada spasi/karakter khusus
REPLY_MARKUP='{"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ🐳","url":"https://t.me/tau_samawa"},{"text":"ɪɴꜱᴛᴀʟʟ🐬","url":"https://t.me/testikuy_mang/163"}]]}'
curl -s --max-time 10 -d "chat_id=${idtelegram}&disable_web_page_preview=1&text=${TEXT}&parse_mode=html&reply_markup=${REPLY_MARKUP}" "${URL}" >/dev/null || echo -e "${RED}WARNING: Gagal mengirim notifikasi Telegram.${NC}"

echo ""
echo -e " ${BOLD_GREEN}☀️ YOUR DATA BOT ☀️${NC}"
echo -e " ${OR}=========================${NC}"
echo "Api Token     : $bottoken"
echo "ID            : $idtelegram"
echo "DOMAIN        : $domain"
echo -e " ${OR}=========================${NC}"
echo ""

sleep 5
# Asumsi 'menu' adalah script yang sudah ada di PATH
menu
