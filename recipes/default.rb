#
# Author::  Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
# Cookbook Name:: automysqlbackup
# Recipe:: default
#
# Copyright 2013, Achim Rosenhagen
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

script "install automysqlbackup" do
	interpreter "bash"
	user "root"
	cwd Chef::Config[:file_cache_path]
	code <<-EOH
	wget #{node['automysqlbackup']['download_url']}
	mkdir automysqlbackup
	cd automysqlbackup
	tar -zxf ../automysqlbackup*.tar.gz
	cp -pR automysqlbackup.conf #{node['automysqlbackup']['config_path']}/automysqlbackup.conf
	cp -pR automysqlbackup #{node['automysqlbackup']['bin_path']}
	EOH
end

directory node['automysqlbackup']['config_path'] do
	action :create
end

directory node['automysqlbackup']['backup_dir'] do
	owner "root"
	group "root"
	mode "0700"
	recursive true
	action :create
end

template "#{node['automysqlbackup']['config_path']}/#{node['automysqlbackup']['config']}.conf" do
	source "myserver.conf.erb"
	mode "0600"
	variables({
		:automysqlbackup => node['automysqlbackup']
	})
end

template "#{node['automysqlbackup']['config_path']}/run_mysql_backup" do
	source "run_mysql_backup.erb"
	mode "0755"
end

cron "run_mysql_backup" do
	hour node['automysqlbackup']['cron']['time_hour']
	minute node['automysqlbackup']['cron']['time_minute']
	command "#{node['automysqlbackup']['config_path']}/run_mysql_backup"
end