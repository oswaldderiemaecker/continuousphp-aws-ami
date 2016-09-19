#!/usr/bin/ruby -w

case node['platform']
when 'ubuntu'
  case node['platform_version']
    when '14.04'
      apt_repository 'php' do
        uri 'http://ppa.launchpad.net/ondrej/php/ubuntu'
        distribution node['lsb']['codename']
        components ['main']
        keyserver 'keyserver.ubuntu.com'
        key 'E5267A6C'
    end
  end
end


%w(php7.0-fpm php7.0-xml php7.0-mysql php-redis php7.0-curl php-memcached php7.0-intl mailutils).each do |pkg|
  package pkg do
    action :install
  end
end

template 'php-fpm-pool-conf' do
  path "/etc/php/7.0/fpm/pool.d/www.conf"
  source 'php-fpm-pool-conf.erb'
  owner 'root'
  group 'root'
  mode 00644
end

bash "php-config" do
  user "root"
  cwd "/etc/php/7.0/fpm"
  code <<-EOT
    sed -i -e 's/;session.cookie_secure =/session.cookie_secure = 1/g' /etc/php/7.0/fpm/php.ini
    sed -i -e 's/session.cookie_lifetime = 0/session.cookie_lifetime = 960/g' /etc/php/7.0/fpm/php.ini 
    sed -i -e 's/;opcache.enable=0/opcache.enable=1/g' /etc/php/7.0/fpm/php.ini 
    sed -i -e 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=86400/g' /etc/php/7.0/fpm/php.ini 
    sed -i -e 's/;opcache.max_accelerated_files=2000/opcache.max_accelerated_files=30000/g' /etc/php/7.0/fpm/php.ini 
    sed -i -e 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php/7.0/fpm/php.ini
  EOT
end

bash "php-timezone" do
  user "root"
  cwd "/etc/php/7.0/fpm"
  code <<-EOT
    sed -i -e 's/;date.timezone =/date.timezone = Europe\\/Luxembourg/g' /etc/php/7.0/fpm/php.ini
  EOT
end

service 'php7.0-fpm' do
  provider Chef::Provider::Service::Init
  action [:start]
end
