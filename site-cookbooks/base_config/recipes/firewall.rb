execute 'allow ssh' do
  command 'ufw allow ssh'
  not_if 'ufw status | grep 22'
  action :run
end

execute 'allow http' do
  command 'ufw allow http'
  not_if 'ufw status | grep 80'
  action :run
end

execute 'allow https' do
  command 'ufw allow https'
  not_if 'ufw status | grep 443'
  action :run
end

execute 'enable ufw' do
  command 'yes | sudo ufw enable'
  only_if 'ufw status | grep inactive'
  action :run
end
