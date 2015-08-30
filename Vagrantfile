require 'vagrant-vbguest'

$script = <<SCRIPT
  echo I am provisioning...
  date > /etc/vagrant_provisioned_at
  yum -y install                   \
    xorg-x11-utils                 \
    xorg-x11-xauth                 \
    xorg-x11-apps                  \
    libcap                         \
    libstdc++                      \
    libstdc++.i686                 \
    libstdc++.x86_64               \
    libstdc++-devel.i686           \
    libstdc++-devel.x86_64         \
    compat-libstdc++-33.i686       \
    compat-libstdc++-33.x86_64     \
    libgcc.i686                    \
    libgcc.x86_64                  \
    libaio-devel.x86_64            \
    libaio.x86_64                  \
    compat-libcap1.x86_64
  
  yum -y update
  
  cp /vagrant/hosts /etc/hosts
  
  su - vagrant -c /vagrant/scripts/1.sh
  
  su - vagrant -c /vagrant/scripts/oudinstance.sh
  
SCRIPT

Vagrant.configure(2) do |config|
  
  config.vm.define "oud1" , primary: true do |oud1|
    oud1.vm.box = "OEL6_7"
    oud1.vm.hostname = "oud1.oracleateam.com"
    oud1.vm.network "private_network", ip: "10.11.12.201"
    oud1.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    oud1.vm.synced_folder "software", "/media/software"
    
    # VBox settings
    oud1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "2000"]
      vb.customize ["modifyvm"     , :id, "--name"  , "oud1"]
    end
    
    oud1.vm.provision "shell", inline: $script
  end

  config.vm.define "oud2" , primary: true do |oud2|
    oud2.vm.box = "OEL6_7"
    oud2.vm.hostname = "oud2.oracleateam.com"
    oud2.vm.network "private_network", ip: "10.11.12.202"
    oud2.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    oud2.vm.synced_folder "software", "/media/software"
    
    # VBox settings
    oud2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "2000"]
      vb.customize ["modifyvm"     , :id, "--name"  , "oud2"]
    end

    oud2.vm.provision "shell", inline: $script
  end

  config.vm.define "oud3" , primary: true do |oud3|
    oud3.vm.box = "OEL6_7"
    oud3.vm.hostname = "oud3.oracleateam.com"
    oud3.vm.network "private_network", ip: "10.11.12.203"
    oud3.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    oud3.vm.synced_folder "software", "/media/software"
    
    # VBox settings
    oud3.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "2000"]
      vb.customize ["modifyvm"     , :id, "--name"  , "oud3"]
    end

    oud3.vm.provision "shell", inline: $script    
  end

end
