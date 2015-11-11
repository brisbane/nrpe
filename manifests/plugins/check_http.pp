class nrpe::plugins::check_http inherits nrpe::params {
 
 $check_http_cmd = $nrpe::params::check_http_cmd 
 package { 'nagios-plugins-http' : ensure => present }
 nrpe::command { 'check_http' :
  cmd => "$check_http_cmd"
 }
}
