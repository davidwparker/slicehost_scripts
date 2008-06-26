#10_setup_subversion
#setup subversion to work properly
# since this is going to be a private machine, we aren't going to be using all of this...
# instead, on the local machine, under ~/.subversion/config, add:
# project1ssh = /usr/bin/ssh -p 9254 -l deploy
# under the tunnels section
###sudo mv /config/svnserve.conf /home/deploy/repository/conf/svnserve.conf
###sudo mv /config/passwd.conf /home/deploy/repository/conf/passwd
#sudo nano /home/deploy/repository/conf/svnserve.conf
#use these (or similar settings)
#password-db = /home/deploy/repository/conf/passwd
#anon-access = read
#auth-access = write
#realm = Project1
#
#modify this file for the authorized user(s)
#sudo nano /home/demo/repository/conf/passwd
#project1admin = mypassword
#
#to start svnserve on startup of the box, add the following
###sudo crontab -e
#@reboot svnserve -d -r /home/demo/repository