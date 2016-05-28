name             'zoneminder'
maintainer       'Matt Ray'
maintainer_email 'matt@chef.io'
license          'Apache 2.0'
description      'Installs zoneminder security camera software'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
supports         'ubuntu'
supports         'debian'
source_url       'https://github.com/mattray/zoneminder-cookbook' if respond_to?(:source_url)
issues_url       'https://github.com/mattray/zoneminder-cookbook/issues' if respond_to?(:issues_url)
