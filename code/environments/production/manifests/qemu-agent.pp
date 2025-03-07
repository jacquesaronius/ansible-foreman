class qemu_guest_agent {
  package { 'qemu-guest-agent':
    ensure => installed,
    name   => qemu-guest-agent
  }
}
