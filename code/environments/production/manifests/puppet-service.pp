class puppet_service {
  service { 'puppet':
    ensure => 'running',
    enable => true,
  }
}
