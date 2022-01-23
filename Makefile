install_environment:
	sudo ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	sudo ansible-galaxy install -p $(CURDIR)/roles geerlingguy.nodejs --ignore-errors
	ansible-playbook playbook.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook snap.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook install-docker.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook nodejs.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook audacity.yml -i local -vv -e curdir=$(CURDIR)
install_ansible:
	sudo apt-get install -y software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible
	ansible-galaxy collection install community.general
update_vim:
	ansible-playbook vim.yml -i local -vv -e curdir=$(CURDIR)
update_aliases:
	ansible-playbook tasks/alias.yml -i local -vv
update_bash:
	cp -f ./files/bashrc ~/.bashrc
