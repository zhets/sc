#!/bin/bash
z="\033[1;93m"
x="\033[0m"
clear
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "   Set Masa Aktif ( Menit )"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━━━◇${x}"
read -p " Menit : " Anuku
clear
#sldomain=`cat /etc/xray/dns`
#slkey=`cat /etc/slowdns/server.pub`
domen=`cat /etc/xray/domain`
Login=Trial-SSH`</dev/urandom tr -dc X-Z0-9 | head -c3`
hari="1"
Pass=1
echo Create Akun: $Login
echo Setting Password: $Pass
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "  <=  SSH ACCOUNT =>"       
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Username   : $Login"
echo -e "Password   : $Pass"        
#echo -e "CITY         : $(cat /root/.mycity)"
#echo -e "ISP          : $(cat /root/.myisp)"
#echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
#echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
#echo -e "Slowdns      : 53, 5300"
echo -e "Host            : $(cat /etc/xray/domain)"
echo -e "Port Dropbear   : 109, 69, 143"
echo -e "Port OpenSSH    : 22"
echo -e "Port TLS/SSL    : 443"
echo -e "Port None TLS   : 80"
echo -e "Port Udp Custom : 1-65535"
echo -e "Port Udgpw      : 7300"      
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Payload WS => "
echo -d "GET wss://$(cat /etc/xray/domain)/ HTTP/1.1[crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Masa Aktif : $Anuku Menit"
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo userdel -f "$Login" | at now +$Anuku minutes &> /dev/null
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
