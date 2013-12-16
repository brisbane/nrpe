class nrpe::config_sudo {
# Some plugins need escalated privelege
file { "/etc/sudoers.d/nrpe":
    content => template('nrpe/nrpe.erb'),
    owner => root,
    group => root,
    mode => '0440',
  }
}
