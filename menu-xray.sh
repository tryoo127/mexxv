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

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                      XRAY VLESS MENU                         \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m: Create XRAY Vless\e[0m"
echo -e "\033[0;34m    * [2]\e[0m: Deleting XRAY Vless\e[0m"
echo -e "\033[0;34m    * [3]\e[0m: Extending Vless Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m: Check User Login\e[0m"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select From Options [1-3 or x]: " menuxray
echo -e ""
case $menuxray in
1)
add-xray
;;
2)
del-xray
;;
3)
renew-xray
;;
4)
cek-xtls
;;
x)
menu
;;
*)
menu
;;
esac
