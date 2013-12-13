class nrpe::nsca::check_yumupdate inherits nrpe::params {
  $nagios_server = $nrpe::params::nagios_server
  
  file {"${nsca_dir}/passive_check_yumupdate":
    content => template('nrpe/passive_check_yumupdate.erb'),
    owner   => root,
    group   => root,
    mode    => '0766',
    require => File["${nsca_dir}/send_nsca.cfg"]
  }
  cron {'passive_check_yumupdate':
    command  => "${nsca_dir}/passive_check_yumupdate",
    user     => root,
    hour     => 6,
    minute  => 10,
    require => File["${nsca_dir}/passive_check_yumupdate"]
  } 
}