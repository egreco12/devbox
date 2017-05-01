echo 'Installing essentials from apt-get...'
sudo apt-get update && sudo apt-get install -y build-essential git curl \
zlib1g-dev libreadline6-dev libbz2-dev libsqlite3-dev libssl-dev

# install pyenv
echo 'Installing pyenv...'
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'export PYENV_VERSION=2.7.11' >> ~/.bashrc
echo 'export PYTHONPATH=/vagrant/src/' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo 'Installing python modules...'
~/.pyenv/bin/pyenv install 2.7.11
~/.pyenv/bin/pyenv global 2.7.11
~/.pyenv/shims/pip install tox awscli --upgrade

echo 'Installing nodenv...'
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

~/.nodenv/bin/nodenv install 4.2.1
~/.nodenv/bin/nodenv global 4.2.1

echo 'Copying local config directories...'
mkdir ~/.ssh
cp -rf /vagrant/local_creds/.* ~/

echo "Done"
