node.default['postgresql']['version'] = '9.3'
node.default['postgresql']['config']['listen_addresses'] = 'localhost'
node.default['postgresql']['password']['postgres'] = 'password'

include_recipe 'postgresql::client'
include_recipe 'postgresql::server'

postgres_comand = 'sudo -u postgres -H -- psql'

execute 'Create aws_code user' do
  command "#{postgres_comand} -c \"CREATE USER aws_code WITH CREATEDB PASSWORD \'password\'\""
  only_if { `#{postgres_comand} -tAc "SELECT 1 FROM pg_roles WHERE rolname='aws_code'"`.chomp.empty? }
  action :run
end

execute 'Create aws_code_production database' do
  command "#{postgres_comand} -c \"CREATE DATABASE aws_code_production\""
  only_if { `#{postgres_comand} -tAc "SELECT 1 FROM pg_database WHERE datname='aws_code_production'"`.chomp.empty? }
  action :run
end
