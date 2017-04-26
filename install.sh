echo "Installing essentials from apt-get"
sudo apt-get update && sudo apt-get install -y build-essential git curl \
zlib1g-dev libreadline6-dev libbz2-dev libsqlite3-dev libssl-dev

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'export PYENV_VERSION=2.7.11' >> ~/.bashrc
source ~/.bashrc

pyenv install 2.7.11
pyenv global 2.7.11

# install nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"'
git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
source ~/.bashrc

nodenv install 4.2.1
nodenv global 4.2.1

echo "Done"
