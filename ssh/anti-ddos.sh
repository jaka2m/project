#!/bin/sh

#######################################
#             ANTI-DDOS BASH SCRIPT - IMPROVED         #
#######################################
#                    DEVELOPER : GEO PROJECT                     #
#                    IMPROVED BY : AI Assistant                     #
#######################################

# --- Konfigurasi Dasar ---
IPTABLES="/sbin/iptables"
IP6TABLES="/sbin/ip6tables"
MODPROBE="/sbin/modprobe"
RMMOD="/sbin/rmmod"

# Ubah ini ke port SSH Anda yang sebenarnya
SSHPORT="22"

# Opsi Logging
LOG="LOG --log-level info --log-prefix \"IPTABLES_DROP: \" --log-tcp-sequence --log-tcp-options --log-ip-options"

# Batas Rate Default (digunakan di banyak aturan)
# Sesuaikan nilai ini berdasarkan kapasitas server dan lalu lintas normal Anda
RLIMIT_DEFAULT="10/second --burst 20" # 10 paket/detik, burst 20
RLIMIT_ICMP="1/second --burst 2"    # 1 ping/detik, burst 2

# Port yang Tidak Berhak Istimewa (Unprivileged Ports)
PHIGH="1024:65535"
PSSH="1000:1023" # Rentang ini mungkin perlu disesuaikan

# --- Bersihkan Aturan yang Ada ---
echo "Membersihkan aturan iptables yang ada..."
"$IPTABLES" -F
"$IPTABLES" -X
"$IPTABLES" -Z
"$IPTABLES" -t nat -F
"$IPTABLES" -t nat -X
"$IPTABLES" -t nat -Z
"$IPTABLES" -t mangle -F
"$IPTABLES" -t mangle -X
"$IPTABLES" -t mangle -Z

# Bersihkan aturan IPv6 jika ip6tables tersedia
if test -x "$IP6TABLES"; then
    echo "Membersihkan aturan ip6tables yang ada..."
    "$IP6TABLES" -F 2>/dev/null
    "$IP6TABLES" -X 2>/dev/null
    "$IP6TABLES" -Z 2>/dev/null
    "$IP6TABLES" -t mangle -F 2>/dev/null
    "$IP6TABLES" -t mangle -X 2>/dev/null
    "$IP6TABLES" -t mangle -Z 2>/dev/null
fi

# --- Kebijakan Default ---
# Drop semua traffic secara default untuk keamanan maksimum
echo "Mengatur kebijakan default ke DROP..."
"$IPTABLES" -P INPUT DROP
"$IPTABLES" -P FORWARD DROP
"$IPTABLES" -P OUTPUT DROP

# Izinkan tabel nat/mangle default ke ACCEPT kecuali ada kebutuhan spesifik
"$IPTABLES" -t nat -P PREROUTING ACCEPT
"$IPTABLES" -t nat -P OUTPUT ACCEPT
"$IPTABLES" -t nat -P POSTROUTING ACCEPT
"$IPTABLES" -t mangle -P PREROUTING ACCEPT
"$IPTABLES" -t mangle -P INPUT ACCEPT
"$IPTABLES" -t mangle -P FORWARD ACCEPT
"$IPTABLES" -t mangle -P OUTPUT ACCEPT
"$IPTABLES" -t mangle -P POSTROUTING ACCEPT

# --- Pengerasan Kernel (sysctl) ---
echo "Menerapkan konfigurasi kernel (sysctl)..."

# Nonaktifkan IP forwarding jika bukan router
echo 0 > /proc/sys/net/ipv4/ip_forward

# Aktifkan IP spoofing protection (Reverse Path Filtering)
for i in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 1 > "$i"; done

# Lindungi dari serangan SYN flood
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Abaikan semua permintaan ICMP echo (ping) yang masuk (ini disarankan untuk sebagian besar server)
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Abaikan permintaan ICMP echo ke broadcast
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Catat paket dengan alamat yang tidak mungkin (martians)
for i in /proc/sys/net/ipv4/conf/*/log_martians; do echo 1 > "$i"; done

# Jangan catat respons tidak valid ke broadcast
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# Jangan terima atau kirim pengalihan ICMP
for i in /proc/sys/net/ipv4/conf/*/accept_redirects; do echo 0 > "$i"; done
for i in /proc/sys/net/ipv4/conf/*/send_redirects; do echo 0 > "$i"; done

# Jangan terima paket ber-routing sumber (source-routed packets)
for i in /proc/sys/net/ipv4/conf/*/accept_source_route; do echo 0 > "$i"; done

# Nonaktifkan multicast routing (kecuali memang dibutuhkan)
for i in /proc/sys/net/ipv4/conf/*/mc_forwarding; do echo 0 > "$i"; done

# Nonaktifkan proxy_arp
for i in /proc/sys/net/ipv4/conf/*/proxy_arp; do echo 0 > "$i"; done

