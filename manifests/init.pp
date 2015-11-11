# Class: nrpe
#
# This module manages nrpe
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
# class nrpe inherits nrpe::params {
class nrpe inherits nrpe::params {  
  include nrpe::config
# puppet plugins require sudo access 
  include nrpe::config_sudo
  
  if config_nsca {
    include nrpe::config_nsca_client
  }
  
  
  if $put_offline {
    include nrpe::eventhandler::put_offline
  }
  
  if $check_puppet_agent {
    include nrpe::plugins::check_puppet_agent
  }
  
  if $check_softwarenfs {    
    include nrpe::plugins::check_softwarenfs 
  }
  
  if $check_cvmfs_atlas {
    include nrpe::plugins::check_cvmfs_atlas
  }  
  
  if $check_cvmfs_lhcb {
    include nrpe::plugins::check_cvmfs_lhcb
  }
 
 
  if $check_procs {
     include nrpe::plugins::check_procs
  }  
 
  if $check_disk {
    include nrpe::plugins::check_disk    
  }

  if $check_ntp {
    include nrpe::plugins::check_ntp    
  }
  
  if $check_load {
    include nrpe::plugins::check_load    
  }
  
  if $check_users {
    include nrpe::plugins::check_users    
  }
  
  if $check_megaraid_sas {
    include nrpe::plugins::check_megaraid_sas
  }

  if $check_http {
    include nrpe::plugins::check_http
  }

  if $check_yumupdate {
    include nrpe::nsca::check_yumupdate
  }
  
  if $check_kernel {
    include nrpe::nsca::check_kernel
  }
  
  include nrpe::plugins::simple_checks
}
