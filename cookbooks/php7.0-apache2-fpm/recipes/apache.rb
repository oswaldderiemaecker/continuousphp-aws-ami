#!/usr/bin/ruby -w                                                                                                                             

web_app "app" do
  server_name node.default['apache2']['hostname'] 
  docroot "/var/www/public" 
  allow_override 'All'
  directory_options '-Indexes +FollowSymLinks +MultiViews'
end

execute 'enable-proxy_fcgi' do
  command 'a2enmod proxy_fcgi'
end

directory '/var/www/public' do
  action :create
  recursive true
  owner 'www-data'
  group 'www-data'
end

cookbook_file '/etc/apache2/mods-available/deflate.conf' do
  action :create
  source 'apache2/deflate.conf'
  mode 0644
  notifies :restart, 'service[apache2]', :delayed
end
