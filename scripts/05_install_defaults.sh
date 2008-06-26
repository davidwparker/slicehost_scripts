#05_install_defaults
#install default
sudo aptitude update
sudo locale-gen en_US.UTF-8
sudo /usr/sbin/update-locale LANG=en_US.UTF-8
sudo aptitude safe-upgrade -y
sudo aptitude full-upgrade -y
sudo aptitude install -y screen
sudo aptitude install -y build-essential
sudo aptitude install -y make