#!/bin/bash
exitsc="\033[0m"
y="\033[1;93m"
j="\033[0;33m"
function lane() {
echo -e "${y}────────────────────────────────────────────${exitsc}"
}
url_izin="https://raw.githubusercontent.com/zhets/izinsc/main/ip"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
useexp=$(wget -qO- $url_izin | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
lane
echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          ${exitsc}"
lane
echo -e ""
echo -e "            \033[0;35mPERMISSION DENIED !${exitsc}"
echo -e "   ${j}Your VPS${exitsc} $ipsaya ${j}Has been Banned${exitsc}"
echo -e "     ${j}Buy access permissions for scripts${exitsc}"
echo -e "             ${j}Contact Admin :${exitsc}"
echo -e "      \033[0;36mWhatsapp${exitsc} wa.me/6285935195701"
lane
exit
fi
}
checking_sc

# // color
GREENBO="\e[92;1m"
NC='\e[0m' # penutup
BGGREEN="\033[42;37m" # hijau
BGRED="\033[41;37m" # merah
BGYELLOW="\033[43;37m" # kuning
BGPURPLE="\033[45;37m" # ungu

# // source
source /var/lib/xdxl/ipvps.conf
domain=$(cat /etc/xray/domain)

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
