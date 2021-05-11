echo 'Upgrade apt'
sudo apt-get -y upgrade
echo 'Add repository'
sudo add-apt-repository -y ppa:gezakovacs/ppa
echo 'apt-get update'
sudo apt-get update
echo 'Install make'
sudo apt-get install make
echo 'Install ansible'
make install_ansible
echo 'Set needed permissions for ansible'
sudo chown -R $USER ~/.ansible/
echo 'Install environment'
make install_environment
echo 'Configurate VIM'
make update_vim
echo 'Configurate aliases'
make update_aliases
