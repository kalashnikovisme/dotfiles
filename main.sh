sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install make
make install_ansible
sudo chown -R $USER ~/.ansible/
make install_environment
