{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.home-config.cli;
in {
  home.packages = (
    with pkgs; [
      restic
    ]
  );
  services.restic = {
    enable = true;
  };
}
