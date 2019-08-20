sudo apt-get update
sudo apt-get install make
make install_ansible
sudo chown -R $USER ~/.ansible/tmp
make install_environment
