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
z="\033[1;93m"
x="\033[0m"
Domain=$(cat /etc/xray/domain)"
hostslow=$( cat /etc/xray/dns )
serverpub=$( cat /etc/slowdns/server.pub )
function kill_ssh() {
userdel -f "$user"
systemctl restart ws-stunnel
systemctl restart dropbear
}
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${x}"
echo -e "\e[40;1;37m        Create SSH Account         ${x}"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${x}"
echo -e ""
read -p "Expired [ menit ] : " expired
user=trial-`</dev/urandom tr -dc a-z0-9 | head -c5`
useradd -e `date -d "1 days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $user &> /dev/null
hari-ini=`date -d "0 days" +"%Y-%m-%d"`
clear
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"                 
echo -e "   <=  SSH ACCOUNT =>"       
echo -e "${z}◇━━━━━━━━━━━━━━━━━━━◇${x}"
echo -e "Username   : $user"
echo -e "Password   : $Pass"
#echo -e "Created On : $hari-ini"
echo -e "Expired On : $expired Minutes"
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
echo userdel -f "$user" && systemctl restart ws-stunnel && systemctl restart dropbear| at now +$expired minutes &> /dev/null
