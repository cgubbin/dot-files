{ pkgs, ... }:
{
  imports = [
    ./linux.nix
    ./darwin.nix
  ];
}
