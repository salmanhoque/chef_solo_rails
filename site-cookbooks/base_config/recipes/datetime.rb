node.default['ntp']['servers'] = [
  '0.au.pool.ntp.org',
  '1.au.pool.ntp.org',
  '2.au.pool.ntp.org',
  '3.au.pool.ntp.org'
]
node.default['ntp']['restrictions'] = [
  '127.0.0.1',
  '::1'
]

execute 'configure-timezone' do
  command "timedatectl set-timezone 'Australia/Melbourne'"
  not_if "timedatectl | grep 'Timezone: Australia/Melbourne'"
end

include_recipe 'ntp::default'
