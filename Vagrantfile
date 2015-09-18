# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "opscode/centos-7.1"

  config.vm.hostname = "cobbler.cyberlab.lan"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network", bridge: "en1: Thunderbolt Ethernet",
    auto_config: false

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true

    vb.name = "cobbler.cyberlab.lan"

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Enable the Berkshelf plugin for managing recipes
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|

    chef.json = {
      cobbler: {
        packages: [
          'epel-release',
          'syslinux',
          'cobbler',
          'pykickstart',
          'dhcp'
        ],
        web: {
          authentication_module: 'testing'
        },
        dhcp_network: {
          'network' => '192.168.1.0',
          'netmask' => '255.255.255.0',
          'routers' => '192.168.1.1',
          'name_servers' => '192.168.1.1',
          'range' => '192.168.1.100 192.168.1.200'
        },
        settings: {
          # CYBERlab1234!@#$
          default_password_crypted: '$1$4ex5X.cx$RbKj.k9NUqh2Ta/3FmVi..',
          server: '192.168.1.5',
          next_server: '192.168.1.5',
          manage_dhcp: 1
        }
      }
    }

    chef.run_list = [
        "recipe[cobbler::default]"
    ]
  end
end
