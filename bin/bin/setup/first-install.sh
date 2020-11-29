#!/usr/bin/env bash

##### DBUS SETUP
mkdir -p $XDG_DATA_HOME/dbus-1/services

echo '
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
' | sudo tee $XDG_DATA_HOME/dbus-1/services/org.freedesktop.Notifications.service


### Phone automount
echo "jmtpfs /home/westofer/Phone fuse nodev,allow_other,rw,user,noauto,noatime,uid=1000,gid=1000    0    0" |
	sudo tee -a /etc/fstab 

mkdir -p ~/Phone ~/GDrive
