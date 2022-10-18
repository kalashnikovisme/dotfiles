echo 'Upgrade apt'
sudo apt-get -y upgrade
echo 'apt-get update'
sudo apt-get update
echo 'Install make'
sudo apt-get install make
echo 'Install ansible'
make install_ansible
echo 'Set needed permissions for ansible'
sudo chown -R $USER ~/.ansible/
echo 'Install environment'
make install_environment && make update_vim && make update_bash

echo 'Add current user to docker group'
sudo usermod -a -G docker $USER

echo 'Change docker owner to current user'
sudo chown $USER:$USER /var/run/docker.sock

echo 'NOW, LOG OUT AND LOG BACK TO APPLY DOCKER CHANGES'
