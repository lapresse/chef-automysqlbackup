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
#
#

# download, untargz

# FIXME: missing : actual download/install of the thing. Need to look into NPM?
# Assume the tar.gz is untarred in /root/automysqlbackup :\

tmpdir = "/root/mysqlbackup"
tmpname = "#{tmpdir}/automysqlbackup.tar.gz"

directory tmpdir do
    mode "0700"
end
## FIXME broken
#execute "wget tarball" do
#    command "wget $URL -o $TMPNAME"
#    cwd tmpdir
#    creates tmpname
#    timeout 60
#    environment ({'URL' => node['automysqlbackup']['download_url'], 
#                 'TMPNAME' => tmpname
#    })
#    action :run
#end
#
#execute "untar" do
#    command "tar zxf automysqlbackup.tar.bz"
#    creates "#{tmpdir}/automysqlbackup"
#    cwd tmpdir
#end

execute "copystuff" do
    creates node['automysqlbackup']['bin_path']
    command "cp #{tmpdir}/automysqlbackup #{node['automysqlbackup']['bin_path']}"
end

# now, take care only about config:
confpath = node['automysqlbackup']['config_path']

directory confpath do
    action :create
end

directory node['automysqlbackup']['dump_path'] do
    owner "root"
    group "root"
    mode "0700"
    recursive true
    action :create
end


# Save default config
# copy from install stuff
execute "copy default config" do
    creates "#{confpath}/automysqlbackup.conf"
    command "cp #{tmpdir}/automysqlbackup.conf  #{confpath}/automysqlbackup.conf"
end
#
# Save OUR config
template "#{confpath}/myserver.conf" do
    source "myserver.conf.erb"
    mode "0600"
end


template "#{confpath}/run_mysql_backup" do
    source "run_mysql_backup.erb"
    mode "0755"
end


cron "run_mysql_backup" do
  hour   node['automysqlbackup']['time_hour']
  minute node['automysqlbackup']['time_minute']
  command "#{confpath}/run_mysql_backup"
end
