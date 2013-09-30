class nrpe::plugins::check_load inherits nrpe::params {
 
 $check_procs_cmd = $nrpe::params::check_load_cmd 
 package { 'nagios-plugins-load' : ensure => present }
 nrpe::command { 'check_load' :
  cmd => "$check_load_cmd"
 }
}