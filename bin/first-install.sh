#!/usr/bin/env bash

##### DBUS SETUP
mkdir -p $XDG_DATA_HOME/dbus-1/services

echo '
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
' > $XDG_DATA_HOME/dbus-1/services/org.freedesktop.Notifications.service


