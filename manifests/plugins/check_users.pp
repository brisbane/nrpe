class nrpe::plugins::check_users inherits nrpe::params {
 
 $check_users_cmd = $nrpe::params::check_users_cmd 
 package { 'nagios-plugins-users' : ensure => present }
 nrpe::command { 'check_users' :
  cmd => "$check_users_cmd"
 }
}
