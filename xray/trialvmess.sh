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
echo -e "       [ CREATE VMESS ACCOUNT ]        "
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
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif menit" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
acs=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "bug.com",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $acs | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
clear
echo "xdxl vmess ${user} | at now + $timer minutes > /dev/null 2>&1
echo -e ""
lane
echo -e "      ==[ XRAY VMESS ACCOUNT ]=="
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
echo -e "Link TLS      : ${vmesslink1}"
lane
echo -e "Link none TLS : ${vmesslink2}"
lane
echo -e "Link GRPC     : ${vmesslink3}"
lane
echo -e "   Expired On     : $timer minutes"
lane
echo ""
