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
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "SSH & OpenVPN Account Info"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Expired On     : $exp"
echo -e "==============================="
echo -e "IP Server      : $IP"
echo -e "Host           : ${domain}"
echo -e "OpenSSH        : 22"
echo -e "OpenVPN OHP    : 8888"
echo -e "Dropbear       : 109, 143"
echo -e "SSL/TLS        : 789, 777"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN        : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN        : OHP $ovpn http://$IP:81/client-ohp-$ovpn.ovpn"
echo -e "OpenVPN        : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "badvpn         : 7100-7300"
echo -e "==============================="
echo -e
