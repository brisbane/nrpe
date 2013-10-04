define nrpe::plugins::check_service ( 
     $nagios_simple_checks_dir, 
     $pluginsdir   )
 {
 notify { "$nagios_simple_checks_dir/$name" :} 
  file { "$pluginsdir/$name":
    mode    => "755",
    source  => "$nagios_simple_checks_dir/$name",
    purge   => false,
    recurse => true,
}
 nrpe::command { $name :
  cmd => "$plugindir/$name"
 }
}
class nrpe::plugins::simple_checks inherits nrpe::params  {
  nrpe::plugins::check_service { $nrpe::params::simple_checks : 
     nagios_simple_checks_dir => $nrpe::params::nagios_simple_checks_dir,
     pluginsdir => $nrpe::params::pluginsdir 
     }
}
