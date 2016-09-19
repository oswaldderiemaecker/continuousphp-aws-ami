# Encoding: utf-8
include_recipe 'apt'
include_recipe 'ohai'


case node['platform']
when 'ubuntu'
  case node['platform_version']
    when '16.04'
      package 'curl'
    when '14.04'
      apt_repository 'ettercap-stable-backports' do
        uri 'http://ppa.launchpad.net/costamagnagianfranco/ettercap-stable-backports/ubuntu'
        distribution node['lsb']['codename']
        components ['main']
        deb_src true
        keyserver "keyserver.ubuntu.com"
        key "1BCB19E03C2A1859"
      end
      package 'curl' do
        version '7.36.0-2ubuntu1~ubuntu'+node['platform_version']+'.1~ppa1'
    end
  end
end
