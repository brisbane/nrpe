class nrpe::plugins::softwarenfs inherits nrpe::params {
 
 $softwarenfs_cmd = $nrpe::params::softwarenfs_cmd 
# package { 'nagios-plugins-softwarenfs' : ensure => present }
 
 file { "${nrpe::params::plugindir}/check_softwarenfs":
    
    content => template('nrpe/check_softwarenfs.erb'),
    owner   => root,
    group   => root,
    mode    => '0766',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
  
 nrpe::command { 'softwarenfs' :
  cmd => "$softwarenfs_cmd"
 }
}
