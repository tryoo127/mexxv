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
sleep 3
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
echo -e "============================================="
echo -e "    ${cyan}AUTOSCRIPT AIO (V1.0) BY @XoolVPN${NC}"
echo -e "============================================="
sleep 2
apt update && apt upgrade -y
clear
sleep 3
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo -e "============================================="
echo -e "           ${cyan}ADD DOMAIN / SUBDOMAIN${NC}"
echo -e "============================================="
sleep 2
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
clear
echo -e "============================================="
echo -e "           ${cyan}INSTALLING SSH & OVPN${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo -e "============================================="
echo -e "             ${cyan}INSTALLING V2RAY${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/install-xray.sh && chmod +x install-xray.sh && screen -S v2ray ./install-xray.sh
echo -e "============================================="
echo -e "           ${cyan}INSTALLING SHADOWSOCKS${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
echo -e "============================================="
echo -e "            ${cyan}INSTALLING WIREGUARD${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
echo -e "============================================="
echo -e "             ${cyan}INSTALLING OHP${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
echo -e "============================================="
echo -e "             ${cyan}INSTALLING BACKUP${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/set-br.sh && chmod +x set-br.sh && screen -S set-br ./set-br.sh
echo '============================================='

rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ohp.sh
rm -f /root/set-br.sh
echo "1.1" > /home/ver

echo "menu" >> .profile
clear
echo ""
echo -e "============================================="
echo -e "       ${cyan}INSTALLATION HAS BEEN COMPLETED${NC}"
echo -e "============================================="
sleep 2
echo ""
echo "=================== XoolVPN AUTOSCRIPT AIO (V1.0) ===================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - OpenVPN OHP             : 8888"  | tee -a log-install.txt
echo "   - SSL/TLS                 : 789, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 ,8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - Shadowsocks TLS         : 2443-2543"  | tee -a log-install.txt
echo "   - Shadowsocks HTTP        : 3443-3543"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 8445"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8446"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 8444"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS         : 465"  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (UTC +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON/SET]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 UTC +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=================== XoolVPNx AUTOSCRIPT AIO (V1.0) ===================" | tee -a log-install.txt
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " SERVER WILL REBOOT AUTOMATICALLY IN 10 SECOND"
sleep 10
reboot
