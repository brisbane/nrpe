class nrpe::plugins::check_ntp inherits nrpe::params {
 
 $check_ntp_cmd = $nrpe::params::check_ntp_cmd 
 package { 'nagios-plugins-ntp' : ensure => present }
 nrpe::command { 'check_ntp' :
  cmd => "$check_ntp_cmd"
 }
}