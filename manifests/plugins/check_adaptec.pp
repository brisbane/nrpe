class nrpe::plugins::check_adaptec inherits nrpe::params {
 
 $check_adaptec_cmd = $nrpe::params::check_adaptec_cmd
 # This plugin requires sudo access
  
  
 file { "${nrpe::params::plugindir}/check_adaptec":
    source => "puppet:///modules/nrpe/check_adaptec",
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
  
 nrpe::command { 'check_adaptec' :
  cmd => "$check_adaptec_cmd",
  sudo => "sudo"
 }
}
