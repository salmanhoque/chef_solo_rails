# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network 'private_network', ip: '10.0.0.10'
  config.vm.provision 'file', source: '/Users/sal/.ssh/vagrant.pub', destination: '~/.ssh/authorized_keys'
  config.vm.provision :shell, inline: <<-SHELL
    apt-get update
    apt install -y ntp
		service ntp start
	SHELL
end
