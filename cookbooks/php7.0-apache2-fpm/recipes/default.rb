# Encoding: utf-8
include_recipe 'apt'

execute 'ntp-search' do
  command 'apt-get update ; apt-cache search ntp'
end

include_recipe 'curl'
include_recipe 'git'
include_recipe 'ntp'
include_recipe 'vim'
include_recipe 'screen'
include_recipe 'ohai'
include_recipe 'locale'
include_recipe 'aws-codedeploy-agent'
include_recipe 'unattended-upgrades'

include_recipe 'php7.0-apache2-fpm::curl'
include_recipe 'php7.0-apache2-fpm::apache'
include_recipe 'php7.0-apache2-fpm::php'
include_recipe 'php7.0-apache2-fpm::rsyslog_gnutls'
include_recipe 'php7.0-apache2-fpm::cfn-bootstrap'
include_recipe 'php7.0-apache2-fpm::unattended_upgrade'
include_recipe 'php7.0-apache2-fpm::clean-up-ami'
