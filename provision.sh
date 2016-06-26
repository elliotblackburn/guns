#!/bin/bash
RUBY_VERSION="2.3.1"

sudo apt-get -y update

if ! rvm list rubies ruby | grep ruby-${RUBY_VERSION}; then
  rvm install ${RUBY_VERSION}
fi

# for some reason this isn't working...
#rvm use ${RUBY_VERSION}

#gem install bundler
