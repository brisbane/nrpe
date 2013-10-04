class nrpe::plugins::check_disk inherits nrpe::params {
 
 $check_disk_cmd = $nrpe::params::check_disk_cmd 
 package { 'nagios-plugins-disk' : ensure => present }
 nrpe::command { 'check_disk' :
  cmd => "$check_disk_cmd"
 }
}