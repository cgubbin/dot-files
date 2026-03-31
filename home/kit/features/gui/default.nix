{pkgs, ...}: {
  imports = [
    ./common.nix
    ./darwin.nix
    ./firefox.nix
    ./kitty.nix
    ./linux.nix
  ];
}
