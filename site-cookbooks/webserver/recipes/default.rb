node.default['nginx']['user'] = 'www-data'

include_recipe 'nginx::default'

user 'aws_code' do
  comment 'Deploys and runs app'
  home '/home/aws_code'
  shell '/bin/bash'
  manage_home true
  action :create
end

group 'add aws_code to www-data' do
  append true
  group_name 'www-data'
  members 'aws_code'
  action :create
end

cookbook_file '/home/aws_code/environment.sh' do
  source 'environment.sh'
  owner 'aws_code'
  mode 0755
end

file '/home/aws_code/.bash_profile' do
  content <<-EOF
    . $HOME/environment.sh
    . $HOME/.profile
  EOF
  owner 'aws_code'
  group 'www-data'
end

directory '/srv/app' do
  owner 'aws_code'
  group 'www-data'
  mode '2755'
  recursive true
end

directory '/srv/app-3' do
  owner 'aws_code'
  group 'www-data'
  mode '2755'
  recursive true
end

cookbook_file '/etc/nginx/sites-available/default' do
  source 'default'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]', :immediately
  action :create
end
