# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "default-debian-75.vagrantup.com"
  config.vm.box = "hybris-pl-en-US-debian-7.5.0-wheezy-amd64"
  config.vm.box_url = "http://vagrantimages.yrdci.fra.hybris.com/hybris-pl-en-US-debian-7.5.0-wheezy-amd64.box"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8090, host: 8090

  config.berkshelf.enabled = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.verbose_logging = true

    chef.run_list = [
      "recipe[devops_jenkins::master]",
      "recipe[devops_jenkins::git]",
      "recipe[devops_jenkins::tomcat7]"
    ]
  end

end
