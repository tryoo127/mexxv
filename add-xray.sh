#!/bin/bash
clear
green='\e[0;32m'
red='\e[31m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}TAHNIAH! ANDA DIBENARKAN MENGGUNAKAN SCRIPT @mexxv! ${NC}"
sleep 5
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo -e "${red}MAAF! ANDA TIDAK DIBENARKAN MENGGUNAKAN SCRIPT INI! ${NC}"
echo '                            ...                           ' 
sleep 20
exit 0
fi
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
	domain=$(cat /etc/v2ray/domain)
else
	domain=$IP
fi

# // Vless
vless1="$(cat /etc/xray-mini/vless-direct.json | grep -w port | awk '{print $2}' | sed 's/,//g')"
vless2="$(cat /etc/xray-mini/vless-splice.json | grep -w port | awk '{print $2}' | sed 's/,//g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
	read -rp "User: " -e user
	CLIENT_EXISTS=$(grep -w $user /etc/xray-mini/vless-direct.json | wc -l)

	if [[ ${CLIENT_EXISTS} == '1' ]]; then
		echo ""
		echo "A client with the specified name was already created, please choose another name."
		exit 1
	fi
done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# // Input To Server
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray-mini/vless-direct.json
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-splice","email": "'""$user""'"' /etc/xray-mini/vless-splice.json

vless_xtls="vless://${uuid}@${domain}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com&host=bug.com#$user"
vless_splice="vless://${uuid}@${domain}:${vless2}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com&host=bug.com#$user"

# // Restarting Service
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice
systemctl disable xray-mini@vless-direct
systemctl disable xray-mini@vless-splice
systemctl enable xray-mini@vless-direct
systemctl enable xray-mini@vless-splice
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
systemctl restart xray-mini@vless-direct
systemctl restart xray-mini@vless-splice

clear
echo -e ""
echo -e "==========-XRAYS/VLESS-=========="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Port Direct    : $vless1"
echo -e "Port Splice    : $vless1"
echo -e "id             : ${uuid}"
echo -e "path           : /xray"
echo -e "================================="
echo -e "Link XTLS : ${vless_xtls}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e "================================="