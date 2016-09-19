require 'serverspec'

set :backend, :exec

describe service('ntp') do
  it { should be_enabled }
end
