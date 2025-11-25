{
	programs.nixvim.plugins.oil = {
		enable = true;
		settings = {
			view_options.show_hidden = true;
			skip_confirm_for_simple_edits = true;
			win_options = {
      				wrap = false;
      				signcolumn = "no";
      				cursorcolumn = false;
      				foldcolumn = "0";
      				spell = false;
      				list = false;
      				conceallevel = 3;
      				concealcursor = "ncv";
    			};
			keymaps = {
				"y." = "actions.copy_entry_path";
			};
		};
	};
}
