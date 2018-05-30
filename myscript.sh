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
sudo mysql -u root mysql --execute="CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
sudo mysql -u root mysql --execute="GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%' IDENTIFIED BY 'admin';"
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

#install compser and drush
echo "instaling drush"
sudo apt-get curl
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"'  >>  .bashrc
source ~/.bashrc
composer global require drush/drush:8.*
composer global update

echo "instaling php CodeSniffer , Drupal and DrupalPractice"

composer global require "squizlabs/php_codesniffer=2.7.0"
composer global require drupal/coder:^8.2.12
sudo ln -s ~/.config/composer/vendor/drupal/coder/coder_sniffer/Drupal ~/.config/composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/Drupal
sudo ln -s ~/.config/composer/vendor/drupal/coder/coder_sniffer/DrupalPractice ~/.config/composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/DrupalPractice


echo "Installing Less "
sudo apt-get install npm
sudo npm install -g less
sudo apt install node-less

echo "instaling compass and saas"
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.3.1
rvm use 2.3.1 --default
ruby -v
sudo gem install compass
sudo gem install sass
sudo apt-get update

echo "Thank you using Nishant script any suggestion ping me on nishantkumar155@gmail.com"
