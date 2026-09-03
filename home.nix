{ config, pkgs, username, homeDirectory, isMac, ... }:
  
{
  home = {
    username = username;
    homeDirectory = homeDirectory;
    stateVersion = "26.05";
  
    sessionPath = [
      "${homeDirectory}/.local/bin"
      "${homeDirectory}/.nix-profile/bin"
      "/nix/var/nix/profiles/default/bin"
    ]
    ++ pkgs.lib.optionals isMac [
      "/opt/homebrew/bin"
    ];
  
    shell.enableNushellIntegration = true;
  
    packages = with pkgs; [
      ripgrep
      helix
      zellij
      bat
      fd
      uv
      atuin
      gnupg
    ];
  };

  programs.nushell = {
    enable = true;

    configFile.source = ./dotconf/nushell/config.nu;
  
    extraEnv = ''
      $env.config.shell_integration.osc133 = false
  
      $env.PATH = (
        $env.PATH
        | prepend "${homeDirectory}/.local/bin"
        | prepend "${homeDirectory}/.nix-profile/bin"
        | prepend "/nix/var/nix/profiles/default/bin"
        | uniq
      )
    '';


    plugins = with pkgs.nushellPlugins; [
      gstat
    ];
  };

  programs.home-manager.enable = true;
}
