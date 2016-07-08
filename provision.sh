#!/bin/bash

RUBY_VERSION="2.3.1"

sudo apt-get -y update
sudo apt-get -y purge ruby # Remove the system ruby, it interfears with outs

# Get ruby-build
cd ~/
git clone https://github.com/sstephenson/ruby-build.git

# Install Ruby
~/ruby-build/bin/ruby-build ${RUBY_VERSION} ~/${RUBY_VERSION}

# Export Ruby to PATH, ensuring it's at the start so it doesn't get confused with the system default
echo 'export PATH="$HOME/2.3.1/bin:$PATH" # Add Ruby to path' >> ~/.bashrc

source ~/.bashrc # Reload the bashrc

# Install and update RubyGem
~/2.3.1/bin/gem update --system # Grab the latest, we're not fussy

# Install bundler if we don't already have it
if ! sudo gem list bundler -i > /dev/null; then
  sudo gem install bundler
fi
