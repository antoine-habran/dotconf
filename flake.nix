# flake.nix
{
  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      "ahabran@wsl" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };

        extraSpecialArgs = {
          username = "ahabran";
          homeDirectory = "/home/ahabran";
	  isMac = false;
        };

        modules = [ ./home.nix ];
      };

      "antoinehabran@mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };

        extraSpecialArgs = {
          username = "antoinehabran";
          homeDirectory = "/Users/antoinehabran";
	  isMac = false;
        };

        modules = [ ./home.nix ];
      };
    };
  };
}
