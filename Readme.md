# [@kalashnikovisme](github.com/kalashnikovisme) environment installation

Just run

### From current repo checkout (for testing current branch)

```
./main.sh ubuntu
```

or

```
./main.sh omarchy
```

### Ubuntu

```
sudo apt-get install unzip && wget -O main.zip https://github.com/kalashnikovisme/dotfiles/archive/refs/heads/main.zip && unzip main.zip -d dotfiles && cd dotfiles/dotfiles-main && ./main.sh ubuntu && cd ~ && sudo rm -rf main.zip dotfiles
```

### Omarchy

```
sudo pacman -Sy --noconfirm unzip wget && wget -O main.zip https://github.com/kalashnikovisme/dotfiles/archive/refs/heads/main.zip && unzip main.zip -d dotfiles && cd dotfiles/dotfiles-main && ./main.sh omarchy && cd ~ && sudo rm -rf main.zip dotfiles
```

## What is it?

It's script to setup my own configuration for Ubuntu or Omarchy

It installs Ansible and use Ansible playbook to install other applications

## Files

* [vimrc](https://github.com/kalashnikovisme/dotfiles/blob/master/files/vimrc)
* [gitconfig](https://github.com/kalashnikovisme/dotfiles/blob/master/files/.gitconfig)
* [bashrc](https://github.com/kalashnikovisme/dotfiles/blob/master/files/bashrc)
* [bashrc_omarchy](https://github.com/kalashnikovisme/dotfiles/blob/master/files/bashrc_omarchy)
* [gitignore](https://github.com/kalashnikovisme/dotfiles/blob/master/files/gitignore)

## Actions

### Applications

*Items with asterix are also configurated as I like :)*

1. Ansible*
2. Make
3. PostgreSQL*
4. htop
5. git*
6. curl
7. SQLite
8. Bison
9. Aptitude
10. Vim*
11. Unetbootin
12. GParted
13. Arduino
14. ffmpeg
15. docker*
16. docker-compose*
17. rvm*
18. GIMP
19. Ubuntu Tweaks
20. Google Chrome (Ubuntu only)
21. Rocket.Chat Desktop
22. pyenv
23. cmake
24. Rust
25. Telegram
26. 1Password and 1Password CLI

### Configurations

* bashrc / bashrc_omarchy
* dpkg
