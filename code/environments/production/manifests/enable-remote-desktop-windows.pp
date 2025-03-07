class enable_remote_desktop_windows {
  if $facts['os']['family'] == 'windows' {
    exec { 'Enable RDP':
      command   => 'Set-ItemProperty -Path "HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server" -Name "fDenyTSConnections" -Value 0',
      provider  => 'powershell',
      unless    => '(Get-ItemProperty -Path "HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server" -Name "fDenyTSConnections").fDenyTSConnections -eq 0',
    }

    exec { 'Allow RDP through firewall':
      command   => 'Enable-NetFirewallRule -DisplayGroup "Remote Desktop"',
      provider  => 'powershell',
      unless    => 'if (Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Where-Object { $_.Enabled -eq "True" }) { exit 0 } else { exit 1 }',
    }
  }
}
