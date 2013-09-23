define nrpe::config_augeas {
if $name != 'undef' {
  augeas { $name:
   context => "/files/etc/nagios/nrpe.cfg",
   changes => "set $name last()+1",
   notify  =>  Service["nrpe"]
  }
 }
}
