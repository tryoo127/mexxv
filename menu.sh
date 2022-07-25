#!/bin/bash
#Access Permission
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}            PERMISSION ACCEPTED!${NC}"
sleep 3
clear
echo ""
rm -f setup.sh
echo -e "${red}              PERMISSION DENIED!${NC}"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P${NC}"
sleep 7
exit 0
fi
#Server Information
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
DOMAIN=$(cat /etc/v2ray/domain)
IPVPS=$(curl -s ipinfo.io/ip)
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
#Client Information
NAME=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $2}')
EXP=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $3}')
echo -e   "\E[0;37;46m           ◎ 𝗦𝗘𝗥𝗩𝗘𝗥 𝗦𝗧𝗔𝗧𝗨𝗦 ◎                       \e[0m"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " * CLIENT NAME   : $NAME"
echo -e " * EXPIRED ON    : $EXP"
echo -e " * SERVER ISP    : $ISP"$NC""
echo -e " * REGION        : $WKT"$NC""
echo -e " * IP ADDRESS    : $IPVPS"$NC""
echo -e " * DOMAIN HOST   : $DOMAIN"$NC""

status="$(systemctl show ssh.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mSSH OPENVPN   : "$green"Service Is Running"$NC""                  
else                                                                                    
echo -e " * \e[1;36mSSH OPENVPN   : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show openvpn-ohp.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mOPENVPN OHP   : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mOPENVPN OHP   : "$red"Not Running (Error)"$NC""        
fi                        

status="$(systemctl show stunnel4.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mSSL STUNNEL   : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mSSL STUNNEL   : "$red"Not Running (Error)"$NC""        
fi                                                                               

status="$(systemctl show dropbear.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mDROPBEAR      : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mDROPBEAR      : "$red"Not Running (Error)"$NC""        
fi                                                                                    

status="$(systemctl show squid.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mSQUID PROXY   : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mSQUID PROXY   : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show xray-mini@vless-direct --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mVLESS XTLS    : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mVLESS XTLS    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@vless.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mVLESS TLS     : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mVLESS TLS     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@vnone.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mVLESS NTLS    : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mVLESS NTLS    : "$red"Not Running (Error)"$NC""        
fi              

status="$(systemctl show v2ray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mVMESS TLS     : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mVMESS TLS     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@none.service --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mVMESS NTLS    : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mVMESS NTLS    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show trojan --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mTROJAN GFW    : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mTROJAN GFW    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show wg-quick@wg0 --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mWIREGUARD     : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mWIREGUARD     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show shadowsocks-libev.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mSHADOWSOCKS   : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mSHADOWSOCKS   : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show ssrmu --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " * \e[1;36mSHADOWSOCKSR  : "$green"Service Is Running"$NC""                  
else
echo -e " * \e[1;36mSHADOWSOCKSR  : "$red"Not Running (Error)"$NC""
fi
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0m   TRAFFIC   TODAY      YESTERDAY   MONTH"
echo -e " * \e[1;36mDOWNLOAD\e[0m  \e[0;32m$dtoday  $dyest $dmon\e[0m"
echo -e " * \e[1;36mUPLOAD\e[0m    \e[0;32m$utoday  $uyest  $umon\e[0m"
echo -e " * \e[1;36mTOTAL\e[0m     \e[0m$ttoday  $tyest $tmon\e[0m"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;37;46m           ◎ 𝗩𝗣𝗡 𝗣𝗔𝗡𝗘𝗟 𝗠𝗘𝗡𝗨 ◎                      \e[0m"
echo -e
echo -e " [1]\e[0m•\e[1;36mSSH OVPN\e[0m" "      [6]\e[0m•\e[1;36mVLESS\e[0m"

echo -e " [2]\e[0m•\e[1;36mWIREGUARD\e[0m" "     [7]\e[0m•\e[1;36mVMESS\e[0m"

echo -e " [3]\e[0m•\e[1;36mSHADOWSOCKS\e[0m" "   [8]\e[0m•\e[1;36mTROJAN\e[0m"

echo -e " [4]\e[0m•\e[1;36mSHADOWSOCKSR\e[0m" "  [9]\e[0m•\e[1;36mCHECK DNS\e[0m"

echo -e " [5]\e[0m•\e[1;36mVLESS XTLS\e[0m" "    [10]\e[0m•\e[1;36mSYSTEM MENU\e[0m"
echo -e
echo -e "\E[0;37;46m           ◎ Moded By 𝑿𝒐𝒐𝒍𝚅𝙿𝙽 ◎                    \e[0m"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " * SELECT OPTIONS MENU FROM [1-10 OR X TO EXIT]:" menu
echo -e ""
case $menu in
1)
    menu-ssh
    ;;
2)
    menu-wg
    ;;
3)
    menu-ss
    ;;
4)
    menu-ssr
    ;;
5)
    menu-xray
    ;;
6)
    menu-vless
    ;;
7)
    menu-vmess
    ;;
8)
    menu-trojan
    ;;
9)
    netflix
    ;;
10)
    system-info
    ;;
x)
    exit
    menu
    ;;
*)
    menu
    ;;
esac
