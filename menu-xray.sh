#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}            PERMISSION ACCEPTED!${NC}"
else
clear
echo ""
rm -f setup.sh
echo -e "${red}              PERMISSION DENIED!${NC}"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P${NC}"
sleep 7
exit 0
fi
clear

echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;37;46m           ◎ XRAY VLESS MENU ◎                     \e[0m"
echo -e
echo -e " [1]\e[0m•\e[1;36mCREATE NEW USER\e[0m"
echo -e " [2]\e[0m•\e[1;36mRENEW USER ACCOUNT\e[0m"
echo -e " [3]\e[0m•\e[1;36mDELETE USER ACCOUNT\e[0m"
echo -e " [4]\e[0m•\e[1;36mCHECK USER LOGIN\e[0m"
echo -e
echo -e "\E[0;37;46m           ◎ Moded By 𝑿𝒐𝒐𝒍𝚅𝙿𝙽 ◎                    \e[0m"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select Options From [1-3 or x]: " menuxray
echo -e ""
case $menuxray in
1)
add-xray
;;
2)
renew-xray
;;
3)
del-xray
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
