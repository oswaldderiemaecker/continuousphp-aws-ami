# Encoding: utf-8

require 'serverspec'

set :backend, :exec

describe file('/etc/apache2/sites-enabled/app.conf') do
  its(:content) { should match /ServerName localhost/ }
  its(:content) { should match /DocumentRoot \/var\/www\/public/ }
  its(:content) { should match /Header always set Access-Control-Allow-Origin \"*\"/ }
  its(:content) { should match /Header always set Access-Control-Allow-Methods \"POST, GET, OPTIONS, DELETE, PUT, PATCH\"/ }
  its(:content) { should match /Header always set Access-Control-Allow-Headers \"Authorization, Accept, Content-Type\"/ }
  its(:content) { should match /AllowEncodedSlashes On/ }
  its(:content) { should match /SetEnvIf Authorization \"\(.*\)\" HTTP_AUTHORIZATION=\$1/ }
  its(:content) { should match /ProxyPassMatch \^\/\(.*\.php\(\/.*\)\?\)\$ fcgi:\/\/127.0.0.1:9000\/var\/www\/public\/\$1/ }
end

describe file('/etc/apache2/mods-available/deflate.conf') do
  its(:content) { should match /AddOutputFilterByType DEFLATE application\/hal\+json/}
end

describe service('apache2') do
  it { should be_running }
end
