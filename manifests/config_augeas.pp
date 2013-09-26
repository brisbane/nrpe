define nrpe::config_augeas {
  
# there is a bug in default nrpe lens for aug-0.9. load_path can be removed when aug1.0 available with sl6  
if $name != 'undef' {
  augeas { $name:
   context => "/files/etc/nagios/nrpe.cfg",
   changes => "set $name last()+1",
   load_path => '/var/lib/puppet/lib/augeas/lenses',
   notify  =>  Service["nrpe"]
  }
 }
}
