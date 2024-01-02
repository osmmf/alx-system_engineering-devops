# 1-install_a_package.pp

# Define a class for installing Flask
class install_flask {
  package { 'python3-pip':
    ensure => installed,
  }

  exec { 'install_flask':
    command => '/usr/bin/pip3 install Flask==2.1.0',
    unless  => '/usr/bin/pip3 show Flask | grep -q "Version: 2.1.0"',
    require => Package['python3-pip'],
  }
}

# Include the class to install Flask
include install_flask
