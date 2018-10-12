# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "archlinux/archlinux"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argumentis;
  # the path on the host to the actual fosetfont Lat2-Terminus16;
  
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./data", "/root/vagrant_arch"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    vb.cpus = 4
    vb.memory = "4096" # Customize the amount of memory on the VM:
    vb.customize ["modifyvm", :id, "--vram", "256"]
  end
  #
  # View the documentation for the provider you 
  # are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  config.vm.provision "shell", inline: <<-SHELL
    timedatectl set-ntp true
    loadkeys jp106
    setfont Lat2-Terminus16
    sed -i "s/^LANG.*/LANG=ja_JP.UTF-8/" /etc/locale.conf
    sed -i "s/^SigLevel.*$/SigLevel = Optional TrustAll/" /etc/pacman.conf 
    pacman-key --init
    pacman -Syu
    pacman -S --noconfirm wget curl emacs git openssl

    pacman -S --noconfirm --needed base-devel git

    cd /root
    git clone https://github.com/TOKUJI/vagrant_arch.git

    pacman -S --noconfirm xorg-server xorg-xinit xorg-xclock xterm xorg-xdm xdm-archlinux awesome otf-ipafont
    cp /root/vagrant_arch/data/00-keyboard.conf /etc/X11/xorg.conf.d/
    systemctl enable xdm-archlinux.service

    pacman -R --noconfirm virtualbox-guest-utils-nox
    pacman -S --noconfirm virtualbox-guest-utils
    modprobe -a vboxguest vboxsf vboxvideo

    pacman -S --noconfirm python xonsh tilda
    stty erase ^H

    sed -i "s/#ja/ja/g" /etc/locale.gen
    locale-gen

    pacman -S fcitx-im fcitx-configtool fcitx-mozc fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5

    pacman -S --noconfirm alsa-utils pulseaudio

    cp /root/vagrant_arch/data/.xsession /home/vagrant/
    chmod 700 /home/vagrant/.xsession
    cp /root/vagrant_arch/data/.xonshrc /home/vagrant/
    cp /root/vagrant_arch/data/.asoundrc /home/vagrant/
    mkdir -p /home/vagrant/.config/awesome
    cp /root/vagrant_arch/data/rc.lua /home/vagrant/.config/awesome/
    chown -R vagrant /home/vagrant/
    chgrp -R vagrant /home/vagrant/

  SHELL
end
    # pikaur -S ttf-myrica
    # fcitx-autostart
    # VBoxClient-all

    # su vagrant
    # echo "my name is"
    # whoami
    # cd ~
    # git clone https://aur.archlinux.org/pikaur.git
    # cd pikaur
    # makepkg -fsri
    # pikaur -S ttf-myrica --noconfirm
    # su
