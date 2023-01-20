#!/bin/bash
clear
echo "---------------------------"
echo "---------------------------"
echo
echo -e "\033[32m Yapılandırılacak Ayarlar \033[0m"
echo "---------------------------"
echo "2) Belirlediğiniz port numarasına aynı IP üzerinden girişi limitlendirin."
echo "3) CentOS sürümünüzü öğrenin."
echo "4) Yapılandırılmış tüm ayarları sıfırlayın."
echo "---------------------------"
echo "--> seçenek girin: "
read numara
case $numara in
2)
	read -p "--> port numaranızı girin: " port
	read -p "--> aynı anda kurulacak maksimum bağlantı sayısını girin: " sayi
	sudo iptables -A INPUT -p tcp -m tcp --dport $port --tcp-flags FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above $sayi --connlimit-mask 32 -j REJECT --reject-with tcp-reset
	sudo iptables-save
	sudo service iptables save
	clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mBelirlediğiniz "$port" port numarasına maksimum bağlantı sayısı "$sayi" olarak ayarlandı.\033[0m"
	echo ""
	echo ""
;;
3)
	clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mCENTOS SÜRÜMÜNÜZ:\033[0m"
	cat /etc/centos-release
	echo ""
	echo ""
;;
4)
	clear
	sudo iptables --flush
	sudo iptables-save
	sudo service iptables save
	clear
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo -e "\033[32mTüm ayarlar sıfırladım.\033[0m"
	echo ""
	echo ""
;;
*)
echo "--> Hatalı seçenek seçimi yaptınız."
esac
