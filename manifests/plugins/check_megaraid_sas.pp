class nrpe::plugins::check_megaraid_sas inherits nrpe::params {
 
 $check_megaraid_sas_cmd = $nrpe::params::check_megaraid_sas_cmd
 # This plugin requires sudo access
  
  
 file { "${nrpe::params::plugindir}/check_megaraid_sas":
    source => "puppet:///modules/nrpe/check_megaraid_sas",
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
  
 nrpe::command { 'check_megaraid_sas' :
  cmd => "$check_megaraid_sas_cmd",
  sudo => "sudo"
 }
}
