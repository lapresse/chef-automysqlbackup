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

directory node['automysqlbackup']['bin_path'] do
	action :create
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

src_filename = "automysqlbackup-v#{node['automysqlbackup']['version']}.tar.gz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/automysqlbackup/#{node['automysqlbackup']['checksum']}"

remote_file src_filepath do
	source node['automysqlbackup']['download_url']
	checksum node['automysqlbackup']['checksum']
	owner 'root'
	group 'root'
	mode 00644
end

bash 'extract automysqlbackup' do
	cwd ::File.dirname(src_filepath)
	code <<-EOH
		mkdir -p #{extract_path}
		tar xzf #{src_filename} -C #{extract_path}
		cp -pR #{extract_path}/automysqlbackup.conf #{node['automysqlbackup']['config_path']}/automysqlbackup.conf
		cp -pR #{extract_path}/automysqlbackup #{node['automysqlbackup']['bin_path']}
		mv #{extract_path} #{node['automysqlbackup']['bin_path']}
		chmod +x #{node['automysqlbackup']['bin_path']}
	EOH
	not_if { ::File.exists?(extract_path) }
	creates "#{node['automysqlbackup']['bin_path']}/automysqlbackup"
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
	mode "0777"
end

cron "run_mysql_backup" do
	hour node['automysqlbackup']['cron']['time_hour']
	minute node['automysqlbackup']['cron']['time_minute']
	command "#{node['automysqlbackup']['config_path']}/run_mysql_backup"
end
