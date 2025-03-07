class timezone_windows {
  if $facts['os']['family'] == 'windows' {
    $timezone = 'Central Standard Time'

    exec { 'Set-TimeZone':
      command   => "Set-TimeZone -Id '${timezone}'",
      provider  => 'powershell',
      unless    => "if ((Get-TimeZone).Id -eq '${timezone}') { exit 0 } else { exit 1 }",
    }
  }
}
