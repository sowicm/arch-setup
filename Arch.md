
=! 警惕： robocopy /mir 或 robocopy /purge 会将链接到的地方的文件也给清空！！！=

=Clear=
    (replace-string "[X]" "[ ]")

==分区

/                  50 GiB
/home             180 GiB
/swap               4 GiB
/var/cache/pacman  20 GiB
/opt               20 GiB

==Important Folders

/home
/root
/etc
/opt

/var/lib/mysql

==Archlinux

system:
run in isolinux:

    pacstrap /mnt base base-devel grub-bios
    pacstrap /mnt wap_supplicant net-tools dnsutils inetutils iproute2
    genfstab -p /mnt >> /mnt/etc/fstab
    arch-chroot /mnt
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    mkinitcpio -p linux
    echo 'sowicm-ThinkPad' > /etc/hostname
    passwd
    ^D
    umount /mnt
    reboot

    grub-install /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg
    useradd sowicm
    passwd sowicm
    echo '%sowicm ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
    #mkdir /mnt/newhome
    #mount /dev/sdaX /mnt/newhome
    #cd /home
    #cp -ax * /mnt/newhome
    #mv /home /home.bak
    #mkdir /home
    mount /dev/sdaX /home
    echo "/dev/sdaX /home ext4 defaults 1 2" >> /etc/fstab
    mkswap /dev/sdaX
    swapon /dev/sdaX
    echo "/dev/sdaX none swap defaults 0 0" >> /etc/fstab

    su sowicm
    ## dropbox
    #cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

    #mkdir cedet && cd cedet && bzr branch bzr://cedet.bzr.sourceforge.net/bzrroot/cedet
    #bzr --help
    #bzr check bzr://cedet.bzr.sourceforge.net/bzrroot/cedet
    #bzr check bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/.bzr
    #bzr whoami
    #bzr whoami "Sowicm <mr.right@sowicm.com>"
    #bzr whoami
    #bzr branch bzr://cedet.bzr.sourceforge.net/bzrroot/cedet
    #bzr branch bzr://cedet.bzr.sourceforge.net/bzrroot/cedet cedet
    #bzr checkout bzr://cedet.bzr.sourceforge.net/bzrroot/cedet cedet
    #bzr checkout bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk cedet
    #bzr branch bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk
    #exit
    #pwd
    #make EMACS="C:/Users/Sowicm/_MyApps/emacs/bin/runemacs.exe"

# todo : 自动识别pacman并添加到此

run in arch:
    sudo pacman -Syu
    sudo pacman -S --needed --noconfirm xorg-xinit xorg-server xorg-utils xorg-server-utils
    sudo pacman -S --needed --noconfirm xorg
    sudo pacman -S --needed --noconfirm gnome gnome-extra
    sudo pacman -S --needed --noconfirm vim
    sudo echo 'syntax on' >> /etc/vimrc
    sudo pacman -S --needed --noconfirm emacs
    sudo echo '#!/bin/bash' > /usr/bin/emacsw
    sudo echo 'emacsclient -t -a "" $1' >> /usr/bin/emacsw
    sudo chmod 755 /usr/bin/emacsw
    sudo pacman -S --needed --noconfirm fcitx fcitx-gtk2 fcitx-gtk3 fcitx-qt
    ##todo nano /etc/local.gen
    sudo locale-gen
    sudo pacman -S --needed --noconfirm ntfs-3g
    sudo pacman -S --needed --noconfirm firefox chromium
    sudo pacman -S --needed --noconfirm flashplugin
    sudo pacman -S --needed --noconfirm wqy-zenhei
    sudo pacman -S --needed --noconfirm encfs
    sudo pacman -S --needed --noconfirm bash-completion
    sudo pacman -S --needed --noconfirm wget
    sudo pacman -S --needed --noconfirm scons
    sudo pacman -S --needed --noconfirm alsa-utils
    sudo pacman -S --needed --noconfirm cmake automoc4
    sudo pacman -S --needed --noconfirm inotify-tools
    sudo pacman -S --needed --noconfirm incron
    sudo pacman -S --needed --noconfirm zip
    sudo pacman -S --needed --noconfirm truecrypt


== homesync & homebackup

    #sudo incrontab -e -u sowicm

#/home/sowicm/ IN_MODIFY,IN_ATTRIB,IN_CREATE,IN_DELETE,IN_CLOSE_WRITE,IN_MOVED_TO,IN_NO_LOOP /home/sowicm/app/homebackup
#/home/sowicm/myenc.sh IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebackup $@
#/home/sowicm/extpass IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebackup $@
#/home/sowicm/.bashrc IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebakcup $@
#/home/sowicm/.bash_profile IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebackup $@
#/home/sowicm/.bash_logout IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebackup $@
#/home/sowicm/.bash_history IN_MODIFY,IN_NO_LOOP /home/sowicm/app/homebakcup $@
#/home/sowicm/ IN_MODIFY,IN_CREATE,IN_DELETE,IN_MOVED_TO /home/sowicm/app/homesync $# $&

    #sudo crontab -e -u sowicm

