#!/bin/bash
rm -rf update.sh
rm -rf update.sh.1
cd /usr/bin
rm -rf menu-ssh
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-vless
rm -rf menu-vmess
rm -rf menu-backup
sleep 2

G="\033[1;32m"
N="\e[0m"
echo -e "${G}===================[ UPDATE MENU ]=====================${N}"
sleep 3
cd /usr/local/sbin
# menu
wget -O menu "https://raw.githubusercontent.com/zhets/sc/main/menu/menu.sh"
wget -O menu-backup "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-backup.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/zhets/sc/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/zhets/sc/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-trojan.sh"

# menu ssh ovpn
wget -O menu-ssh "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/zhets/sc/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/zhets/sc/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/zhets/sc/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/zhets/sc/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/zhets/sc/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/zhets/sc/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/zhets/sc/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/zhets/sc/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/zhets/sc/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/zhets/sc/main/ssh/tendang.sh"

# menu system
wget -O menu-set "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/zhets/sc/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/zhets/sc/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/zhets/sc/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/zhets/sc/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/zhets/sc/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/zhets/sc/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/zhets/sc/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/zhets/sc/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/zhets/sc/main/menu/bw.sh"
# // Backup
wget -O autobackup "https://raw.githubusercontent.com/zhets/sc/main/backup/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/zhets/sc/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/zhets/sc/main/backup/restore.sh"
wget -O strt "https://raw.githubusercontent.com/zhets/sc/main/backup/strt.sh"
wget -O limitspeed "https://raw.githubusercontent.com/zhets/sc/main/backup/limitspeed.sh"

# change port
wget -O port-ssl "https://raw.githubusercontent.com/zhets/sc/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/zhets/sc/main/port/port-ovpn.sh"
wget -O xp "https://raw.githubusercontent.com/zhets/sc/main/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/zhets/sc/main/acs-set.sh"
wget -O sshws "https://raw.githubusercontent.com/zhets/sc/main/ssh/sshws.sh"

chmod +x menu
chmod +x menu-backup
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan

chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x strt
chmod +x limitspeed

chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang

chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw

chmod +x port-ssl
chmod +x port-ovpn

chmod +x xp
chmod +x acs-set
chmod +x sshws
clear
echo -e "${G}======================[ INSTALL SUKSES ]=======================${N}"
echo ""
echo " wait 5 second , To Menu "
sleep 5
menu
