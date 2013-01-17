default['automysqlbackup']['email'] = "root"
default['automysqlbackup']['config_path'] = "/etc/automysqlbackup"
default['automysqlbackup']['bin_path'] = "/usr/local/bin/automysqlbackup"
default['automysqlbackup']['dump_path']  =  "/data/mysql/backup"
default['automysqlbackup']['server']  =  "localhost"
default['automysqlbackup']['tarball'] = "automysqlbackup-v3.0_rc6.tar.gz"

# when to run backup
default['automysqlbackup']['cron_hour'] = 0
default['automysqlbackup']['cron_minute'] = 1

# credentials
default['automysqlbackup']['user'] = "root"
default['automysqlbackup']['mysql_dump_usessl'] = "no"

# rotation
default['automysqlbackup']['do_weekly'] = 7
default['automysqlbackup']['rotation_daily'] = 7
