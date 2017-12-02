group 'dev' do
  action :create
end

file '/etc/sudoers.d/10dev_users' do
  content '%dev ALL=(ALL) NOPASSWD:ALL'
  owner 'root'
  group 'root'
  mode '0500'
  action :create
end

node[:user][:dev_users].each do |dev|
  user_name = dev['name']
  user_home = "/home/#{user_name}"

  user user_name do
    comment dev['full_name']
    home user_home
    shell '/bin/bash'
    manage_home true
    action :create
  end

  group "add '#{user_name}' to dev group" do
    append true
    group_name 'dev'
    members user_name
  end

  directory "#{user_home}/.ssh" do
    owner user_name
    group user_name
    mode 0700
  end

  cookbook_file "#{user_home}/.ssh/authorized_keys" do
    source "#{user_name}.pub"
    owner user_name
    group user_name
    mode 0700
    action :create
  end
end
