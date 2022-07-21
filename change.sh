#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}   TAHNIAH! ANDA DIBENARKAN MENGGUNAKAN SCRIPT INI...${NC}"
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo -e "${red}        MAAF! ANDA TIDAK DIBENARKAN MENGGUNAKAN SCRIPT INI...${NC}"
echo '                            ...                           ' 
sleep 7
exit 0
fi
clear

echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Stunnel4"
echo -e "     [2]  Change Port OpenVPN"
echo -e "     [3]  Change Port Wireguard"
echo -e "     [4]  Change Port Vmess"
echo -e "     [5]  Change Port Vless"
echo -e "     [6]  Change Port Trojan"
echo -e "     [7]  Change Port Squid"
echo -e "     [8]  Change Port XRAY"

echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-trojan
;;
7)
port-squid
;;
8)
port-xray 
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac