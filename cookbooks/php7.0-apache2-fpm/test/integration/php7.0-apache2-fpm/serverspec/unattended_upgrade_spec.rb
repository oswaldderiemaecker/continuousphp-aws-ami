# Encoding: utf-8

require 'serverspec'

set :backend, :exec

describe command('unattended-upgrade') do
  its(:exit_status) { should eq 0 }
end
