class linux_update {
  cron { 'weekly_linux_update':
    ensure  => present,
    command => 'DEBIAN_FRONTEND=noninteractive /usr/bin/apt update && DEBIAN_FRONTEND=noninteractive /usr/bin/apt upgrade --with-new-pkgs  -y && /usr/sbin/reboot', # For Debian/Ubuntu
    user    => 'root',
    minute  => 0,
    hour    => 2,
    weekday => 0, # Sunday (adjust as needed: 0-6 represents Sunday-Saturday)
  }
}
