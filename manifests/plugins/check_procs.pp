class nrpe::plugins::check_procs inherits nrpe::params {
 
 $check_procs_cmd = $nrpe::params::check_procs_cmd 
 package { 'nagios-plugins-procs' : ensure => present }
 nrpe::command { 'check_procs' :
  cmd => "$check_procs_cmd"
 }
}
