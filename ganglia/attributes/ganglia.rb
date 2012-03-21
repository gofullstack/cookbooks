# Workaround for not having the newest version in packages
if node.recipes.include?('ganglia::source')
  default['ganglia']['version'] = '3.3.1'
  default[:ganglia][:uri] = "http://sourceforge.net/projects/ganglia/files/ganglia%20monitoring%20core/3.3.1/ganglia-3.3.1.tar.gz/download"
  default[:ganglia][:checksum] = '93b46f84e554def5efc5c05ad61e9a1c'
else
  default['ganglia']['version'] = '3.2.0'
  default[:ganglia][:uri] = "http://sourceforge.net/projects/ganglia/files/ganglia%20monitoring%20core/3.2.0/ganglia-3.2.0.tar.gz/download"
  default[:ganglia][:checksum] = '4fbc028ab6a9b085703a9cff8e0d26c0'
end

default['ganglia']['location'] = 'unspecified'
default[:ganglia][:network_interface] = 'eth0'
default['ganglia']['cluster_name'] = 'default'
default['ganglia']['multicast'] = true
default['ganglia']['receiver'] = false
default['ganglia']['receiver_network_interface'] = 'eth1'
default['ganglia']['send_to_graphite'] = false
default['ganglia']['graphite_prefix'] = 'ganglia'

default[:ganglia][:web][:version] = '4.0.0'
default[:ganglia][:web][:graph_engine] = 'rrdtool'
default[:ganglia][:web][:auth_system] = 'readonly'
default[:ganglia][:web][:path] = '/opt/ganglia-web'
