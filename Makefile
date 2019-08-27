install_environment:
	sudo ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	ansible-playbook pre_playbook.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook playbook.yml -i local -vv -e curdir=$(CURDIR)
install_ansible:
	sudo apt-get install software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible
update_vim:
	sudo ansible-playbook update_vim.yml -i local -vv -e curdir=$(CURDIR)
update_aliases:
	ansible-playbook tasks/alias.yml -i local -vv
