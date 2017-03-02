echo "Installing some stuff..."
sudo apt-get update && sudo apt-get install -y build-essential emacs zsh git curl
chsh -s /bin/zsh

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
for rcfile in ~/.zprezto/runcoms/*; do ln -s "$rcfile" "~/.${rcfile}"; done; rm ~/.README.md

# These dotfiles
ssh-keygen -N "" -t rsa -C nessa.murmur@gmail.com
cat ~/.ssh/id_rsa.pub
read
git clone git@github.com:levionessa/dotfiles.git
cd ~/dotfiles

# Emacs Prelude
curl -L http://git.io/epre | sh

echo "Copying Files"
cp zsh/.zshrc ~
cp zsh/.zpreztorc ~
cp zsh/.aliases ~
cp zsh/.exports ~
cp git/.gitconfig ~
cp git/.gitignore ~
mkdir -p ~/.lein
echo "(setq mode-require-final-newline nil)" >> ~/.emacs.d/personal/whitespace.el
echo "(add-hook 'before-save-hook 'delete-trailing-whitespace)" >> ~/.emacs.d/personal/whitespace.el
echo "Done"
