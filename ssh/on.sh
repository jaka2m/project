#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
Green="\e[92;1m"
RED="\033[31m"
NC='\033[0m'
OR='\033[1;93m'
grenbo="\e[92;1m"
clear
source '/etc/geovpn/var.txt'
#install
rm -f /root/on.sh
rm -rf /home/geo
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite3 -y
wget https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu/menu.zip >/dev/null 2>&1
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
cd /home/geo
pip3 install -r requirements.txt
pip install pillow
pip install speedtest-cli
clear
# System commands status
city=$(cat /etc/xray/city)
dat=$(date +"%d-%B-%Y")
isp=$(cat /etc/xray/isp)
PUB=$(cat /etc/slowdns/server.pub)
KEY=$(cat /etc/slowdns/server.key)
DNS=$(cat /etc/xray/ns.txt)
domain=$(cat /etc/xray/domain)
uuid=$(tr </dev/urandom -dc a-z | head -c15)
    clear
    BOTTTT=$(systemctl status geo | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
    if [[ $BOTTTT == "running" ]]; then
        STATBOT="${grenbo}🟢 Online${NC}"
    else
        STATBOT="${RED}🔴 Offline${NC}"
    fi
    echo -e "  ${OR}===========================${NC}"
    echo -e "  \e[1;92m ☀️ BOT SIMPLE GEO TELEGRAM ☀️"
    echo -e "  ${OR}===========================${NC}"
    echo ""
    echo -e "  YOUR BOT STATUS $STATBOT    "
    echo -e "  Telegram Bot Setup menu"
    echo -e "  make vpn in the telegram bot"
    echo -e "  short tutorials :"
    echo -e "  get this value from @BotFather, required"
    echo -e "  take your id at @MissRose_bot,cmd (/id)"
    echo -e "  ${OR}===========================${NC}"
    read -e -p "  Input your Bot Token : " bottoken
    read -e -p "  Input your Id Telegram : " idtelegram
    rm -rf /home/geo/database.db >/dev/null 2>&1
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
cat > /etc/systemd/system/geo.service << END
[Unit]
Description=GEO BOT
Documentation=GeoProject
After=network.target
[Service]
WorkingDirectory=/home
ExecStart=/usr/bin/python3 -m geo
Restart=always
[Install]
WantedBy=multi-user.target
END
    systemctl daemon-reload
    systemctl stop geo
    systemctl enable geo
    systemctl start geo
    systemctl restart geo
    
clear
echo ""
URL="https://api.telegram.org/bot$INFO_INSTALLER/sendMessage"
    TEXT="Installasi VPN BOT Telegram V3.1
    ============================
    <code>DOMAIN     :</code> <code>$domain</code>
    <code>API TOKEN  :</code> <code>$bottoken</code>
    <code>ID         :</code> <code>$idtelegram</code>
    <code>IP VPS     :</code> <code>$MYIP</code>
    ============================
    (C) Copyright 2024 By Geo Project
    ============================
<i>Automatic Notification from</i>
<i>Github GEO</i> 
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ🐳","url":"https://t.me/tau_samawa"},{"text":"ɪɴꜱᴛᴀʟʟ🐬","url":"https://t.me/testikuy_mang/163"}]]}'
   curl -s --max-time $TIME -d "chat_id=$ADMIN&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
    systemctl daemon-reload
    systemctl stop geo
    systemctl enable geo
    systemctl start geo
    systemctl restart geo
clear
echo -e " \e[1;92m ☀️ YOUR DATA BOT ☀️$NC"
echo -e " ${OR}=========================${NC}"
echo "Api Token     : $bottoken"
echo "ID            : $idtelegram"
echo "DOMAIN        : $domain"
echo -e " ${OR}=========================${NC}"
echo ""
sleep 5
menu
