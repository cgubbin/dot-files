{
    config,
    ...
}:
let
    inherit (config.home-config.cli.commonTools) enable;
in
{
    programs.bat = {
        inherit enable;
    	config = {
	  pager = "less -FR";
	};
    };
}
