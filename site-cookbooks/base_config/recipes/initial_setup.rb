node.default['apt']['unattended_upgrades']['enable'] = true
node.default['apt']['unattended_upgrades']['origins_patterns'] = ['origin=Ubuntu,archive=trusty-security']

include_recipe 'apt::default'
