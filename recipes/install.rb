# Cookbook Name:: cobbler
# Recipe:: install
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
case node.platform_family
when 'debian'
when 'rhel', 'fedora'
	include_recipe 'yum-epel'
end

node['cobbler']['packages'].each do |package_name|
  package package_name do
    action :install
  end
end

if node['cobbler']['web']['enable']
	node['cobbler']['web-packages'].each do |package_name|
	  package package_name do
	    action :install
	  end
	end
end
