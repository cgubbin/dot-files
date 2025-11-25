{
	programs.nixvim.plugins.comment = {
		enable = true;
		settings = {
			ignore = "^const(.*)=(%s?)%((.*)%)(%s?)=>";
    			toggler = {
      				line = "gcc";
      				block = "gbc";
    			};
    			opleader = {
      				line = "gc";
      				block = "gb";
    			};
		};
	};
}
