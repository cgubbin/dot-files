{
	programs.nixvim.plugins.neo-tree = {
		enable = true;
        settings = {
            filesystem = {
                follow_current_file.enabled = true;
                hijack_netrw_behaviour = "open_default";
            };
        };
    };
}
