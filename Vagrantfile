# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    ./install.sh
    ssh-keygen -t rsa -C nessa.murmur@gmail.com -N ""
  SHELL
end
