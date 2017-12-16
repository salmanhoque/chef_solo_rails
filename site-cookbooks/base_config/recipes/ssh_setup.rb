service 'ssh' do
  action :enable
end

cookbook_file '/etc/ssh/sshd_config' do
  source 'sshd_config'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :reload, 'service[ssh]', :delayed
end
