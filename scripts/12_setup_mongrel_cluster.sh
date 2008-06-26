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
