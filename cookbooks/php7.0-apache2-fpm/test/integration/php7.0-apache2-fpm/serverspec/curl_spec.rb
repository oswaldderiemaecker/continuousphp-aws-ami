# Encoding: utf-8
require 'serverspec'
require 'fileutils'

set :backend, :exec

describe command('curl --version') do
  its(:stdout) { should match /curl 7/ }
end
