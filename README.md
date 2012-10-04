Description
===========

Install automysql backup and configure it to run automatically.


Requirements
============

None

Attributes
==========


What 
-----

* default['automysqlbackup']['download_url'] The download URL. Use this to host your own and/or download the latest version.


Who
-----

* default['automysqlbackup']['email'] default is  "root".  Who to send reports too?

When
----

* default['automysqlbackup']['time_hour'] default is  "0"
* default['automysqlbackup']['time_minute'] default is  "1"

How
-----------

* default['automysqlbackup']['user'] default is  "root" 
* default['automysqlbackup']['password'] default is  nil


What else?
------------- 

* default['automysqlbackup']['config_path'] default is  "/etc/automysqlbackup"
* default['automysqlbackup']['bin_path'] default is  "/usr/local/bin/automysqlbackup"
* default['automysqlbackup']['dump_path']  default is   "/var/backup/db"
* default['automysqlbackup']['hostname']  default is   "localhost"


Usage
=====

You must give a value at least for user and password. 

Backup are kept locally: you should pair this with a "real" backup method to take out the data. Backuping the DB like this only make
sure that you will have a recoverable backup of your database (to the opposite of the raw database files that will have been read in
an unknown state).

Limitations
===========

* Backups all databases: no support (yet) to pick specific DB for daily/monthly backups.

* Credentials are stored plain-text in the attributes. Should use an encrypted databag.


