#
# Cookbook Name:: cobbler
# Recipe:: configure
#
# Copyright 2008-2010, WiMacTel, Inc.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


template '/etc/cobbler/settings' do
	mode '0644'
	source 'cobbler/settings.erb'
	variables ({ :settings => node['cobbler']['settings'] })
	notifies :restart, 'service[cobblerd]', :delayed
end

template '/etc/cobbler/dhcp.template' do
  mode '0644'
  variables ({ :subnet => node['cobbler']['dhcp_network'] })
  source 'cobbler/dhcp_template.erb'
  notifies :restart, 'service[cobblerd]', :delayed
end

template '/etc/cobbler/modules.conf' do
	mode '0644'
	source 'cobbler/modules.erb'
	notifies :restart, 'service[cobblerd]', :delayed
end

template '/etc/xinetd.d/tftp' do
  mode '0644'
  source 'xinetd_tftp.erb'
  notifies :restart, 'service[xinetd]', :delayed
end

if node['cobbler']['ldap']['enable']
	puts ldap
	# TODO: https://fedorahosted.org/cobbler/wiki/CobblerWithLdap
end
