class nrpe::plugins::check_softwarenfs inherits nrpe::params {
 
 $softwarenfs_cmd = $nrpe::params::check_softwarenfs_cmd 
# package { 'nagios-plugins-softwarenfs' : ensure => present }
 
 file { "${nrpe::params::plugindir}/check_softwarenfs":
    
    content => template('nrpe/check_softwarenfs.erb'),
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
  
 nrpe::command { 'check_softwarenfs' :
  cmd => "$softwarenfs_cmd"
 }
}
