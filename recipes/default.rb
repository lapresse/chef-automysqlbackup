#
# Cookbook Name:: automysqlbackup
# Recipe:: default
#
# Copyright 2012, La Presse
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

# This refers to data bags created by the identities cookbook:
# https://github.com/failshell/chef-identities
user = Chef::EncryptedDataBagItem.load( 'users_vault', node[:automysqlbackup][:user] )

# package requirement
package 'pigz' do
end

# Unpack and install software
cookbook_file "/var/tmp/#{node[:automysqlbackup][:tarball]}" do
end

directory "/usr/share/automysqlbackup" do
end

execute "untar-automysqlbackup" do
  cwd "/var/tmp"
  command "tar zxf #{node[:automysqlbackup][:tarball]} -C /usr/share/automysqlbackup"
  creates "/usr/share/automysqlbackup/automysqlbackup"
end

# Symlink script and cfg file
link '/usr/sbin/automysqlbackup' do
  to '/usr/share/automysqlbackup/automysqlbackup'
end

directory '/etc/automysqlbackup' do
end

template '/etc/automysqlbackup/automysqlbackup.conf' do
  variables( :user_pass => user['password_cleartext'] )
  mode 0400
end

cron "run_mysql_backup" do
  hour   node['automysqlbackup']['cron_hour']
  minute node['automysqlbackup']['cron_minute']
  command "/usr/sbin/automysqlbackup && chown -R dbadmin. /data/mysql/backup"
end
