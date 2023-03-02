{
  description = "Home Manager flake";
  # via https://www.bekk.christmas/post/2021/16/dotfiles-with-nix-and-home-manager

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
 
    homeConfigurations = {
      "emv" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-liuxl"; 
        homeDirectory = "/home/emv"; 
        username = "emv"; 
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
