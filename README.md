# Devbox
This is mostly just for my personal needs, but could be used as a starting point for anybody who needs a Vagrant-based dev setup.  Please feel free to make suggestions or fork as a starting place for your own.

## Prereqs
Vagrant, VirtualBox

## Installation

Run `vagrant up`, and you get nodenv + nodenv 4.2.1, pyenv + python 2.7.11, `tox`, and `awscli`.  Change the versions directly in `install.sh` as you wish.  By default, the VM takes up 2 cores and 2 gigs of RAM.

For anything you would like to place in your home directory (such as `.ssh` or `.aws` config directories), put your folders in `local_creds`, which will be copied over on install.
