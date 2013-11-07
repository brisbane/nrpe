class nrpe::config inherits nrpe::params {
  
$nrpe_parameters =$nrpe::params::nrpe_parameters

if $nrpe::params::version == 'UNSET' {
    $version_real = 'installed'
  } else {
    $version_real = $nrpe::params::version
  }


package { 'nrpe':
    ensure => $version_real,
    name   => $nrpe::params::nrpe_name,
  }

if $config_nrpe {
    $changes_change = [
                 "rm command",
                 "set include_dir/dir '/etc/nrpe.d/'" ,
               ]
## Remove default hardcoded commands from nrpe.cfg
augeas {nrpecfg_change:
  context => "/files/etc/nagios/nrpe.cfg",
  load_path => '/var/lib/puppet/lib/augeas/lenses',
  changes => $changes_change,
  notify  =>  Service ["nrpe"]
 }

nrpe::config_augeas {$nrpe_parameters: }
}

service { 'nrpe':
    ensure     => running,
    name       => $nrpe::params::nrpe_service,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => Package['nrpe'],
  }

  
}
