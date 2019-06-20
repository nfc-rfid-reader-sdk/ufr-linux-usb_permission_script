#!/bin/bash
if [ "$(id -u)" = "0" ]; then
    rm "/etc/modprobe.d/ftdi.conf"
    touch "/etc/modprobe.d/ftdi.conf"
    echo "blacklist ftdi_sio" >> "/etc/modprobe.d/ftdi.conf"
    echo "blacklist usbserial" >> "/etc/modprobe.d/ftdi.conf"
    echo "-------------------------------------------------------------------------"
    echo "Added \"ftdi_conf\" blacklist file to /etc/modprobe.d/ "
    echo "-------------------------------------------------------------------------"
    GROUPADD="usb_access"
    groupadd $GROUPADD
    echo -n "Enter an existing user  :"
        read ADDUSER
    adduser $ADDUSER  $GROUPADD
    exit 1
else
     echo "You Need To Be Root!"
fi

exec sudo "$0" "$@" # enters root mode, resets script and adds permissions and ftdi.confssss
exit 1