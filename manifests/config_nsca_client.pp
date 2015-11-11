class nrpe::config_nsca_client inherits nrpe::params {
  
  $password   = $nrpe::params::nsca_password
  $encryption = $nrpe::params::nsca_encryption
  
  ensure_packages(['nagios-plugins-perl', 'nsca-client'])   
  file {"${nsca_dir}/send_nsca.cfg":
    content => template('nrpe/send_nsca.cfg.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
    require => Package['nsca-client'],
  }
}
