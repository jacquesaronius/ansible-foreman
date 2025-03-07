class force_windows_update {
  exec { 'force-windows-update':
    command   => 'powershell.exe -Command "Install-WindowsUpdate -AcceptAll -AutoReboot -Confirm:$false"',
    path      => ['C:/Windows/System32/WindowsPowerShell/v1.0', 'C:/Windows/System32'],
    logoutput => true,
    require   => Exec['install-pswindowsupdate'],
  }
    
  exec { 'install-pswindowsupdate':
    command   => 'powershell.exe -Command "Install-Module -Name PSWindowsUpdate -Force -AllowClobber -Confirm:$false"',
    path      => ['C:/Windows/System32/WindowsPowerShell/v1.0', 'C:/Windows/System32'],
    onlyif    => 'powershell.exe -Command "(Get-Module -ListAvailable -Name PSWindowsUpdate) -eq $null"',
    require   => Exec['install-nuget'],
  }

  exec { 'install-nuget':
    command   => 'powershell.exe -Command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Confirm:$false"',
    path      => ['C:/Windows/System32/WindowsPowerShell/v1.0', 'C:/Windows/System32'],
    logoutput => true,
  }

}
