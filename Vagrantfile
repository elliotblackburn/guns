Vagrant.configure(2) do |config|
  config.vm.box = "thdengops/ubuntu-14.04-dev"
  config.vm.hostname = "twitter-guns-dev"

  config.vm.provision "shell", privileged: false, path: "provision.sh"
end
