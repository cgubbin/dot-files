{
    config,
    ...
}:
let
    inherit (config.home-config.cli.commonTools) enable;
in
{
    programs.zoxide = {
        inherit enable;
	enableFishIntegration = true;
    };
}
