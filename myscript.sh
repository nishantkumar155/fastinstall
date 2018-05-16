#!/bin/bash
sudo apt-get update
echo "Installing Apache"
#sudo apt-get install apache2 -y
sudo systemctl restart apache2
echo "Restarting Apache"
echo "installing  curl"
#sudo apt-get install curl -y
echo "installing mysql-server"
sudo apt-get install mysql-server -y
sudo mysqladmin password admin

#=============================
#temp
#sudo mysql -u root mysql
#============================

echo "Creating user:- admin with password:- admin"
sudo mysql -u root mysql --execute="CREATE USER 'admin1'@'%' IDENTIFIED BY 'admin';"
sudo mysql -u root mysql --execute="GRANT ALL PRIVILEGES ON * . * TO 'admin1@%' IDENTIFIED BY 'admin';" 
sudo mysql -u root mysql --execute="FLUSH PRIVILEGES;"
sudo add-apt-repository ppa:ondrej/php
echo -ne '\n' 
sudo apt-get update
sudo service apache2 stop
sudo apt-get install php7.1 php7.1-common -y
sudo apt-get install php7.1-curl php7.1-xml php7.1-zip php7.1-gd php7.1-mysql php7.1-mbstring -y
sudo service apache2 start

echo "<IfModule mod_dir.c>
	DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
" >|/etc/apache2/mods-enabled/dir.conf

#sudo nano /etc/apache2/mods-enabled/dir.conf

echo "Restarting apache"
sudo systemctl restart apache2
echo "installing git"
sudo apt install git -y
echo "installing pv"
sudo apt install pv -y
echo "installing axel"
sudo apt install  axel -y
echo "instaling Phpstrom"
sudo snap install phpstorm --classic
echo "updating system"
sudo apt-get update
echo "Thank you using Nishant script any suggestion ping me on nishantkumar155@gmail.com"
