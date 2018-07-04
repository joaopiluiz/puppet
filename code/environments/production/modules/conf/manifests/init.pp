class conf {
  file {"/etc/puppetlabs/puppet/puppet.conf":
    source => "puppet:///modules/conf/puppet.conf",
    ensure => present
  }

  package { "vim":
    ensure => 'present',
  }
}
