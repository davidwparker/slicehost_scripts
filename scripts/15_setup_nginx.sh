#15_setup_nginx
cd ~
sudo mkdir /etc/nginx/vhosts
sudo mv slicehost_scripts/config/nginx.conf /etc/nginx/nginx.conf
sudo mv slicehost_scripts/config/main.conf /etc/nginx/vhosts/main.conf
sudo /etc/init.d/nginx stop
sudo /etc/init.d/nginx start
