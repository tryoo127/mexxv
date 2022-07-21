#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
IZIN=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP)
clear
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
DOMAIN=$(cat /etc/v2ray/domain)
IPVPS=$(curl -s ipinfo.io/ip)
NAME=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $2}')
EXP=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $3}')
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m           ◎ 𝗦𝗘𝗥𝗩𝗘𝗥 𝗦𝗧𝗔𝗧𝗨𝗦 ◎                              \e[0m"
echo -e
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'                                                             
status="$(systemctl show ssh.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * SSH & OPENVPN : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * SSH & OPENVPN : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show openvpn-ohp.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * OPENVPN OHP   : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * OPENVPN OHP   : "$red"Not Running (Error)"$NC""        
fi                        

status="$(systemctl show stunnel4.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * SSL STUNNEL   : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * SSL STUNNEL   : "$red"Not Running (Error)"$NC""        
fi                                                                               

status="$(systemctl show dropbear.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * DROPBEAR      : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * DROPBEAR      : "$red"Not Running (Error)"$NC""        
fi                                                                                    

status="$(systemctl show squid.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * SQUID PROXY   : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * SQUID PROXY   : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show xray-mini@vless-direct --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * VLESS XTLS    : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * VLESS XTLS    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@vless.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * VLESS TLS     : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * VLESS TLS     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@vnone.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * VLESS NTLS    : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * VLESS NTLS    : "$red"Not Running (Error)"$NC""        
fi              

status="$(systemctl show v2ray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * VMESS TLS     : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * VMESS TLS     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show v2ray@none.service --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * VMESS NTLS    : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * VMESS NTLS    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show trojan --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * TROJAN GFW    : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * TROJAN GFW    : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show wg-quick@wg0 --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * WIREGUARD     : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * WIREGUARD     : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show shadowsocks-libev.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * SHADOWSOCKS   : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * SHADOWSOCKS   : "$red"Not Running (Error)"$NC""        
fi

status="$(systemctl show ssrmu --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "    * SHADOWSOCKSR  : "$green"Running"$NC""                  
else                                                                                    
echo -e "    * SHADOWSOCKSR  : "$red"Not Running (Error)"$NC""        
fi

echo -e "    * CLIENT NAME   : $NAME"
echo -e "    * EXPIRED ON    : $EXP"
echo -e "    * SERVER ISP    : $ISP"
echo -e "    * I.P ADDRESS   : $IPVPS"
echo -e "    * DOMAIN NAME   : $DOMAIN"
echo -e "    * O.S VERSION   : `hostnamectl | grep "Operating System" | cut -d ' ' -f5-`"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m           ◎ 𝗩𝗣𝗡 𝗣𝗔𝗡𝗘𝗟 𝗠𝗘𝗡𝗨 ◎                             \e[0m"                         
echo -e
echo -e "    [1]\e[0m•SSH OVPN\e[0m" "      [6]\e[0m•VLESS\e[0m"

echo -e "    [2]\e[0m•WIREGUARD\e[0m" "     [7]\e[0m•VMESS\e[0m"

echo -e "    [3]\e[0m•SHADOWSOCKS\e[0m" "   [8]\e[0m•TROJAN\e[0m"

echo -e "    [4]\e[0m•SHADOWSOCKSR\e[0m" "  [9]\e[0m•CHECK DNS\e[0m"

echo -e "    [5]\e[0m•VLESS XTLS\e[0m" "    [10]\e[0m•SYSTEM MENU\e[0m"
echo -e
echo -e "\E[44;1;39m           ◎ Moded By 𝑿𝒐𝒐𝒍𝚅𝙿𝙽 ◎                           \e[0m"                         
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "    * SELECT OPTIONS MENU FROM [1-10 OR X TO EXIT]: " menu
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
