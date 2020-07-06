# Lucio's Dotfiles
##### (Inspired by https://github.com/nachovizzo/dotfiles/)

### Prerequisites
To run this, you need to have git installed and configured:

```sh
sudo apt update
sudo apt upgrade
sudo apt install git
git config --global user.name <YOUR NAME>
git config --global user.email <YOUR EMAIL@EXAMPLE.COM>
```

### Init the dotfile repository into your home directory

```sh
git init
git remote add origin https://github.com/lucionardelli/dotfiles.git
git fetch
git reset origin/master --hard
git branch --set-upstream-to=origin/master master
git pull
source ~/.bashrc
```

### Install all packages(optional)

```sh
cd ~
sudo bash .setup_computer.sh
```

### GNOME Extensions

Install some gnome extensions : https://linuxconfig.org/top-10-best-gnome-extensions-for-ubuntu-20-04-desktop

* system monitor
* clipboard indicator
* extensions
* force quit
* screenshot tool
* todo.txt
* ubuntu app indicator


### TODO
 - Add images?
 - Create AdPlan specific config
 - TEST IT!
 
