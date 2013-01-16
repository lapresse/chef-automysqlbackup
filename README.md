Description
===========

Installs and configures [automysqlbackup](http://sourceforge.net/projects/automysqlbackup/)

Requirements
============

Platform
--------

* Debian, Ubuntu

Attributes
==========
* `node['automysqlbackup']['download_url']` - 
* `node['automysqlbackup']['config_path']` - 
* `node['automysqlbackup']['config']` - 
* `node['automysqlbackup']['bin_path']` - 
* `node['automysqlbackup']['cron']['time_hour']` - 

* `node['automysqlbackup']['mysql_dump_username']` - 
* `node['automysqlbackup']['mysql_dump_password']` - use encrypted databag!
* `node['automysqlbackup']['mysql_dump_host']` - 
* `node['automysqlbackup']['mysql_dump_host_friendly']` - 
* `node['automysqlbackup']['backup_dir']` - 
* `node['automysqlbackup']['multicore']` - 
* `node['automysqlbackup']['multicore_threads']` - 
* `node['automysqlbackup']['db_names']` - 
* `node['automysqlbackup']['db_month_names']` - 
* `node['automysqlbackup']['db_exclude']` - 
* `node['automysqlbackup']['table_exclude']` - 
* `node['automysqlbackup']['do_monthly']` - 
* `node['automysqlbackup']['do_weekly']` - 
* `node['automysqlbackup']['rotation_daily']` - 
* `node['automysqlbackup']['rotation_weekly']` - 
* `node['automysqlbackup']['mysql_dump_port']` - 
* `node['automysqlbackup']['mysql_dump_commcomp']` - 
* `node['automysqlbackup']['mysql_dump_usessl']` - 
* `node['automysqlbackup']['mysql_dump_socket']` - 
* `node['automysqlbackup']['mysql_dump_max_allowed_packet']` - 
* `node['automysqlbackup']['mysql_dump_single_transaction']` - 
* `node['automysqlbackup']['mysql_dump_master_data']` - 
* `node['automysqlbackup']['mysql_dump_full_schema']` - 
* `node['automysqlbackup']['mysql_dump_dbstatus']` - 
* `node['automysqlbackup']['mysql_dump_create_database']` - 
* `node['automysqlbackup']['mysql_dump_use_separate_dirs']` - 
* `node['automysqlbackup']['mysql_dump_compression']` - 
* `node['automysqlbackup']['mysql_dump_latest']` - 
* `node['automysqlbackup']['mysql_dump_latest_clean_filenames']` - 
* `node['automysqlbackup']['mysql_dump_differential']` - 
* `node['automysqlbackup']['mailcontent']` - 
* `node['automysqlbackup']['mail_maxattsize']` - 
* `node['automysqlbackup']['mail_splitandtar']` - 
* `node['automysqlbackup']['mail_use_uuencoded_attachments']` - 
* `node['automysqlbackup']['mail_address']` - 
* `node['automysqlbackup']['encrypt']` - 
* `node['automysqlbackup']['encrypt_password']` - use encrypted databag!
* `node['automysqlbackup']['backup_local_files']` - 
* `node['automysqlbackup']['prebackup']` - 
* `node['automysqlbackup']['postbackup']` - 
* `node['automysqlbackup']['dryrun']` - 

Templates
==========

`myserver.conf`
-----------------

Creates a configuration file from the specified default attributes.

`run_mysql_backup`
-----------------

Creates a script which is triggered by cron to automatically backup databases.

Usage
=====

Simply include the recipe. Make sure you do not store passwords in plain-text! Use encrypted databags instead.

License and Author
==================

Original:: Benoit Caron (<bcaron@lapresse.ca>)
Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)

Copyright:: 2013, La Presse (Benoit Caron), Achim Rosenhagen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
