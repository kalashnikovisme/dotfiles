install_environment:
	sudo ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	sudo ansible-galaxy install -p $(CURDIR)/roles rvm_io.rvm1-ruby --ignore-errors
	ansible-playbook playbook.yml -i local -vv -e curdir=$(CURDIR)
install_ansible:
	sudo apt-get install python-pip
	echo | sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible -y
update_vim:
	sudo ansible-playbook update_vim.yml -i local -vv -e curdir=$(CURDIR)
