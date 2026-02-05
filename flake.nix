{
  description = "NixBS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-fork.url = "/home/n/Documents/git/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blobsaver = {
      url = "github:Back-Slash-N/blobsaver";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # playit-nixos-module = {
    #   url = "github:pedorich-n/playit-nixos-module";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    # nixpkgs-fork,
    flake-utils,
    home-manager,
    sops-nix,
    blobsaver,
    nix-vscode-extensions,
    # playit-nixos-module,
    ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = let
          system = "x86_64-linux";
        in {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          # pkgs-fork = import nixpkgs-fork {
          #   inherit system;
          #   config.allowUnfree = true;
          # };
        };

        modules = [
          ./configuration.nix
          # playit-nixos-module.nixosModules.default
          blobsaver.nixosModules.blobsaver
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.n = import ./home.nix;
            home-manager.sharedModules = [
              inputs.sops-nix.homeManagerModule
            ];
            nixpkgs.overlays = [
              blobsaver.overlays.default
              nix-vscode-extensions.overlays.default
            ];
            home-manager.extraSpecialArgs = { inherit inputs; };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
