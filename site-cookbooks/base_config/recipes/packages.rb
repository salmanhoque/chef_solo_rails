apt_repository 'ruby' do
  uri 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution 'trusty'
  components ['main']
  key '80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6'
end

apt_repository 'nodejs' do
  uri 'https://deb.nodesource.com/node_8.x'
  distribution node[:lsb][:codename]
  components ['main']
  key 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key'
  notifies :upgrade, 'package[nodejs]', :immediately
end

apt_repository 'yarn' do
  uri 'http://dl.yarnpkg.com/debian'
  distribution 'stable'
  components ['main']
  key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
end

packages = %w{
  apt
  build-essential
  curl
  fail2ban
  git
  htop
  screen
  sysstat
  unzip
  vim
  tmux
  zip
  wget
  software-properties-common
  openssl

  apt-utils
  binutils
  binutils-doc
  dpkg
  dpkg-dev
  less
  rsyslog
  tar
  tcpdump
  zlib1g
  zlib1g-dev

  ruby2.3
  ruby2.3-dev
  yarn
}

packages.each do |app|
  package app do
    action :install
  end
end

package 'nodejs' do
  action :upgrade
end

gem_package 'bundler'
