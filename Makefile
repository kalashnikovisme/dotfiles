install_environment:
	sudo ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	sudo ansible-galaxy install -p $(CURDIR)/roles geerlingguy.nodejs --ignore-errors
	ansible-playbook git.yml -i local -vv
	ansible-playbook playbook.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook snap.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook install-docker.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook nodejs.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook audacity.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook obs.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook kubernetes.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook slack.yml -i local -vv -e curdir=$(CURDIR)
	sudo ansible-playbook fonts.yml -i local -vv -e curdir=$(CURDIR)
install_ansible:
	sudo apt install -y software-properties-common
	sudo apt install ansible
	ansible-galaxy collection install community.general
update_vim:
	ansible-playbook vim.yml -i local -vv -e curdir=$(CURDIR)
update_bash:
	cp -f ./files/bashrc ~/.bashrc
	ansible-playbook tasks/alias.yml -i local -vv
