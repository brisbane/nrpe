class nrpe::nsca::check_kernel inherits nrpe::params {
  
  $nagios_server = $nrpe::params::nagios_server
  file {"${nsca_dir}/passive_check_kernel":
    content => template('nrpe/passive_check_kernel.erb'),
    owner   => root,
    group   => root,
    mode    => '0766',
    require => File["${nsca_dir}/send_nsca.cfg"]
  }
  cron {'passive_check_kernel':
    command  => "${nsca_dir}/passive_check_kernel",
    user     => root,
    hour     => 6,
    minute  => 10,
    require => File["$nsca_dir/passive_check_kernel"]
  } 
}