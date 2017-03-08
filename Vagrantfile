# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false


 config.vm.define :centos_db do |db|
    db.vm.box = "centosparcial"
    db.vm.network :private_network, ip: "192.168.33.14"
    db.vm.network "public_network", bridge: "enp5s0" , ip: "192.168.131.225"
    db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "centos-db" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "db"
    end
  end


  config.vm.define :centos_web1 do |web1|
    web1.vm.box = "centosparcial"
    web1.vm.network :private_network, ip: "192.168.33.15"
    web1.vm.network "public_network", bridge: "enp5s0" , ip: "192.168.131.226"
    web1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "centos-web1" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "web1"
    end
  end


   config.vm.define :centos_web2 do |web2|
    web2.vm.box = "centosparcial"
    web2.vm.network :private_network, ip: "192.168.33.16"
    web2.vm.network "public_network", bridge: "enp5s0" , ip: "192.168.131.227"
    web2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "centos-web2" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "web2"
    end
  end
  

   config.vm.define :centos_balancer do |balancer|
    balancer.vm.box = "centosparcial"
    balancer.vm.network :private_network, ip: "192.168.33.17"
    balancer.vm.network "public_network", bridge: "enp5s0" , ip: "192.168.131.228"
    balancer.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "centos-balancer" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "balancer"
    end
  end

end
