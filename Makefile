install_environment:
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook browser/google-chrome.yml -i local -vv -e curdir=$(CURDIR); \
	fi
	ansible-galaxy install -p $(CURDIR)/roles azavea.postgresql --ignore-errors
	ansible-galaxy install -p $(CURDIR)/roles geerlingguy.nodejs --ignore-errors
	ansible-playbook devtools/git.yml -i local -vv
	ansible-playbook other/playbook.yml -i local -vv -e curdir=$(CURDIR)
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook package_managers/snap.yml -i local -vvv -e curdir=$(CURDIR); \
	fi
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook devtools/docker.yml -i local -vv -e curdir=$(CURDIR); \
	fi
	ansible-playbook languages/nodejs.yml -i local -vv -e curdir=$(CURDIR)
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook content/audacity.yml -i local -vv -e curdir=$(CURDIR); \
	fi
	ansible-playbook content/obs.yml -i local -vv -e curdir=$(CURDIR)
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook communication/slack.yml -i local -vv -e curdir=$(CURDIR); \
		ansible-playbook communication/discord.yml -i local -vv -e curdir=$(CURDIR); \
		ansible-playbook content/spotify.yml -i local -vv -e curdir=$(CURDIR); \
	fi
	ansible-playbook style/fonts.yml -i local -vv -e curdir=$(CURDIR)
	ansible-playbook devtools/alacritty.yml -i local -vv
	ansible-playbook package_managers/appimages.yml -i local -vv
	ansible-playbook languages/ruby.yml -i local -vv
	ansible-playbook languages/rust.yml -i local -vv
	if [ "$(OS)" = "ubuntu" ]; then \
		ansible-playbook devtools/heroku.yml -i local -vv; \
	fi
	ansible-playbook package_managers/app_image_launcher.yml -i local -vv
	ansible-playbook other/settings.yml -i local -vv
	mkdir -p ~/projects/
	ansible-playbook sec/vpn.yml -i local -vv
	ansible-playbook devtools/lefthook.yml -i local -vv
	if [ "$(OS)" = "omarchy" ]; then \
		ansible-playbook devices/monitor.yml -i local -vv; \
		ansible-playbook devices/keyboard.yml -i local -vv; \
	fi
install_ansible_ubuntu:
	sudo apt install -y software-properties-common
	sudo apt install -y ansible
	ansible-galaxy collection install community.general
install_ansible_omarchy:
	sudo pacman -Syu --noconfirm ansible
	ansible-galaxy collection install community.general
update_neovim:
	ansible-playbook devtools/neovim.yml -i local -vv
update_bash:
	cp -f files/bashrc ~/.bashrc
	ansible-playbook tasks/alias.yml -i local -vv
aquarium:
	ansible-playbook devices/bluetooth.yml -i local -vv
