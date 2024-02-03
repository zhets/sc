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
echo -e "       [ CREATE VLESS ACCOUNT ]        "
lane
echo -e "${ungu} Input Number for expired"
echo -e " Example:"
echo -e " 1 for 1 minutes ${NC}"
echo -e ""
read -p " Sett Expired [ minutes ]: " timer

exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
domain=$(cat /etc/xray/domain)
user=vl-`</dev/urandom tr -dc a-z0-9 | head -c5`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless&sni=bug.com#${user}"
systemctl restart xray > /dev/null 2>&1
clear
echo "xdxl vless ${user} | at now + $timer minutes > /dev/null 2>&1
echo -e ""
lane
echo -e "      ==[ XRAY VLESS ACCOUNT ]=="
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
echo -e "Path           : /vless"
echo -e "ServiceName    : vless"
lane
echo -e "Link TLS      : ${vlesslink1}"
lane
echo -e "Link none TLS : ${vlesslink2}"
lane
echo -e "Link GRPC     : ${vlesslink3}"
lane
echo -e "   Expired On     : $timer minutes"
lane
echo ""
