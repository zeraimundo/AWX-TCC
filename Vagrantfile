Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.hostname = "awx-server"
  config.vm.network "public_network"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "AWX-Server"
    vb.memory = "8192"
    vb.cpus = "4"
  end
  config.vm.provision "shell", path: "provision.sh"
end
