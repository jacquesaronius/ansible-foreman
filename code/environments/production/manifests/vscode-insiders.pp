if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class vscode_insiders_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'vscode-insiders':
      ensure   => latest,
      provider => 'chocolatey'
    }
  }
}
