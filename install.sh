echo "Installing some stuff..."
sudo apt-get update && sudo apt-get install -y build-essential emacs zsh git curl
chsh -s /bin/zsh

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
for rcfile in ~/.zprezto/runcoms/*; do ln -s "$rcfile" "~/.${rcfile}"; done; rm ~/.README.md

# These dotfiles
ssh-keygen -N "" -t rsa -C nessa.murmur@gmail.com

# Emacs Prelude
curl -L http://git.io/epre | sh

echo "(setq mode-require-final-newline nil)" >> ~/.emacs.d/personal/whitespace.el
echo "(add-hook 'before-save-hook 'delete-trailing-whitespace)" >> ~/.emacs.d/personal/whitespace.el
echo "Done"
