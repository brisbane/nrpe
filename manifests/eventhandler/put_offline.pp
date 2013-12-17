class nrpe::eventhandler::put_offline inherits nrpe::params {
  
  # Dont want to create two sudo files
  $eventhadler_dir = '/usr/lib64/nagios/plugins'
  augeas {do_not_blame:
  context => "/files/etc/nagios/nrpe.cfg",
  load_path => '/var/lib/puppet/lib/augeas/lenses',
  changes => " set dont_blame_nrpe 1 last()+1",
  notify  =>  Service ["nrpe"]
 }
 
# Eventhandler already exist 
#  file { "$eventhadler_dir":
#    
#    ensure  => directory,
#    owner   => root,
#    group   => root,
#    mode    => '0755',
#    require => Package['nrpe'],
#  }
  
   file { "${eventhadler_dir}/put_offline.sh":
    source  => 'puppet:///modules/nrpe/put_offline.sh',
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
  }
 
# sudo file created by default
#  file { '/etc/sudoers.d/nrpe_sudo':
#    source  => 'puppet:///modules/nrpe/nrpe_sudo',
#    owner   => root,
#    group   => root,
#    mode    => '0440',
#   }
  
  file { "${nrpe::params::confd}/put_offline.cfg":
    
    content => template('nrpe/put_offline.cfg.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  } 
  
}
