class nrpe::params {
  
  $version = hiera ('nrpe::params::version', 'UNSET')
  
  $config_nrpe = hiera ('nrpe::params::config_nrpe', true)
  
  $nrpe_parameters = hiera ('nrpe::params::nrpe_parameters', [])
  
  $config_nsca   = hiera ('nrpe::params::config_nsca', true)
  $nsca_password = hiera ('nrpe::params::nsca_password')  
  $nsca_encryption = hiera ('nrpe::params::nsca_encryption', '16')  
  $nagios_server   = hiera ('nrpe::params::nagios_server', 'UNSET')  
  
  $check_kernel = hiera ('nrpe::params::check_kernel', true)
  
  $check_yumupdate = hiera ('nrpe::params::check_yumupdate', true)
  
  $put_offline = hiera ('nrpe::params::put_offline', false)
  
  $check_puppet_agent= hiera ('nrpe::params::check_puppet_agent', true)
  $check_puppet_agent_cmd = hiera ('nrpe::params::check_puppet_agent_cmd', 'check_puppet.rb -w 3600 -c 7200')
  
  $check_softwarenfs = hiera ('nrpe::params::check_softwarenfs', false)  
  $check_softwarenfs_cmd = hiera ('nrpe::params::check_softwarenfs_cmd', 'check_softwarenfs')
  
  $check_procs = hiera ('nrpe::params::check_procs', true)  
  $check_procs_cmd = hiera ('nrpe::params::check_procs_cmd', 'check_procs -w 3000 -c 6000')
  
  $check_zombie_cmd = hiera ('nrpe::params::check_zombie_cmd', 'check_procs -w 9 -c 17 -s Z')
  
  $check_disk = hiera ('nrpe::params::check_disk', true)
  $check_disk_cmd = hiera ('nrpe::params::check_disk_cmd', "check_disk -w 20% -c 5% -p / -p /var -p /usr/local -p /boot -p /tmp")
  
  $check_users = hiera ('nrpe::params::check_users', false)
  $check_users_cmd = hiera ('nrpe::params::check_users_cmd', 'check_users  -w 5 -c 10')
  
  $check_ntp = hiera ('nrpe::params::check_ntp', true)
  $check_ntp_cmd = hiera ('nrpe::params::check_ntp_cmd','check_ntp -H ntp0.physics.ox.ac.uk')
  
  $check_load = hiera ('nrpe::params::check_load', true)
  $check_load_cmd = hiera ('nrpe::params::check_load_cmd','check_load -r -w 1.6, 1.4, 1.2 -c 2, 1.8, 1.5')

  #drop a executable file that acts as a nagios test into nrpe::params::nagios_simple_checks_dir path
  #then add that command name to to the list of simple_checks.  It will be called with the parameters listed in the hash
  $simple_checks_dir        = hiera       ('nrpe::params::nagios_simple_checks_dir', "puppet:///modules/nrpe")
  $simple_checks            = hiera_array ('nrpe::params::simple_checks',      []     )
  $simple_checks_args       = hiera_hash  ('nrpe::params::simple_checks_args', {}     )

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
      $nsca_dir         = '/etc/nagios'
    }
}
}
