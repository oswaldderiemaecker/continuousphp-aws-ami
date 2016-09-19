# Encoding: utf-8
require 'serverspec'

set :backend, :exec

describe command('aws') do
   its(:stderr) { should match /aws: error: too few arguments/ }
end
