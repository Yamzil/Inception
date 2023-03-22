#!/bin/bash

useradd ${FTP_USERNAME}
mkdir -p /home/${FTP_USERNAME}
echo "${FTP_USERNAME}:${FTP_PASSWORD}" | chpasswd
chown ${FTP_USERNAME}:${FTP_USERNAME} /home/${FTP_USERNAME}

if [ -d "/etc/vsftpd" ]
then
    rm -rf "/etc/vsftpd"
fi
mkdir -p /var/run/vsftpd/empty
echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40010" >> /etc/vsftpd.conf

vsftpd
