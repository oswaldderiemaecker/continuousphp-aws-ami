# Encoding: utf-8
if node['php7.0-apache2-fpm']['kitchen'] == false
  execute 'clean-up-ami' do
    command 'shred -u /etc/ssh/*_key /etc/ssh/*_key.pub'
  end
end
