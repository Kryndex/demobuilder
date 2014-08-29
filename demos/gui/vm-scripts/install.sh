#!/bin/bash

. vm-functions

register_channels rhel-x86_64-server-6
update
install_packages evince firefox gdm gnome-panel gnome-session gnome-terminal man nautilus tigervnc-server urw-fonts xorg-x11-xinit

useradd demo
echo redhat | passwd --stdin demo
echo 'demo ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
passwd -l root

sed -i -e 's/id:3:initdefault:/id:5:initdefault:/' /etc/inittab

# su - demo -c 'mkdir ~/.vnc; echo redhat | vncpasswd -f >~/.vnc/passwd; chmod 0600 ~/.vnc/passwd'
# echo "su demo -c 'vncserver :0'" >>/etc/rc.local
# lokkit -p 5900:tcp

cleanup
poweroff