class nrpe::plugins::simple_checks inherits nrpe::params  {

 define nrpe::plugins::check_service ( 
     $simple_checks_dir, 
     $plugindir,
     $cmd_args = ''   )
 {

  file { "$plugindir/$name":
    mode    => "755",
    source  => "$simple_checks_dir/$name",
    purge   => false,
    recurse => true,
  }

  if has_key($cmd_args, $name ) {  
    $cmd_arg =  $cmd_args[$name]
    nrpe::command { $name :
    cmd => "$name $cmd_arg"
    }
  }
  else  {
    nrpe::command { $name :
    cmd => "$name"
    }
  }
 }
 nrpe::plugins::check_service { $nrpe::params::simple_checks : 
     simple_checks_dir => $nrpe::params::simple_checks_dir,
     plugindir => $nrpe::params::plugindir,
     cmd_args => $nrpe::params::simple_checks_args
     }
}