# Aktifkan pengalihan aman, hanya terima pengalihan ICMP untuk gateway
for i in /proc/sys/net/ipv4/conf/*/secure_redirects; do echo 1 > "$i"; done

# Nonaktifkan bootp_relay
for i in /proc/sys/net/ipv4/conf/*/bootp_relay; do echo 0 > "$i"; done

# Tingkatkan batas antrian backlog SYN
echo 4096 > /proc/sys/net/ipv4/tcp_max_syn_backlog
# Kurangi waktu SYN-ACK retransmisi
echo 3 > /proc/sys/net/ipv4/tcp_synack_retries
# Kurangi waktu SYN retransmisi
echo 3 > /proc/sys/net/ipv4/tcp_syn_retries
# Aktifkan TCP SACK (Selective ACK)
echo 1 > /proc/sys/net/ipv4/tcp_sack
# Aktifkan window scaling
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
# Aktifkan timestamp TCP
echo 1 > /proc/sys/net/ipv4/tcp_timestamps

# --- Modul Kernel ---
# Modul ip_conntrack_ftp dan ip_conntrack_irc umumnya tidak diperlukan
# jika Anda tidak menjalankan server FTP atau IRC aktif dengan mode port.
# Jika Anda menggunakannya, uncomment baris di bawah ini.
# "$MODPROBE" ip_conntrack_ftp
# "$MODPROBE" ip_conntrack_irc

# --- Rantai Kustom (Custom Chains) ---
echo "Membuat rantai iptables kustom..."

# Log lalu lintas dan terima
"$IPTABLES" -N ACCEPT_LOG
"$IPTABLES" -A ACCEPT_LOG -j LOG --log-prefix "ACCEPT: "
"$IPTABLES" -A ACCEPT_LOG -j ACCEPT

# Log lalu lintas dan tolak (drop)
"$IPTABLES" -N DROP_LOG
"$IPTABLES" -A DROP_LOG -j LOG --log-prefix "DROP: "
"$IPTABLES" -A DROP_LOG -j DROP

# Log lalu lintas dan tolak (reject)
"$IPTABLES" -N REJECT_LOG
"$IPTABLES" -A REJECT_LOG -j LOG --log-prefix "REJECT: "
"$IPTABLES" -A REJECT_LOG -p tcp -j REJECT --reject-with tcp-reset
"$IPTABLES" -A REJECT_LOG -j REJECT

# Rantai untuk penanganan SYN flood
"$IPTABLES" -N SYN_FLOOD_PROTECTION
# Batasi koneksi baru SYN, jika melebihi batas, log dan drop
"$IPTABLES" -A SYN_FLOOD_PROTECTION -m limit --limit "$RLIMIT_DEFAULT" -j RETURN
"$IPTABLES" -A SYN_FLOOD_PROTECTION -j DROP_LOG

# Rantai untuk ICMP yang berhubungan (hanya yang diperlukan)
"$IPTABLES" -N RELATED_ICMP
"$IPTABLES" -A RELATED_ICMP -p icmp --icmp-type destination-unreachable -j ACCEPT_LOG
"$IPTABLES" -A RELATED_ICMP -p icmp --icmp-type time-exceeded -j ACCEPT_LOG
"$IPTABLES" -A RELATED_ICMP -p icmp --icmp-type parameter-problem -j ACCEPT_LOG
"$IPTABLES" -A RELATED_ICMP -j DROP_LOG

# --- Aturan INPUT Chain ---
echo "Mengatur aturan INPUT..."

# Izinkan loopback interface sepenuhnya
"$IPTABLES" -A INPUT -i lo -j ACCEPT

# Izinkan koneksi yang sudah established dan related (sangat penting)
"$IPTABLES" -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Lindungi dari paket INVALID state
"$IPTABLES" -A INPUT -m state --state INVALID -j DROP_LOG

# Perlindungan terhadap serangan umum (Port Scanners, Xmas, Null, FIN scans)
"$IPTABLES" -A INPUT -p tcp --tcp-flags ALL NONE -j DROP_LOG # Null Scan
"$IPTABLES" -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP_LOG # SYN-FIN Scan
"$IPTABLES" -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP_LOG # SYN-RST Scan
"$IPTABLES" -A INPUT -p tcp --tcp-flags FIN,PSH,URG FIN,PSH,URG -j DROP_LOG # Xmas Scan
"$IPTABLES" -A INPUT -p tcp --tcp-flags ALL ALL -j DROP_LOG # Malformed Scan

# Pencegahan SYN Flood (arahkan ke rantai kustom)
"$IPTABLES" -A INPUT -p tcp --syn -j SYN_FLOOD_PROTECTION

