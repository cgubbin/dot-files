{ ... }:
{
    imports = [
        ./features
        ./global
    ];

    home-config = {
    	desktop = {
		stylix.enable = true;
		wayland = {
			enable = true;
			hyprland = {
				enable = true;
				nvidia = true;
			};
		};
	};
	custom-fonts = {
		dankMono.enable = true;
	};
        gaming.enable = true;
	gui = {
		kitty.enable = true;
		firefox = {
			enable = true;
		};
		utils.enable = true;
	};
	dev.devTools.enable = true;
	cli = {
		commonTools.enable = true;
		nvTop.enable = true;
	};
    };


    monitors = [
    	{
      		name = "eDP-1";
      		width = 3840;
      		height = 2400;
      		refreshRate = 60.0;
      		scale = 1.5;
      		x = 0;
      		workspace = "1";
      		primary = true;
    	}
    ];	
}
