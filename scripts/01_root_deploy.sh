#install new user, etc
# change root password
# adduser deploy
passwd
adduser deploy
echo "deploy ALL=(ALL) ALL" >> /etc/sudoers
echo "export PS1='\[\033[0;32m\]\h\[\033[0;36m\] \w\[\033[00m\]: '" >> /home/deploy/.bashrc