#*/5 * * * * /home/sowicm/app/homebackup &

    sudo systemctl enable incronie
    sudo systemctl restart incronie

    /home/sowicm/app/homesync:
    inotifywait ...


    ##iptables -P INPUT DROP
    sudo iptables -A OUTPUT -p tcp --sport 80 -j DROP
    sudo iptables -A OUTPUT -p tcp --sport 8080 -j DROP
    sudo iptables -A OUTPUT -p tcp --sport 3306 -j DROP
    sudo iptables-save
    sudo pacman -S --needed --noconfirm php php-apache
    sudo mv /etc/http/conf /etc/httpd/conf.bak
    sudo ln -s /home/sowicm/s/_servers/localhost/conf /etc/httpd/conf
    sudo mv /etc/php/php.ini /etc/php/php.ini.bak
    sudo ln -s /home/sowicm/s/_servers/localhost/phpini/php.ini /etc/php/php.ini
    sudo chmod 644 /etc/php/php.ini
    sudo pacman -S rsync
    ## photoshop in linux
    sudo pacman -S gimp
    sudo pacman -S virtualbox
    sudo usermod -a -G vboxusers sowicm
    sudo pacman -S jre7-openjdk
    sudo pacman -S libreoffice
    yaourt downgrade
    sudo pacman -S wine
    #yaourt ies4linux
    sudo pacman -S wine-mono wine-gecko
    curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
    yaourt unarchiver
    #sudo pacman -S jdk7-openjdk
    yaourt jdk
    #yaourt ghdl
    sudo pacman -S geda-gaf
    sudo pacman -S wireless_tools
    sudo pacman -S unrar
    sudo pacman -S gimp-dbp
    yaourt owncloud-client
    sudo pacman -S lynx
    sudo pacman -S cairo-dock cairo-dock-plugins
    #sudo pacman -S stardict
    sudo pacman -S w3m
    sudo pacman -S python-distribute python-beautifulsoup4
    #yaourt python-html2text
    sudo pacman -S xlockmore
    sudo pacman -S docky
    sudo pacman -S networkmanager network-manager-applet xfce4-notifyd
    sudo pacman -S avant-window-navigator awn-extras-applets
    sudo pacman -S libxfcegui4 xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-datetime-plugin xfce4-dev-tools xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-netload-plugin xfce4-screenshooter xfce4-sensors-plugin xfce4-systemload-plugin xfce4-taskmanager xfce4-time-out-plugin xfce4-timer-plugin xfce4-wavelan-plugin xfce4-weather-plugin 

= wicd
    sudo pacman -S wicd-gtk
    sudo systemctl stop dhcpcd
    sudo systemctl disable dhcpcd
    sudo systemctl stop net-auto-wireless.service
    sudo systemctl disable net-auto-wireless.service
    sudo systemctl stop netctl-auto@wlp3s0.service
    sudo systemctl disable netctl-auto@wlp3s0.service
    sudo systemctl stop NetworkManager
    sudo systemctl disable NetworkManager
    sudo ip link set wlp3s0 down
    sudo ip link set enp0s25 down
    sudo systemctl enable wicd

    sudo pacman -S powertop
    #sudo pacman -S gnome-screensaver
    #sudo pacman -S xscreensaver
    
    sudo pacman -S conky
    sudo pacman -S screenlets screenlets-pack-basic

    sudo pacman -S thunderbird
    sudo pacman -S alltray

    sudo sensors-detect (all defaults)

    yaourt compiz
    #yaourt fusion-icon
    yaourt emerald-git

    sudo pacman -S fcitx-configtool

    sudo pacman -S wqy-bitmapfont wqy-microhei
    #yaourt freetype2-infinality
    #yaourt fontconfig-infinality

    yaourt keepass
    yaourt mono2
    yaourt navicat-premium
    
## music

    sudo pacman -S banshee
    sudo pacman -S osdlyrics
    sudo pacman -S mercurial
    #yaourt banshee-extension-doubanfm-hg
    sudo pacman -S xfce4-mpc-plugin
    sudo pacman -S mpd

    #yaourt perl-proc-daemon
    sudo pacman -S perl-json


    #yaourt pythonwebkit



    #yaourt infinality
    #yaourt fontconfig-infinality
    #yaourt ttf-win7-fonts

    sudo pacman -S python-sphinx python2-sphinx

    sudo pacman -S dhclient
    sudo pacman -S gksu

    sudo pacman -S slim slim-themes archlinux-themes-slim

    sudo pacman -S llvm

    sudo pacman -S blender

    #yaourt yofrankie
    
    sudo pacman -S supertux
    sudo pacman -S spring
    sudo pacman -S freeciv
    sudo pacman -S freedroidrpg
    #yaourt fretsonfire
    #yaourt psyco
    #yaourt fofix
    sudo pacman -S 0ad

    #yaourt libjpeg

    sudo pacman -S nvidia-lts opencl-nvidia
    sudo pacman -R ati-dri glamor-egl xf86-video-intel intel-dri
    sudo pacman -R xf86-video-nouveau nouveau-dri mesa-libgl
    sudo pacman -S nvidia
    #sudo pacman -S bumblebee

    #yaourt vegastrike

    #yaourt android-studio
    #yaourt android-udev  (use once, and pacman -R)
    yaourt android-udev     

     sudo pacman -S skype skype-call-recorder

     sudo pacman -S smplayer

     yaourt teamviewer
     
     sudo pacman -S gparted

     sudo pacman -S mtpfs
     yaourt go-mtpfs

     yaourt shutter

     sudo pacman -S dia
     yaourt openproj
     sudo pacman -S calligra-plan
     yaourt ganttproject
     #yaourt planner
     #yaourt taskjuggler

     sudo pacman -S busybox

     yaourt vmware-workstation

     yaourt bcompare

     sudo pacman -S inkscape

     sudo pacman -S vsftpd

     sudo pacman -S qt3
