 
#!/bin/bash
sudo wpa_supplicant -B -Dwext -iwlp3s0 -c/etc/wpa_supplicant/wpa_supplicant.conf
#sudo dhcpcd wlp3s0
#sudo ifconfig wlp3s0 192.168.1.123
#sudo route add default gw 192.168.1.1
#sudo route add 192.168.1.0 gw 192.168.1.1


