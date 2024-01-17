#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/rclone.conf"
#Install Wondershaper
cd /bin
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user backupsmtp93@gmail.com
from backupsmtp93@gmail.com
password sdallofkbpuhbtoa 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/restore.sh"
wget -O strt "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/strt.sh"
wget -O limitspeed "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/limitspeed.sh"
sh"
wget -O menu-backup "https://raw.githubusercontent.com/FadlyNotNot/scku/main/backup/menu-backup.sh"
chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x strt
chmod +x limitspeed
chmod +x menu-backup
rm -f /root/set-br.sh
echo ""
