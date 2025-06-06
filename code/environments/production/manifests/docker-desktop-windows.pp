if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class docker_desktop_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'docker-desktop':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
