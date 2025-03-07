if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class pwsh_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'powershell-core':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
