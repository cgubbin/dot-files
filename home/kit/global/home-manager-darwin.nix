{
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf pkgs.stdenv.isDarwin {
    home = {
      homeDirectory = "/Users/kit";
    };
  };

}
