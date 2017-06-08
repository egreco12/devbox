# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 3000
    v.cpus = 2
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "code/", "/vagrant/code"
  config.vm.network :forwarded_port, guest: 3009, host: 3009, id: "webpack_port"
  config.vm.network :forwarded_port, guest: 3000, host: 3000, id: "public_port"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /vagrant
    ./install.sh
  SHELL
end
