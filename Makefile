install_environment:
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
	ansible-playbook communication/slack.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook communication/discord.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook content/spotify.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook style/fonts.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook package_managers/appimages.yml -i local -vv
	ansible-playbook languages/ruby.yml -i local -vv
	ansible-playbook languages/rust.yml -i local -vv
	ansible-playbook devtools/heroku.yml -i local -vv
	ansible-playbook package_managers/app_image_launcher.yml -i local -vv
	ansible-playbook devtools/httpie.yml -i local -vv
	ansible-playbook other/settings.yml -i local -vv
	mkdir ~/projects/
	ansible-playbook sec/vpn.yml -i local -vv
	ansible-galaxy collection install community.crypto
	ansible-playbook sec/ssh.yml -i local -vv
	ansible-playbook devices/bluetooth.yml -i local -vv
	ansible-playbook devices/lefthook.yml -i local -vv
	./sec/1password_cli.sh
install_ansible_ubuntu:
        sudo apt install -y software-properties-common
        sudo apt install -y ansible
        ansible-galaxy collection install community.general

install_ansible_arch:
        sudo pacman -Syu --noconfirm ansible
        ansible-galaxy collection install community.general
update_neovim:
	ansible-playbook devtools/neovim.yml -i local -vv
update_bash:
	cp -f files/bashrc ~/.bashrc
	ansible-playbook tasks/alias.yml -i local -vv
