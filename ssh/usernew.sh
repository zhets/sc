#!/bin/bash
z="\033[1;93m"
x="\033[0m"
clear
Domain=$(cat /etc/xray/domain)"
IPVPS=(curl ifconfig.me)"
IP=$(curl -sS ifconfig.me);
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[40;1;37m        Create SSH Account         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username       : " Login
read -p "Password       : " Pass
#read -p "Max IP         : " iplimit
read -p "Expired (Days) : " masaaktif
sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"                 
echo -e "   <=  SSH ACCOUNT =>"       
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}
echo -e "Username   : $Login"
echo -e "Password   : $Pass"        
#echo -e "CITY         : $(cat /root/.mycity)"
#echo -e "ISP          : $(cat /root/.myisp)"
#echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
#echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
#echo -e "Slowdns      : 53, 5300"
echo -e "Host            : ${Domain}"
echo -e "IP              : ${IPVPS}
echo -e "Port Dropbear   : 109, 69, 143"
echo -r "Port OpenSSH    : 22"
echo -e "Port SSL/TLS    : 443"
echo -e "Port None TLS   : 80"
echo -e "Port Udp Custom : 1-65535"
echo -e "Port Udgpw SSH  : 7300"      
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Payload WS  => "
echo -e "GET wss://[host]/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Masa Aktif : $exp"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
