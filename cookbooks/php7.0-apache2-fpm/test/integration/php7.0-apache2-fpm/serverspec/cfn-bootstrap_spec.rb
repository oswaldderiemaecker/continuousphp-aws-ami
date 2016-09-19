# Encoding: utf-8                                                                                                                                                                                                                             

require 'serverspec'

set :backend, :exec

describe command('/usr/local/bin/cfn-init --help') do
  its(:stdout) { should match /Usage: cfn-init/ }
end

