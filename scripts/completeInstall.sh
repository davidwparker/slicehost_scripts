#01_root_deploy
# change root password
# adduser deploy
passwd
adduser deploy
echo "deploy ALL=(ALL) ALL" >> /etc/sudoers
echo "export PS1='\[\033[0;32m\]\h\[\033[0;36m\] \w\[\033[00m\]: '" >> /home/deploy/.bashrc

#02_copy_ssh
# copies ssh key
# copies sshd_config
# provide a copy of your public RSA key saved as id_rsa.pub and uncomment below
cd ~
sudo mkdir /home/deploy/.ssh
### sudo mv slicehost_scripts/config/id_rsa.pub /home/deploy/.ssh/authorized_keys
sudo chown -R deploy:deploy /home/deploy/.ssh
sudo chmod 700 /home/deploy/.ssh
sudo chmod 600 /home/deploy/.ssh/authorized_keys
sudo mv slicehost_scripts/config/sshd_config.txt /etc/ssh/sshd_config

#03_iptables
#iptables
cd ~
iptables-save > /etc/iptables.up.rules
mv slicehost_scripts/config/iptables.txt /etc/iptables.test.rules
iptables-restore < /etc/iptables.test.rules
iptables-save > /etc/iptables.up.rules
#nano /etc/network/interfaces
#add the following after iface lo inet loopback
#pre-up iptables-restore < /etc/iptables.up.restore
mv slicehost_scripts/config/interfaces.txt /etc/network/interfaces
/etc/init.d/ssh reload

#04_alias
#setup alias'
alias free="free -m"
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude safe-upgrade"
alias remove="sudo aptitude remove"

#05_install_defaults
#install defaults
sudo aptitude update
sudo locale-gen en_US.UTF-8
sudo /usr/sbin/update-locale LANG=en_US.UTF-8
sudo aptitude safe-upgrade -y
sudo aptitude full-upgrade -y
sudo aptitude install -y screen
sudo aptitude install -y build-essential
sudo aptitude install -y make

#06_mysql_install
#mysql install, this will prompt for a root password
sudo aptitude install -y mysql-server mysql-client libmysqlclient15-dev libmysql-ruby1.8

#07_setup_mysql
cd ~
sudo mv slicehost_scripts/config/mysql.cnf /etc/mysql/my.cnf
###sudo nano /etc/mysql/my.cnf
#copying the file over is similar to performing the following:
#
#edit the file and remove the # for the line skip-innodb
#in the area titled * fine tuning, change/add to:
#key_buffer              = 16K
#max_allowed_packet      = 1M
#thread_stack            = 64K
#thread_cache_size       = 4
#sort_buffer             = 64K
#net_buffer_length       = 2K
sudo /etc/init.d/mysql restart

#08_install_subversion
#this section will install subversion
###sudo aptitude install -y subversion

#09_create_repository
#create repository
###sudo rm -r /home/deploy/repository
###sudo mkdir /home/deploy/repository
#do NOT create the repository using sudo (owned by root)
###svnadmin create /home/deploy/repository
###sudo mkdir /home/deploy/repository

#10_setup_subversion
#setup subversion to work properly
#  since this is going to be a private machine, we aren't going to be using all of this...
#  instead, on the local machine, under ~/.subversion/config, add:
#  project1ssh = /usr/bin/ssh -p 9254 -l deploy
#  under the tunnels section
#sudo nano /home/deploy/repository/conf/svnserve.conf
#use these (or similar settings)
#password-db = /home/deploy/repository/conf/passwd
#anon-access = read
#auth-access = write
#realm = project
#
#modify this file for the authorized user(s)
#sudo nano /home/demo/repository/conf/passwd
#project = mypassword
#
#to start svnserve on startup of the box, add the following
###sudo crontab -e
#@reboot svnserve -d -r /home/demo/repository

#11_install_ruby_and_friends
#this section installs ruby, rubygems, rails, merb, mongrel, mongrel_cluster, imagemagick (not rmagick though)
cd ~
sudo aptitude install -y ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby
sudo ln -s /usr/bin/ruby1.8 /usr/local/bin/ruby
sudo ln -s /usr/bin/ri1.8 /usr/local/bin/ri
sudo ln -s /usr/bin/rdoc1.8 /usr/local/bin/rdoc
sudo ln -s /usr/bin/irb1.8 /usr/local/bin/irb
sudo ln -s /usr/bin/irb1.8 /usr/local/bin/irb
sudo mkdir ~/sources
cd ~/sources
wget https://rubyforge.org/frs/download.php/29548/rubygems-1.0.1.tgz  --no-check-certificate
tar xzvf rubygems-1.0.1.tgz
cd rubygems-1.0.1
sudo ruby setup.rb
sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
sudo gem update --system
sudo gem update
sudo gem install rails
sudo gem install merb
sudo gem install mongrel
sudo gem install mongrel_cluster
sudo aptitude install -y imagemagick xml-core

#12_setup_mongrel_cluster
#set up mongrel_cluster
cd ~
sudo cp /usr/lib/ruby/gems/1.8/gems/mongrel_cluster-1.0.5/resources/mongrel_cluster /etc/init.d/mongrel_cluster
sudo chmod +x /etc/init.d/mongrel_cluster
sudo /usr/sbin/update-rc.d mongrel_cluster defaults
sudo echo "PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local:/usr/local/sbin:/usr/local/bin" >> /etc/init.d/mongrel_cluster
sudo mkdir /etc/mongrel_cluster
sudo mkdir /var/www
sudo mkdir /var/www/apps
cd /var/www
sudo chown -R deploy:deploy *
sudo chown -R www-data:www-data *

#13_install_postfix
#install postfix
###sudo aptitude install -y postfix

#14_install_nginx
#install nginx
sudo aptitude install -y nginx

#15_setup_nginx
cd ~
sudo mkdir /etc/nginx/vhosts
sudo mv slicehost_scripts/config/nginx.conf /etc/nginx/nginx.conf
sudo mv slicehost_scripts/config/main.conf /etc/nginx/vhosts/main.conf
sudo /etc/init.d/nginx stop
sudo /etc/init.d/nginx start

#16_setup_default_site
cd ~
sudo mkdir /var/www/apps/public
sudo mkdir /var/www/apps/public/stylesheets
sudo mkdir /var/www/apps/public/javascripts
sudo mkdir /var/www/apps/public/images
sudo mkdir /var/www/apps/log
sudo mv slicehost_scripts/index.html /var/www/apps/public/index.html
sudo mv slicehost_scripts/404.html /var/www/apps/public/404.html
sudo mv slicehost_scripts/500.html /var/www/apps/public/500.html