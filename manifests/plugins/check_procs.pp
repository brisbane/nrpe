class nrpe::plugins::check_procs inherits nrpe::params {
 
 $check_procs_cmd = $nrpe::params::check_procs_cmd
 $check_zombie_cmd = $nrpe::params::check_zombie_cmd 
 package { 'nagios-plugins-procs' : ensure => present }
 nrpe::command { 'check_total_procs' :
  cmd => "$check_procs_cmd"
 }
 
 nrpe::command { 'check_zombie_procs' :
  cmd => "$check_zombie_cmd"
 }


}
