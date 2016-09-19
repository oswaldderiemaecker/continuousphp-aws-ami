# Encoding: utf-8
name              "php7.0-apache2-fpm"
maintainer        "continuousphp"
maintainer_email  "oswald@continuousphp.com"
license           "Apache 2.0"
description       "Install/Configures php7.0 with apache2-fpm"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"

depends 'curl'
depends 'apt'
depends 'ntp'
depends 'vim'
depends 'screen'
depends 'ohai'
depends 'locale'
depends 'python'
depends 'apache2', '~> 3.0.0'
depends 'composer'
depends 'unattended-upgrades'
depends 'cloudwatch_monitoring'
depends 'aws-codedeploy-agent'

%w{ ubuntu debian }.each do |os|
  supports os
end
