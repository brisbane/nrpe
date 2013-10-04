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
  
  if $put_offline {
    include nrpe::eventhandler::put_offline
  }
  
  if $check_softwarenfs {
    
    include nrpe::plugins::check_softwarenfs 
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
  
  include nrpe::plugins::simple_checks
}
