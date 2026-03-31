{ pkgs, ... }:
{
  imports = [
    ./options
    ./tools
    ./home-manager.nix
    ./home-manager-linux.nix
    ./home-manager-darwin.nix
    #./sops.nix
  ];
}