# Blokir paket terfragmentasi (sering digunakan dalam serangan)
"$IPTABLES" -A INPUT -f -j DROP_LOG

# Blokir IP yang dicadangkan/tidak valid (sinkhole traffic)
# Perhatikan: Ini adalah daftar panjang, tambahkan hanya yang Anda yakini tidak akan pernah menjadi sumber traffic sah.
# Untuk VPS umum, daftar ini mungkin terlalu agresif dan bisa memblokir ISP/traffic valid.
# Pertimbangkan untuk mengaktifkan hanya jika Anda mengalami masalah spoofing parah.
# "$IPTABLES" -A INPUT -s 0.0.0.0/7 -j DROP_LOG
# "$IPTABLES" -A INPUT -s 2.0.0.0/8 -j DROP_LOG
# ... (sertakan daftar lengkap dari skrip asli jika diinginkan) ...
# "$IPTABLES" -A INPUT -s 224.0.0.0/3 -j DROP_LOG # Multicast

# Blokir lalu lintas dari jaringan pribadi jika tidak diperlukan (misalnya, server web publik)
# "$IPTABLES" -A INPUT -s 10.0.0.0/8 -j DROP_LOG
# "$IPTABLES" -A INPUT -s 172.16.0.0/12 -j DROP_LOG
# "$IPTABLES" -A INPUT -s 192.168.0.0/16 -j DROP_LOG

# Aturan khusus untuk layanan yang masuk (Inbound Services)
# Izinkan hanya port yang benar-benar Anda butuhkan!
"$IPTABLES" -A INPUT -p tcp --dport "$SSHPORT" -j ACCEPT_LOG # SSH
"$IPTABLES" -A INPUT -p tcp --dport 80 -j ACCEPT_LOG          # HTTP
"$IPTABLES" -A INPUT -p tcp --dport 443 -j ACCEPT_LOG         # HTTPS
# Contoh layanan lain yang mungkin Anda butuhkan:
# "$IPTABLES" -A INPUT -p tcp --dport 25 -j ACCEPT_LOG          # SMTP (email masuk)
# "$IPTABLES" -A INPUT -p tcp --dport 110 -j ACCEPT_LOG         # POP3
# "$IPTABLES" -A INPUT -p tcp --dport 143 -j ACCEPT_LOG         # IMAP
# "$IPTABLES" -A INPUT -p tcp --dport 3306 -j ACCEPT_LOG        # MySQL (HANYA jika diakses dari IP tertentu!)
# "$IPTABLES" -A INPUT -s YOUR_DB_SERVER_IP -p tcp --dport 3306 -j ACCEPT_LOG
# "$IPTABLES" -A INPUT -p udp --dport 53 -j ACCEPT_LOG          # DNS (Jika server ini adalah DNS resolver)
# "$IPTABLES" -A INPUT -p tcp --dport 53 -j ACCEPT_LOG          # DNS (Jika server ini adalah DNS resolver)

# Perlindungan terhadap koneksi ke port SMB/CIFS (Windows shares)
"$IPTABLES" -A INPUT -p tcp -m multiport --dports 135,137,138,139,445 -j DROP_LOG
"$IPTABLES" -A INPUT -p udp -m multiport --dports 135,137,138,139,445 -j DROP_LOG

# --- Aturan OUTPUT Chain ---
echo "Mengatur aturan OUTPUT..."

# Izinkan loopback interface sepenuhnya
"$IPTABLES" -A OUTPUT -o lo -j ACCEPT

# Izinkan koneksi yang sudah established dan related
"$IPTABLES" -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Lindungi dari paket INVALID state
"$IPTABLES" -A OUTPUT -m state --state INVALID -j DROP_LOG

# Blokir paket terfragmentasi (keluar)
"$IPTABLES" -A OUTPUT -f -j DROP_LOG

# Aturan khusus untuk layanan keluar (Outbound Services)
# Izinkan hanya port yang benar-benar Anda butuhkan untuk server Anda
"$IPTABLES" -A OUTPUT -p tcp --dport 80 -j ACCEPT_LOG   # HTTP
"$IPTABLES" -A OUTPUT -p tcp --dport 443 -j ACCEPT_LOG  # HTTPS
"$IPTABLES" -A OUTPUT -p udp --dport 53 -j ACCEPT_LOG   # DNS (resolving)
"$IPTABLES" -A OUTPUT -p tcp --dport 53 -j ACCEPT_LOG   # DNS (resolving)
"$IPTABLES" -A OUTPUT -p tcp --dport "$SSHPORT" -j ACCEPT_LOG # SSH keluar
# Contoh layanan lain:
# "$IPTABLES" -A OUTPUT -p tcp --dport 25 -j ACCEPT_LOG   # SMTP (kirim email)
# "$IPTABLES" -A OUTPUT -p tcp --dport 465 -j ACCEPT_LOG  # SMTPS
# "$IPTABLES" -A OUTPUT -p tcp --dport 587 -j ACCEPT_LOG  # Submission (Port untuk kirim email)
# "$IPTABLES" -A OUTPUT -p udp --dport 123 -j ACCEPT_LOG  # NTP (sinkronisasi waktu)
# "$IPTABLES" -A OUTPUT -p tcp --dport 21 -j ACCEPT_LOG   # FTP (jika diperlukan)
# "$IPTABLES" -A OUTPUT -p tcp --dport 3306 -j ACCEPT_LOG # MySQL (jika server ini adalah klien DB)

