#Using strace, find out why Apache is returning a 500 error. Once you find the issue, fix it and then automate it using Puppet

file { '/etc/php/7.4/apache2/php.ini':
  ensure  => file,
  source  => 'puppet:///modules/apache/php.ini',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  require => Package['php'],
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => File['/etc/php/7.4/apache2/php.ini'],
  subscribe => File['/etc/php/7.4/apache2/php.ini'],
}
