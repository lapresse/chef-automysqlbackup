require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe file('/usr/bin/automysqlbackup') do
  it { should be_file }
  it { should be_executable }
end

describe file('/etc/automysqlbackup') do
  it { should be_directory }
end

describe file('/var/backup/db') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_writable }
end

describe file('/etc/automysqlbackup/myserver.conf') do
  it { should be_file }
  it { should be_mode 600 }
end

describe file('/usr/bin/run_mysql_backup') do
  it { should be_file }
  it { should be_executable }
end

describe cron do
  it { should have_entry('1 0 * * * /usr/bin/run_mysql_backup >/dev/null 2>&1 | logger -t automysqlbackup').with_user('root') }
end
