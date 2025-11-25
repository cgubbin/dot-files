{
    config,
    ...
}:
let
    inherit (config.home-config.cli.commonTools) enable;
in
{
    programs.navi = {
        inherit enable;
    };
}
