#02_copy_ssh
# copies ssh key
# copies sshd_config
# provide a copy of your public RSA key saved as id_rsa.pub and uncomment below
cd ~
sudo mkdir /home/deploy/.ssh
### sudo mv slicehost_scripts/config/id_rsa.pub /home/deploy/.ssh/authorized_keys
sudo chown -R deploy:deploy /home/deploy/.ssh/
sudo chmod 700 /home/deploy/.ssh/
sudo chmod 600 /home/deploy/.ssh/authorized_keys
sudo mv slicehost_scripts/config/sshd_config.txt /etc/ssh/sshd_config
