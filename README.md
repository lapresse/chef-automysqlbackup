Description
===========

Install automysql backup and configure it to run automatically.





Requirements
============

Assumes DB installed by the 'database' cookbook: we will read the root password in node['mysql']['server_root_password']

Attributes
==========


Usage
=====


Limitations
===========

Backups all databases: no support (yet) to pick specific DB for daily/monthly backups.