# --- Aturan FORWARD Chain ---
echo "Mengatur aturan FORWARD..."
# Lindungi dari paket INVALID state
"$IPTABLES" -A FORWARD -m state --state INVALID -j DROP_LOG
# Drop semua traffic FORWARD jika server bukan router
"$IPTABLES" -A FORWARD -j DROP_LOG

# --- Aturan ICMP (Ping) ---
# Mengizinkan ping hanya untuk debugging dan dengan rate limit yang ketat.
echo "Mengatur aturan ICMP..."
"$IPTABLES" -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT_LOG
"$IPTABLES" -A OUTPUT -p icmp -m state --state ESTABLISHED -j ACCEPT_LOG

"$IPTABLES" -A INPUT -p icmp -m state --state RELATED -j RELATED_ICMP "$RLIMIT_ICMP"
"$IPTABLES" -A OUTPUT -p icmp -m state --state RELATED -j RELATED_ICMP "$RLIMIT_ICMP"

# Izinkan ping masuk dan keluar dengan rate limit yang ketat
"$IPTABLES" -A INPUT -p icmp --icmp-type echo-request -m limit --limit "$RLIMIT_ICMP" -j ACCEPT_LOG
"$IPTABLES" -A OUTPUT -p icmp --icmp-type echo-request -m limit --limit "$RLIMIT_ICMP" -j ACCEPT_LOG

# Drop semua ICMP lainnya
"$IPTABLES" -A INPUT -p icmp -j DROP_LOG
"$IPTABLES" -A OUTPUT -p icmp -j DROP_LOG
"$IPTABLES" -A FORWARD -p icmp -j DROP_LOG

# --- Aturan IPv6 ---
echo "Mengatur aturan IPv6..."
if test -x "$IP6TABLES"; then
    # Atur kebijakan default IPv6 ke DROP
    "$IP6TABLES" -P INPUT DROP 2>/dev/null
    "$IP6TABLES" -P FORWARD DROP 2>/dev/null
    "$IP6TABLES" -P OUTPUT DROP 2>/dev/null

    # Izinkan loopback IPv6
    "$IP6TABLES" -A INPUT -i lo -j ACCEPT 2>/dev/null
    "$IP6TABLES" -A OUTPUT -o lo -j ACCEPT 2>/dev/null

    # Izinkan koneksi IPv6 yang established dan related
    "$IP6TABLES" -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null
    "$IP6TABLES" -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null

    # Izinkan SSH IPv6 (jika Anda menggunakannya)
    "$IP6TABLES" -A INPUT -p tcp --dport "$SSHPORT" -j ACCEPT 2>/dev/null

    # Izinkan HTTP/HTTPS IPv6
    "$IP6TABLES" -A INPUT -p tcp --dport 80 -j ACCEPT 2>/dev/null
    "$IP6TABLES" -A INPUT -p tcp --dport 443 -j ACCEPT 2>/dev/null

    # Izinkan DNS IPv6 keluar
    "$IP6TABLES" -A OUTPUT -p udp --dport 53 -j ACCEPT 2>/dev/null
    "$IP6TABLES" -A OUTPUT -p tcp --dport 53 -j ACCEPT 2>/dev/null

    # Drop semua lalu lintas IPv6 lainnya
    "$IP6TABLES" -A INPUT -j DROP 2>/dev/null
    "$IP6TABLES" -A OUTPUT -j DROP 2>/dev/null
    "$IP6TABLES" -A FORWARD -j DROP 2>/dev/null
else
    echo "ip6tables tidak ditemukan, mengabaikan konfigurasi IPv6."
fi

# --- Aturan Default Terakhir: REJECT / DROP sisa lalu lintas ---
echo "Menerapkan aturan drop akhir..."
# Gunakan REJECT_LOG untuk layanan yang mungkin mencoba terhubung dan Anda ingin log,
# atau DROP_LOG untuk sisa traffic. REJECT memberi tahu pengirim bahwa port ditutup.
"$IPTABLES" -A INPUT -j REJECT_LOG
"$IPTABLES" -A OUTPUT -j REJECT_LOG
"$IPTABLES" -A FORWARD -j REJECT_LOG

echo "Konfigurasi firewall selesai."
exit 0
