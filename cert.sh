#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "\e[0;32m            PERMISSION ACCEPTED!\e[0m"
else
rm -f setup.sh
echo -e "\e[1;31m              PERMISSION DENIED!\e[0m"
echo -e "\e[1;31m PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
sleep 5
exit 0
fi
clear
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
cyan='\e[0;36m'
cyanb='\e[46m'
white='\e[0;37m'
grey='\e[1;36m'
NC='\e[0m'
echo -e " ${green} RECERT V2RAY${NC}"
sleep 1
echo start
sleep 0.5
domain=$(cat /etc/v2ray/domain)
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop trojan
systemctl stop nginx
sudo kill -9 $(sudo lsof -t -i:80)
~/.acme.sh/acme.sh --renew -d $domain --standalone -k ec-256 --force --ecc
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start trojan.service
echo Done
sleep 0.5
clear
echo -e " ${green} RECERT DOMAIN COMPLETED${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
