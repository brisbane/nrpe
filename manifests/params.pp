class nrpe::params {
  
  $version = hiera ('nrpe::params::version', 'UNSET')
  $config_nrpe = hiera ('nrpe::params::config_nrpe', true)
  $nrpe_parameters = hiera ('nrpe::params::$nrpe_parameters', [])
  
  $softwarenfs = hiera ('nrpe::params::softwarenfs', false)
  $softwarenfs_cmd = hiera ('nrpe::params::softwarenfs_cmd', '/usr/lib64/nagios/plugins/check_softwarenfs')
  
  $check_procs = hiera ('nrpe::params::check_procs', true)
  $check_procs_cmd = hiera ('nrpe::params::check_procs_cmd', '/usr/lib64/nagios/plugins/check_procs -w 9 -c 17 -s Z')
   
  case $::architecture {
    'x86_64', 'amd64': { $plugindir = '/usr/lib64/nagios/plugins' }
    default:  { $plugindir = '/usr/lib/nagios/plugins' }
  }

  case $::operatingsystem {
    'gentoo', 'sabayon': {
      $confd            = '/etc/nagios/nrpe.d'
      $nrpe_name        = 'nrpe'
      $nrpe_service     = 'nrpe'
      $sysconf          = '/etc/conf.d/nrpe'
      $sysconf_template = 'nrpe/nrpe-sysconfig.erb'
      $use_sysconf      = true
#      $pluginspackage   = 'nagios-plugins'
      $pid_file         = '/run/nrpe.pid'
      $nrpe_user        = 'nagios'
      $nrpe_group       = 'nagios'
    }
    'centos', 'redhat', 'fedora', 'Scientific', 'oel': {
      $confd            = '/etc/nrpe.d'
      $nrpe_name        = 'nrpe'
      $nrpe_service     = 'nrpe'
      $sysconf          = '/etc/sysconfig/nrpe'
      $sysconf_template = 'nrpe/nrpe-sysconfig.erb'
      $use_sysconf      = true
#      $pluginspackage   = 'nagios-plugins-all'
      $pid_file         = '/var/run/nrpe/nrpe.pid'
      $nrpe_user        = 'nrpe'
      $nrpe_group       = 'nrpe'
    }
}
}
