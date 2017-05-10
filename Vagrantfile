# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "code/", "/vagrant/code"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /vagrant
    ./install.sh
  SHELL
end
