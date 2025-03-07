if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class git_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'git':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
