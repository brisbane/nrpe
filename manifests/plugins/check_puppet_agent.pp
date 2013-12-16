class nrpe::plugins::check_puppet_agent inherits nrpe::params {
 
 $check_puppet_agent_cmd = $nrpe::params::check_puppet_agent_cmd 

 
 file { "${nrpe::params::plugindir}/check_puppet.rb":
    
    content => template('nrpe/check_puppet.rb'),
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
  
 nrpe::command { 'check_puppet_agent' :
  cmd => "$check_puppet_agent_cmd",
  sudo => "sudo"
 }
}
