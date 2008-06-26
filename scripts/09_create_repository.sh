#09_create_repository
#create repository
sudo mkdir /home/deploy/repository
#do NOT create the repository using sudo (owned by root)
svnadmin create /home/deploy/repository
sudo mkdir /home/deploy/repository