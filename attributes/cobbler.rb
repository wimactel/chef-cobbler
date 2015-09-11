case node['platform_family']
when "rhel", "fedora"
  default['cobbler']['packages'] = %w{cobbler syslinux dhcp}
	default['cobbler']['web-packages'] = %w{cobbler-web}
when "debian"
	#TODO: put install packages here
	#don't install anything.
  default['cobbler']['packages'] = %w{}
	default['cobbler']['web-packages'] = %w{cobbler-web}
else
	#don't install anything.
  default['cobbler']['packages'] = %w{}
	default['cobbler']['web-packages'] = %w{cobbler-web}
end

default['cobbler']['web']['enable'] = true
default['cobbler']['web']['authentication_module'] = 'authn_denyall'
default['cobbler']['web']['authorization_module'] = 'authz_allowall'

# Not yet implemented
default['cobbler']['ldap']['enable'] = false

########## DHCP Template ###############3
default['cobbler']['dhcp_network'] = {
  'network' => '192.168.1.0',
  'netmask' => '255.255.255.0',
  'routers' => '192.168.1.1',
  'name_servers' => '192.168.1.1',
  'range' => '192.168.1.100 192.168.1.200'
}

########## SELinux Policies ##############
default['selinux']['state'] = 'enforcing'
cobblerd_selinux_bools = {
  'cobbler_can_network_connect' => true,
  'httpd_can_network_connect_cobbler' => true,
  'httpd_serve_cobbler_files' => true,
  'httpd_can_network_connect' => true
}
normal['selinux']['booleans'].merge!( cobblerd_selinux_bools )
