#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear 
cat /usr/bin/bannerku | lolcat
echo -e ""
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\033[1;31mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/fsidvpn/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
fi
chck_b(){
	PID=`ps -ef |grep -v grep | grep scvps_bot |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			sts="\033[0;32m◉ \033[0m"
		else
			sts="\033[1;31m○ \033[0m"
    fi
}
echo -e  ""
echo -e  "   =======================CEK LAYANAN========================"| lolcat
#!/bin/bash                                                                             
red="\e[1;31m"                                                                          
green="\e[0;32m"                                                                        
NC="\e[0m"                                                                              

       echo -e ""
status="$(systemctl show ssh.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SSH               : SSH Service is "$green"running"$NC""                  
else                                                                                    
echo -e " SSh               : SSH Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show stunnel5.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Stunnel5          : Stunnel5 Service is "$green"running"$NC""                  
else                                                                                    
echo -e " Stunnel5          : Stunnel5 Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show ws-tls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Websocket SSL     : Websocket SSL Service is "$green"running"$NC""                  
else                                                                                    
echo -e " Websocket SSL     : Websocket SSL Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show ws-nontls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " WS DROPBEAR       : Websocket DROPBEAR Service is "$green"running"$NC""                  
else                                                                                    
echo -e " WS DROPBEAR       : Websocket DROPBEAR Service is "$red"not running (Error)"$NC""        
fi
status="$(systemctl show ws-ovpn.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " WS OPENVPN        : Websocket OPENVPN Service is "$green"running"$NC""                  
else                                                                                    
echo -e " WS OPENVPN        : Websocket OPENVPN Service is "$red"not running (Error)"$NC""        
fi                                                                                
status="$(systemctl show dropbear.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " DropBear          : DropBear Service is "$green"running"$NC""                  
else                                                                                    
echo -e " DropBear          : DropBear Service is "$red"not running (Error)"$NC""        
fi                                                                                      
status="$(systemctl show xray.service --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " V2ray Non TLS     : V2ray Non TLS Service is "$green"running"$NC""              
else                                                                                    
echo -e " V2ray Non TLS     : V2ray Non TLS Service is "$red"not running (Error)"$NC""    
fi                                                                                      
status="$(systemctl show xray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " V2ray TLS         : V2ray TLS Service is "$green"running"$NC""                
else                                                                                    
echo -e " V2ray TLS         : V2ray TLS Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show xray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Vless TLS         : Vless TLS Service is "$green"running"$NC""                
else                                                                                    
echo -e " Vless TLS         : Vless TLS Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show xray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Vless Non TLS     : Vless Non TLS Service is "$green"running"$NC""                
else                                                                                    
echo -e " Vless Non TLS     : Vless Non TLS Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show trojan-go --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Trojan            : Trojan Service is "$green"running"$NC""                
else                                                                                    
echo -e " Trojan            : Trojan Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show squid.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Squid             : Squid Service is "$green"running"$NC""                
else                                                                                    
echo -e " Squid             : Squid Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show openvpn.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Openvpn           : Openvpn Service is "$green"running"$NC""                
else                                                                                    
echo -e " Openvpn           : Openvpn Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show ws-ovpn.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Ws-ovpn           : Websocket Openvpn Service is "$green"running"$NC""                
else                                                                                    
echo -e " Ws-ovpn           : Websocket Openvpn Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show wg-quick@wg0 --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Wireguard         : Wireguard Service is "$green"running"$NC""                
else                                                                                    
echo -e " Wireguard         : Wireguard Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show accel-ppp.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SSTP              : SSTP Service is "$green"running"$NC""                
else                                                                                    
echo -e " SSTP              : SSTP Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show ssrmu --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SSR               : SSR Service is "$green"running"$NC""                
else                                                                                    
echo -e " SSR               : SSR Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show shadowsocks-libev.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Shadowsocks       : Shadowsocks Service is "$green"running"$NC""                
else                                                                                    
echo -e " Shadowsocks       : Sadhowsocks Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show xl2tpd.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " L2tp              : L2tp Service is "$green"running"$NC""                
else                                                                                    
echo -e " L2tp              : L2tp Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show pptpd.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " PPTP              : PPTP Service is "$green"running"$NC""                
else                                                                                    
echo -e " PPTP              : PPTP Service is "$red"not running (Error)"$NC""      
fi
status="$(systemctl show nginx.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " Nginx             : Nginx Service is "$green"running"$NC""                
else                                                                                    
echo -e " Nginx             : Nginx Service is "$red"not running (Error)"$NC""      
fi

exit
