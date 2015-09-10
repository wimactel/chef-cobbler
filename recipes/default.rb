#
# Cookbook Name:: cobbler
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'cobbler::install'
include_recipe 'cobbler::configure'
include_recipe 'cobbler::service'
include_recipe 'cobbler::selinux'
