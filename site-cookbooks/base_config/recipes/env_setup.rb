cookbook_file '/etc/profile.d/00-aliases.sh' do
  source '00-aliases.sh'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/etc/tmux.conf' do
  source 'tmux.conf'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/etc/vim/vimrc.local' do
  source 'vimrc.local'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
