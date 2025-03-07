if $facts['os']['family'] == 'windows' {
  include chocolatey
}

class visual_studio_community_windows {
  if $facts['os']['family'] == 'windows' {
    package { 'visualstudio2022community':
      ensure   => latest,
      install_options => ['--package-parameters', '"', '--add', 'microsoft.visualstudio.workload.netweb', '--add', 'microsoft.visualstudio.workload.netcoretools', '--add', 'microsoft.visualstudio.workload.manageddesktop', '"'],
      provider => 'chocolatey'

    }
  }
}
