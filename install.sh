echo 'Installing essentials from apt-get...'
sudo apt-get update
sudo apt-get install -y build-essential \
  linux-headers-$(uname -r) \
  git \
  curl \
  zlib1g-dev \
  libreadline6-dev \
  libbz2-dev \
  libsqlite3-dev \
  libssl-dev \
  linux-image-extra-$(uname -r) \
  linux-image-extra-virtual \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# install Docker stuff
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker vagrant

# install pyenv
echo 'Installing pyenv...'
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'export PYENV_VERSION=2.7.11' >> ~/.bashrc
echo 'export PYTHONPATH=/vagrant/code/' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo 'Installing python modules...'
~/.pyenv/bin/pyenv install 2.7.11
~/.pyenv/bin/pyenv global 2.7.11
~/.pyenv/shims/pip install tox awscli virtualenv flask --upgrade

echo 'Installing nodenv...'
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc

git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

~/.nodenv/bin/nodenv install 6.10.3
~/.nodenv/bin/nodenv global 6.10.3

echo 'Installing Yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

echo 'Copying local config directories...'
mkdir ~/.ssh
cp -rf /vagrant/local_creds/.ssh ~/
cp -rf /vagrant/local_creds/.aws ~/

echo "Done"
