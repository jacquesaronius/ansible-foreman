if $facts['os']['family'] == 'windows' {
  include chocolatey
}
class qemu_agent_windows {
  if $facts['os']['family'] == 'windows' {   
    package { 'qemu-guest-agent':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
