class nrpe::plugins::softwarenfs inherits nrpe::params {
 
 $softwarenfs_cmd = $nrpe::params::softwarenfs_cmd 
 package { 'nagios-plugins-softwarenfs' : ensure => present }
 nrpe::command { 'softwarenfs' :
  cmd => "$softwarenfs_cmd"
 }
}
