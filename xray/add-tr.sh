#!/bin/bash

# // color
GREENBO="\e[92;1m"
NC='\e[0m' # penutup
BGGREEN="\033[42;37m" # hijau
BGRED="\033[41;37m" # merah
BGYELLOW="\033[43;37m" # kuning
BGPURPLE="\033[45;37m" # ungu

# // source
source /var/lib/xdxl/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "===============[ Add Title Account ]=============="
echo -e ""
		read -rp "Username: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "===============[ TROJAN ]=============="
			echo ""
			echo "Nama Sudah ada, Silahkan gunakan username lain !!!"
			echo ""
        echo -e "======================================"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "masa aktif : " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojan_n_tls="trojan://${uuid}@${domain}:80?path=%2Ftrojan&security=nonr&host=${domain}&type=ws#${user}"
clear
echo -e "===============[ TROJAN ]=============="
echo -e " "
echo -e "Username      : ${user}"
echo -e "Expired On    : $exp"
echo -e "Host/IP       : ${domain}"
echo -e "Port none TLS : 80, 8080"
echo -e "Port SSL/TLS  : 443, 8443"
echo -e "Uuid          : ${uuid}"
echo -e "Path          : /trojan"
echo -e "ServiceName   : trojan"
echo -e "==============="
echo -e "Link SSL/TLS : "
echo -e "${trojanlink}"
echo -e "==============="
echo -e "Link none TLS:"
echo -e "${trojan_n_tls}"
echo -e "==============="
echo -e "Link GRPC    : "
echo -e "${trojanlink1}"
echo -e "==============="
echo ""
