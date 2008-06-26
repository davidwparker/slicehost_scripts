#07_setup_mysql
cd ~
sudo mv slicehost_scripts/config/scr_my.cnf /etc/mysql/my.cnf
###sudo nano /etc/mysql/my.cnf
#edit the file and remove the # for the line skip-innodb
#in the area titled * fine tuning, change/add to:
#key_buffer              = 16K
#max_allowed_packet      = 1M
#thread_stack            = 64K
#thread_cache_size       = 4
#sort_buffer             = 64K
#net_buffer_length       = 2K
sudo /etc/init.d/mysql restart
