# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  (3000..9000).each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    ./install.sh
    ssh-keygen -t rsa -C nessa.murmur@gmail.com -N ""
  SHELL
end
