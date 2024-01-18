#!/bin/bash
z="\033[1;93m"
x="\033[0m"
clear
Domain=$(cat /etc/xray/domain)"
hostslow=$( cat /etc/xray/dns )
serverpub=$( cat /etc/slowdns/server.pub )

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${x}"
echo -e "\e[40;1;37m        Create SSH Account         ${x}"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${x}"
read -p "Username       : " Login
read -p "Password       : " Pass
read -p "Expired (Days) : " expired
useradd -e `date -d "$expired days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hari-ini=`date -d "0 days" +"%Y-%m-%d"`
clear
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"                 
echo -e "   <=  SSH ACCOUNT =>"       
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Username   : $Login"
echo -e "Password   : $Pass"
echo -e "Created On : $hari-ini"
echo -e "Expired On : $exp"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "CITY          : $(cat /root/.city)"
echo -e "ISP           : $(cat /root/.isp)"
echo -e "Host/IP       : ${Domain}"
echo -e "Host Slowdns  : ${hostslow}"
echo -e "Pub key       : ${serverpub}"
echo -e "Port Slowdns  : 53, 5300"
echo -e "Port Dropbear : 69, 109, 110"
echo -r "Port OpenSSH  : 22"
echo -e "Port SSL/TLS  : 443, 8443"
echo -e "Port None TLS : 80, 8080"
echo -e "Port SSH UDP  : 1-65535"
echo -e "Badvpn Udgpw  : 7100 - 7500"      
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Payload WS  => "
echo -e "GET wss://[host]/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
