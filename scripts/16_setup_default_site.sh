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
