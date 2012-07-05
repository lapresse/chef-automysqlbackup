

# "latest" url is : http://sourceforge.net/projects/automysqlbackup/files/AutoMySQLBackup/AutoMySQLBackup%20VER%203.0/automysqlbackup-v3.0_rc6.tar.gz/download
# We prefer picking a specific version so we know what we get
# Can be redefined in your roles/env if you need to serve it internally for eg.
#
# FIXME: I'm overwritting this for 1st version to simplify development
default['automysqlbackup']['download_url'] = "http://sourceforge.net/projects/automysqlbackup/files/AutoMySQLBackup/AutoMySQLBackup%20VER%203.0/automysqlbackup-v3.0_rc6.tar.gz/download"


# Who to send reports too?
default['automysqlbackup']['email'] = "root"


default['automysqlbackup']['config_path'] = "/etc/automysqlbackup"
default['automysqlbackup']['bin_path'] = "/usr/local/bin/automysqlbackup"
default['automysqlbackup']['dump_path']  =  "/var/backup/db"

# when to run backup
default['automysqlbackup']['time_hour'] = "0"
default['automysqlbackup']['time_minute'] = "1"


