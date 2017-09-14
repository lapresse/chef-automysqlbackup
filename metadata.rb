maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache-2.0'
description 'installs/configures automysqlbackup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/ffuenf/chef-automysqlbackup/issues'
source_url 'https://github.com/ffuenf/chef-automysqlbackup'
name 'automysqlbackup'
chef_version '>= 12.5' if respond_to?(:chef_version)
version '2.0.2'

%w(debian ubuntu).each do |os|
  supports os
end

%w(mysql).each do |ressource|
  depends ressource
end
