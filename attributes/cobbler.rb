case node['platform_family']
when "rhel", "fedora"
  default['cobbler']['packages'] = %w{cobbler}
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

#this address is used by clients to find the cobbler server
default['cobbler']['address'] = node['ipaddress']

# cobbler has various sample kickstart templates stored
# in /var/lib/cobbler/kickstarts/.  This controls
# what install (root) password is set up for those
# systems that reference this variable.  The factory
# default is "cobbler" and cobbler check will warn if
# this is not changed.
default['cobbler']['default_password_crypted'] = ""

# configure all installed systems to use these nameservers by default
# unless defined differently in the profile.  For DHCP configurations
# you probably do /not/ want to supply this.
default['cobbler']['default_name_servers'] = "[]"

# notifications settings:
# Email out a report when cobbler finishes installing a system.
# enabled: set to 1 to turn this feature on
# sender: optional
# email: which addresses to email [ '1@example.com', '2@example.com' ]
# smtp_server: used to specify another server for an MTA
# subject: use the default subject unless overridden

default['cobbler']['build_reporting']['enabled'] = 0

if node['cobbler']['build_reporting']['enabled']
	default['cobbler']['build_reporting']['sender'] = ""
	default['cobbler']['build_reporting']['email'] = "[]"
	default['cobbler']['build_reporting']['smtp_server'] = ""
	default['cobbler']['build_reporting']['subject'] = ""
end

# if no kickstart is specified to profile add, use this template
default['cobbler']['default_kickstart'] = "/var/lib/cobbler/kickstarts/ubuntu-server.preseed"


# configuration options if using the authn_ldap module. See the
# the Wiki for details.  This can be ignored if you are not using
# LDAP for WebUI/XMLRPC authentication.

default['cobbler']['web']['enable'] = true

if node['cobbler']['web']['enable']
	
	# change this port if Apache is not running plaintext on port
	# 80.  Most people can leave this alone.
	default['cobbler']['web']['http_port'] = 80

	# authentication: 
	# what users can log into the WebUI and Read-Write XMLRPC?
	# choices:
	#    authn_denyall    -- no one (default)
	#    authn_configfile -- use /etc/cobbler/users.digest (for basic setups)
	#    authn_passthru   -- ask Apache to handle it (used for kerberos)
	#    authn_ldap       -- authenticate against LDAP
	#    authn_spacewalk  -- ask Spacewalk/Satellite (experimental)
	#    authn_pam        -- use PAM facilities
	#    authn_testing    -- username/password is always testing/testing (debug)
	#    (user supplied)  -- you may write your own module
	# WARNING: this is a security setting, do not choose an option blindly.
	# for more information:
	# https://github.com/cobbler/cobbler/wiki/Cobbler-web-interface
	# https://github.com/cobbler/cobbler/wiki/Security-overview
	# https://github.com/cobbler/cobbler/wiki/Kerberos
	# https://github.com/cobbler/cobbler/wiki/Ldap
	default['cobbler']['web']['authentiation_module'] = 'authn_denyall'

	# authorization: 
	# once a user has been cleared by the WebUI/XMLRPC, what can they do?
	# choices:
	#    authz_allowall   -- full access for all authneticated users (default)
	#    authz_ownership  -- use users.conf, but add object ownership semantics
	#    (user supplied)  -- you may write your own module
	# WARNING: this is a security setting, do not choose an option blindly.
	# If you want to further restrict cobbler with ACLs for various groups,
	# pick authz_ownership.  authz_allowall does not support ACLs.  configfile
	# does but does not support object ownership which is useful as an additional
	# layer of control.

	# for more information:
	# https://github.com/cobbler/cobbler/wiki/Cobbler-web-interface
	# https://github.com/cobbler/cobbler/wiki/Security-overview
	# https://github.com/cobbler/cobbler/wiki/Web-authorization
	default['cobbler']['web']['authentiation_module'] = 'authz_allowall'

	default['cobbler']['ldap']['enable'] = false

	# ldap_server: "ldap.example.com"
	# ldap_base_dn: "DC=example,DC=com"
	# ldap_port: 389
	# ldap_tls: 1
	# ldap_anonymous_bind: 1
	# ldap_search_bind_dn: ''
	# ldap_search_passwd: ''
	# ldap_search_prefix: 'uid='
	if node['cobbler']['ldap']['enable']
		default['cobbler']['ldap']['server'] = "ldap.example.com"
		default['cobbler']['ldap']['base_dn'] = "DC=example,DC=com"
		default['cobbler']['ldap']['port'] = 389
		default['cobbler']['ldap']['tls'] = 1
		default['cobbler']['ldap']['anonymous_bind'] = 1
		default['cobbler']['ldap']['search_bind_dn'] = ''
		default['cobbler']['ldap']['search_passwd'] = ''
		default['cobbler']['ldap']['search_prefix'] = 'uid='
	end

end
