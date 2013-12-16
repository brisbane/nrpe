class nrpe::plugins::check_cvmfs_lhcb inherits nrpe::params {
 
 $check_cvmfs_lhcb_cmd = $nrpe::params::check_cvmfs_lhcb_cmd 

# This file is already defined in check_atlas_cvmfs 

# file { "${nrpe::params::plugindir}/check_cvmfs_1.7.sh":

#    content => template('nrpe/check_cvmfs_1.7.sh'),
#    owner   => root,
#    group   => root,
#    mode    => '0755',
#    require => Package['nrpe'],
#    notify  => Service['nrpe'],
#  }
 

 nrpe::command { 'check_cvmfs_lhcb' :
  cmd => "$check_cvmfs_lhcb_cmd"
 }
}
