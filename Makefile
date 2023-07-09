install_environment:
	ansible-playbook browser/sidekick.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook browser/google-chrome.yml -i local -vv -e curdir=$(CURDIR)
	ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	ansible-galaxy install -p $(CURDIR)/roles geerlingguy.nodejs --ignore-errors
	ansible-playbook devtools/git.yml -i local -vv
	ansible-playbook other/playbook.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook package_managers/snap.yml -i local -vvv -e curdir=$(CURDIR)
	ansible-playbook devtools/docker.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook languages/nodejs.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook content/audacity.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook content/obs.yml -i local -vv -e curdir=$(CURDIR)
	# sudo ansible-playbook devtools/kubernetes.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook communication/slack.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook communication/discord.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook communication/spotify.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook style/fonts.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook package_managers/appimages.yml -i local -vv
	ansible-playbook languages/ruby.yml -i local -vv
	ansible-playbook communication/telegram.yml -i local -vv
	ansible-playbook languages/rust.yml -i local -vv
	ansible-playbook devtools/heroku.yml -i local -vv
	ansible-playbook package_managers/app_image_launcher.yml -i local -vv
	ansible-playbook devtools/httpie.yml -i local -vv
	ansible-playbook other/settings.yml -i local -vv
	mkdir ~/projects/
	ansible-playbook sec/vpn.yml -i local -vv
install_ansible:
	sudo apt install -y software-properties-common
	sudo apt install -y ansible
	ansible-galaxy collection install community.general
update_vim:
	ansible-playbook devtools/vim.yml -i local -vv -e curdir=$(CURDIR)
update_bash:
	cp -f files/bashrc ~/.bashrc
	ansible-playbook tasks/alias.yml -i local -vv
