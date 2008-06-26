#11_install_ruby_and_friends
#this section installs ruby, rubygems, rails, merb, mongrel, mongrel_cluster, and imagemagick (not rmagick though)
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
