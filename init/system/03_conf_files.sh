echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
cp -r Seer-EC2/etc/* /etc/

/etc/init.d/nginx restart
