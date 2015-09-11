# All of these below are loaded into default['cobbler']['settings']
settings = {}

settings['allow_duplicate_hostnames'] = 0
settings['allow_duplicate_ips'] = 0
settings['allow_duplicate_macs'] = 0
settings['allow_dynamic_settings'] = 0
settings['anamon_enabled'] = 0

settings['authn_pam_service'] = 'login'
settings['auth_token_expiration'] = 3600
settings['build_reporting_enabled'] = 0
settings['build_reporting_sender'] = ''
settings['build_reporting_email'] = '[ "root@localhost" ]'
settings['build_reporting_smtp_server'] = 'localhost'
settings['build_reporting_subject'] = ''
settings['build_reporting_ignmorelist'] = '[ "" ]'

settings['createrepo_flags'] = '-c cache -s sha'
settings['default_kickstart'] = '/var/lib/cobbler/kickstarts/default.ks'

settings['default_name_servers'] = '[]'
# This password is crypted from 'cobbler', which you should change!
settings['default_password_crypted'] = '$1$mF86/UHC$WvcIcX2t6crBz2onWxyac.'

settings['default_template_type'] = 'cheetah'
settings['default_virt_bridge'] = 'virbr0'
settings['default_virt_file_size'] = 5
settings['default_virt_ram'] = 512
settings['default_virt_type'] = 'qemu'

settings['enable_gpxe'] = 0
settings['enable_menu'] = 1

settings['func_auto_setup'] = 0
settings['func_master'] = 'overlord.example.org'

settings['http_port'] = 80
settings['manage_dhcp'] = 0
settings['manage_dns'] = 0
settings['manage_tftpd'] = 1
settings['manage_rsync'] = 0

settings['next_server'] = node['ipaddress']
settings['pxe_just_once'] = 0
settings['pxe_template_dir'] = '/etc/cobbler/pxe'

settings['restart_dns'] = 1
settings['restart_dhcp'] = 1

settings['run_install_triggers'] = 1

settings['scm_track_enabled'] = 0
settings['scm_track_mode'] = 'git'

settings['server'] = node['ipaddress']
settings['client_use_localhost'] = 0
settings['client_use_https'] = 0
settings['snippetsdir'] = '/var/lib/cobbler/snippets'
settings['template_remote_kickstarts'] = 0

settings['webdir'] = '/var/www/cobbler'
settings['xmlrpc_port'] = 25151

settings['ldap_server'] = 'ldap.example.com'
settings['ldap_base_dn'] = 'DC=example,DC=com'
settings['ldap_port'] = 389
settings['ldap_tls'] = 1
settings['ldap_anonymous_bind'] = ''
settings['ldap_search_bind_dn'] = ''
settings['ldap_search_passwd'] = ''
settings['ldap_search_prefix'] = 'uid='
settings['ldap_tls_cacertfile'] = ''
settings['ldap_tls_keyfile'] = ''
settings['ldap_tls_certfile'] = ''


settings

settings['yum_post_install_mirror'] = 1
settings['yum_distro_priority'] = 1
settings['yumdownloader_flags'] = '--resolve'
settings['serializer_pretty_json'] = 0
settings['replicate_rsync_options'] = '-avzH'
settings['replicate_repo_rsync_options'] = '-avzH'

settings['always_write_dhcp_entries'] = 0
settings['proxy_url_ext'] = ''
settings['proxy_url_int'] = ''

default['cobbler']['settings'] = settings
