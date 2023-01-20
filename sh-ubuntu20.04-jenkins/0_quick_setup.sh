#!/bin/bash

mysql_root_password=password
user_name=user
user_password=password

sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 $user_password) $user_name || true & 
wait  
usermod -aG sudo $user_name || true & 
wait


mkdir /home/$user_name/.ssh || true & 
wait
cp /root/.ssh/authorized_keys /home/$user_name/.ssh/authorized_keys || true & 
wait
chown -R $user_name:$user_name /home/$user_name/.ssh || true & 
wait
chmod 0700 /home/$user_name/.ssh || true & 
wait
chmod 0600 /home/$user_name/.ssh/authorized_keys || true & 
wait

apt install -y software-properties-common || true & 
wait
add-apt-repository ppa:ondrej/php  || true & 
wait
apt update  || true & 
wait

apt install -y php8.0 php8.0-fpm php8.0-cli php8.0-common php8.0-mysql php8.0-zip php8.0-gd php8.0-mbstring php8.0-curl php8.0-xml php8.0-bcmath libapache2-mod-php8.0 || true & 
wait
apt install -y mysql-server || true & 
wait
systemctl start mysql.service || true & 
wait
 
mysql --login-path=local  -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '$mysql_root_password';" &
wait

mysql --login-path=local  -e "ALTER USER 'root'@'localhost' IDENTIFIED by '$mysql_root_password';"  &
wait
mysql --login-path=local  -e "DELETE FROM mysql.user WHERE User='';"  &
wait
mysql --login-path=local  -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"  &
wait
mysql --login-path=local  -e "DROP DATABASE IF EXISTS test;"  &
wait
mysql --login-path=local  -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"  &
wait
mysql --login-path=local  -e "FLUSH PRIVILEGES;"  &
wait
