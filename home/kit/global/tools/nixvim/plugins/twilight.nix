{
	programs.nixvim.plugins.twilight = {
		enable = true;
		settings = {
    			dimming.alpha = 0.4;
    			context = 20;
    			treesitter = true;
    			expand = [
      				"function"
      				"method"
    			];
  		};
	};

	programs.nixvim.plugins.web-devicons.enable = true;
}
