def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['awesome_appliance_repair']['open_ports'] = 80

default['awesome_appliance_repair']['user'] = 'web_admin'
default['awesome_appliance_repair']['group'] = 'web_admin'
default['awesome_appliance_repair']['document_root'] = '/var/www/customers/public_html'

normal_unless['awesome_appliance_repair']['database']['root_password'] = "shfdglkjasfhglisr837jg43g"
normal_unless['awesome_appliance_repair']['database']['admin_password'] = random_password
default['awesome_appliance_repair']['database']['dbname'] = 'testdb'
default['awesome_appliance_repair']['database']['host'] = '127.0.0.1'
default['awesome_appliance_repair']['database']['root_username'] = 'root'