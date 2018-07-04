class httpd {
  case $::osfamily {
    'redhat':{
      $pacotes = [ "httpd", "epel-release" ]
      $httpd = "httpd"
    }
    'debian':{
      $pacotes = [ "apache2", "tree", "hollywood" ]
      $httpd = "apache2" 
    }
  }

  package { $pacotes:
    ensure => "present",
  }

  service { $httpd:
    ensure => "running",
    enable => true
  }

  file {"/var/www/html/index.html":
    source => "puppet:///modules/httpd/index.html",
    ensure => present
  }
}
