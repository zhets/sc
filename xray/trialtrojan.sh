#!/bin/bash
ungu="\033[0;35m"
bc="\033[5;36m"
b="\033[0;96m"
y="\033[0;33m"
NC="\033[0m"
function lane() {
echo -e "${b}─────────────────────────────────"
}
clear
lane
echo -e "       [ CREATE TROJAN ACCOUNT ]        "
lane
echo -e "${ungu} Input Number for expired"
echo -e " Example:"
echo -e " 1 for 1 minutes ${NC}"
echo -e ""
read -p " Sett Expired [ minutes ]: " timer

domain=$(cat /etc/xray/domain)
user=v-`</dev/urandom tr -dc a-z0-9 | head -c5`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@${domain}ini:443?path=%2Ftrojan&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan&security=none&host=${domain}&type=ws#${user}"

clear
echo "xdxl vmess ${user} | at now + $timer minutes > /dev/null 2>&1
echo -e ""
lane
echo -e "      ==[ XRAY TROJAN ACCOUNT ]=="
lane
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Port TLS       : 443, 8443"
echo -e "Port none TLS  : 80, 8080, 8880, 2082"
echo -e "Port  GRPC     : ${tls}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "Network        : ws or grpc"
echo -e "Path           : /vmess"
echo -e "ServiceName    : vmess"
lane
echo -e "Link TLS      : ${trojanlink}"
lane
echo -e "Link none TLS : ${trojanlink2}"
lane
echo -e "Link GRPC     : ${trojanlink1}"
lane
echo -e "   Expired On     : $timer minutes"
lane
echo ""
