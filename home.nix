{ config, pkgs, username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    ripgrep
    helix
    zellij
    bat
    fd
    uv
    atuin
    eza
  ];

  programs.nushell = {
    enable = true;

    plugins = with pkgs.nushellPlugins; [
      gstat
    ];
  };

  programs.home-manager.enable = true;
}
