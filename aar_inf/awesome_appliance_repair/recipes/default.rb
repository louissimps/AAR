#
# Cookbook Name:: awesome_appliance_repair
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
apt_update 'Update the apt cache on a periodic basis (default 1 day)' do
  frequency 86_400
  action :periodic
end
package 'git'

log "Installing Git"



include_recipe 'awesome_appliance_repair::apache'
include_recipe 'awesome_appliance_repair::mysql'
include_recipe 'awesome_appliance_repair::unzip'



download_file = "https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip"

remote_file "/tmp/master.zip" do
  source download_file
  action :create_if_missing
  mode 00644
end

zipfile '/tmp/master.zip' do
  into '/tmp/master'
  only_if do ! File.exist?('/tmp/master') end
end

execute "copy_core" do
  command "mv -f /tmp/master/Awesome-Appliance-Repair-master/AAR /var/www"
  only_if do ! File.exist?('/var/www/AAR') end
  user "root"
end


# cookbook_file '/tmp/master/Awesome-Appliance-Repair-master' do
#   source 'mysql'
#   owner 'root'
#   group 'root'
#   mode '0755'
#   action :create
# end

cookbook_file '/tmp/master/Awesome-Appliance-Repair-master/AARinstall.py' do
  source 'AARinstall.py'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

filename = "AARinstall.py"
 
execute 'execute_file' do
 user "root"
 cwd '/tmp/master/Awesome-Appliance-Repair-master'
 command "python #{filename}"

end

execute 'apache_graceful' do
  user "root"
  command '/usr/sbin/apachectl graceful'
end
