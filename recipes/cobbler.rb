#
# Cookbook Name:: cobbler
# Recipe:: cobbler
#
# Copyright 2008-2010, WiMacTel, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if not node['cobbler']['packages']
	Chef::Log.error("Can't install Cobbler, if I don't know what the packages are!")	
  return
end

# we need EPEL if this is RHEL
if node["platform_family"] == "rhel"
  include_recipe "yum::epel" if node["platform_version"].to_i <= 5
end

node['cobbler']['packages'].each do |package_name|
  package package_name do
    action :install
  end
end

# TODO: this should probably be a seperate recipie, but I don't know how to modify config files from two places.
if node['cobbler']['web']['enable']
	include_recipe "apache2"
	include_recipe "apache2::mod_proxy"
	include_recipe "apache2::mod_rewrite"
	node['cobbler']['web-packages'].each do |package_name|
	  package package_name do
	    action :install
	  end
	end
end

template "/etc/cobbler/settings" do
	mode "0644"
	source "settings.erb"
	notifies :restart, "service[cobblerd]", :delayed
end

template "/etc/cobbler/modules.conf" do
	mode "0644"
	source "modules.erb"
	notifies :restart, "service[cobblerd]", :delayed
end

if node['cobbler']['ldap']['enable']
	puts ldap
	# TODO: https://fedorahosted.org/cobbler/wiki/CobblerWithLdap
end

service "cobblerd" do
    action [ :enable, :start ]
end

execute "cobbler sync" do
	command "sleep 5; cobbler sync"
	action :nothing
end
