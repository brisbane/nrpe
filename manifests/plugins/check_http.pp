class nrpe::plugins::check_http inherits nrpe::params {
 
 $check_users_cmd = $nrpe::params::check_users_cmd 
 package { 'nagios-plugins-http' : ensure => present }
 nrpe::command { 'check_http' :
  cmd => "$check_users_cmd"
 }
}
