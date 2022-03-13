#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Trojan]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Xray Trojan Account"
echo -e " 2)  Create Trojan Go Account"
echo -e " 3)  Deleting Xray Trojan Account"
echo -e " 4)  Deleting Trojan Go Account"
echo -e " 5)  Renew Xray Trojan Account"
echo -e " 6)  Renew Trojan Go Account"
echo -e " 7)  Check User Login Xray/Trojan "
echo -e " 8)  Check User Login Trojan Go"
echo -e ""
echo -e "\e[1;32m═══════════════════════════════════════" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m═══════════════════════════════════════" | lolcat
echo -e ""
read -p "     Please Input Number  [1-4 or x] :  "  trojan
echo -e ""
case $trojan in
1)
addtrojan
;;
2)
addtrgo
;;
3)
deltrojan
;;
4)
deltrgo
;;
5)
renewtrojan
;;
6)
renewtrgo
;;
7)
cektrojan
;;
8)
cektrgo
;;
x)
menu
;;
*)
clear
menu
;;
esac

