$env.config.show_banner = false
$env.config.shell_integration.osc133 = false

$env.PATH ++= [
              '~/.nix-profile/bin/', 
              '/nix/var/nix/profiles/default/bin/',
              '/home/ahabran/.local/bin',
            ]
