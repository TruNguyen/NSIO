if [ `whoami` != root ]; then
	echo "ERROR:Not_root"
	exit 1
fi

if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 20.04"; then
	/usr/bin/apt update
	/usr/bin/apt -y install apache2-utils squid
	touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/TruNguyen/NSIO/main/linuxsqui.conf
    service squid restart
else
    echo "OS NOT SUPPORTED"
    exit 1;
fi

echo "Done"
