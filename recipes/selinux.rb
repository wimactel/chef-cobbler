#
# Cookbook Name:: cobbler
# Recipe:: selinux
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# This installs all the tools to manage selinux (for this recipe)
package 'policycoreutils-python'

include_recipe 'selinux'

## Everything below here it to install a poilcy allowing clobberd to manage
# tftp resources
cookbook_file '/tmp/cobblerd_tftp.te' do
  source 'cobblerd_tftp.te'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end

execute 'cobblerd tftp policy module' do
  command '/bin/checkmodule -M -m -o cobblerd_tftp.mod cobblerd_tftp.te'
  cwd '/tmp'
  creates '/tmp/cobblerd_tftp.mod'
  subscribes :run, 'cookbook_file[/tmp/cobblerd_tftp.te]', :immediately
end

execute 'cobblerd tftp policy compile' do
  command '/bin/semodule_package -o cobblerd_tftp.pp -m cobblerd_tftp.mod'
  cwd '/tmp'
  creates '/tmp/cobblerd_tftp.pp'
  subscribes :run, 'execute[cobblerd tftp policy module]', :immediately
end

execute 'cobblerd tftp policy install' do
  command '/sbin/semodule -i cobblerd_tftp.pp'
  cwd '/tmp'
  creates '/etc/selinux/targeted/modules/active/modules/cobblerd_tfp.pp'
  subscribes :run, 'execute[cobblerd tftp policy compile]', :immediately
end

