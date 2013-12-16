class nrpe::plugins::check_cvmfs_atlas inherits nrpe::params {
 
 $check_cvmfs_atlas_cmd = $nrpe::params::check_cvmfs_atlas_cmd 
 
 file { "${nrpe::params::plugindir}/check_cvmfs":

    content => template('nrpe/check_cvmfs_1.7.sh'),
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
 

 nrpe::command { 'check_cvmfs_atlas' :
  cmd => "$check_cvmfs_atlas_cmd"
 }
}
