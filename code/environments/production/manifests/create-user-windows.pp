class create_user_windows {
  if $facts['os']['family'] == 'windows' {
    user { 'jacques':
      ensure      => 'present',       # Ensures the user exists
      groups      => ['Users', 'Remote Desktop Users'], # Add the user to specific groups
      home        => 'C:\\Users\\Jacques', # Specify the home directory
      managehome  => true,            # Ensure the home directory is created
    }
  }
}
