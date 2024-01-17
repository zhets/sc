#!/bin/bash
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
clear
echo -e "===============[ Add Title Account ]=============="
echo -e ""
		read -rp "Username : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
            echo -e "======================================"
			echo ""
			echo -e "Nama Sudah ada, Tolong Lu Ganti Tod🥱"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "masa aktif : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan-go://${uuid}@isi_bug_disini:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojango#$user"
link1="trojan://${uuid}@isi_bug_disini:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojango#$user"
clear
echo -e "===============[ TROJAN GO ]=============="
echo -e "Remarks    : ${user}" | tee -a /etc/log-create-user.log
echo -e "IP/Host    : ${MYIP}" | tee -a /etc/log-create-user.log
echo -e "Address    : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Port       : ${trgo}" | tee -a /etc/log-create-user.log
echo -e "Key        : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption : none" | tee -a /etc/log-create-user.log
echo -e "Path       : /trojango" | tee -a /etc/log-create-user.log
echo -e "Created    : $hariini" | tee -a /etc/log-create-user.log
echo -e "Expired    : $exp" | tee -a /etc/log-create-user.log
echo -e "==============="
echo -e "Link TrGo  		           : ${link}" | tee -a /etc/log-create-user.log
echo -e "==============="
echo -e "Link TrGo v2rayNG	: ${link1}" | tee -a /etc/log-create-user.log
echo -e "==============="
echo -e ""
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"

menu
