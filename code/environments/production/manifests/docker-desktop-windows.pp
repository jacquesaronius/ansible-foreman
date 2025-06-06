if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class visual_studio_community_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'docker-desktop':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
