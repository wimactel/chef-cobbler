name             'cobbler'
maintainer       'Andrew Preece'
maintainer_email 'apreece@wimactel.com'
license          'All rights reserved'
description      'Installs/Configures cobbler'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'selinux'
depends 'yum-epel'
