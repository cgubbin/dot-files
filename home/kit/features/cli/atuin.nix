{
    config,
    ...
}:
let
    inherit (config.home-config.cli.commonTools) enable;
in
{
    programs.atuin = {
      inherit enable;
      flags = [ "--disable-up-arrow" ];
      settings = {
        inline_height = 20;
        style = "compact";
      };
    };
}
