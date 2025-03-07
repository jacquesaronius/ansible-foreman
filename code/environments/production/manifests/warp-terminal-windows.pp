class warp_terminal_windows {
  if $facts['os']['family'] == 'windows' {
    
    file { 'C:\Windows\Temp\warp_install.exe':
      ensure => 'file',
      source => 'https://app.warp.dev/download?package=exe_x86_64',
    }

    exec { 'run_installer':
      command     => 'C:\Windows\Temp\warp_install.exe /silent /AllUsers',
      refreshonly => true,
      subscribe   => File['C:\Windows\Temp\warp_install.exe'],
      provider => 'powershell',
      onlyif   => 'if (-Not (Test-Path "C:\\Program Files\\Warp\\warp.exe")) { exit 0 } else { exit 1 }',
    }
  }
}
