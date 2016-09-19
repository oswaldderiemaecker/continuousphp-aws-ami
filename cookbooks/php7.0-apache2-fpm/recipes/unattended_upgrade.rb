# Encoding: utf-8
execute 'running unattended-upgrade' do
  command 'unattended-upgrade'
  action :run
end
