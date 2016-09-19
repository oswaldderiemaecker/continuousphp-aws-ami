# Encoding: utf-8

require 'serverspec'

set :backend, :exec

describe command('ps -ax | grep php-fpm') do
  its(:stdout) { should match /php-fpm: master process/ }
end
