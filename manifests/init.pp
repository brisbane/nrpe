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
  
  if $softwarenfs {
    
    include nrpe::plugins::softwarenfs 
  }
  
  if $check_procs {
     include nrpe::plugins::check_procs
 }  
   

}
