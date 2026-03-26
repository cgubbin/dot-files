{
  config,
  pkgs,
  ...
}: let
  helpers = config.lib.nixvim;
in {
  programs.nixvim = {
    plugins.neotest = {
      enable = true;
      autoLoad = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      neotest-python
    ];

    extraConfigLua = ''
      local neotest_setup_done = false

      local function project_root(markers)
        local path = vim.fn.expand("%:p:h")
        if path == "" then
          path = vim.loop.cwd()
        end

        local found = vim.fs.find(markers, {
          upward = true,
          path = path,
        })[1]

        if found then
          return vim.fs.dirname(found)
        end

        return vim.loop.cwd()
      end

      local function python_root()
        return project_root({ "pyproject.toml", ".git", "flake.nix" })
      end

      local function setup_neotest()
        if neotest_setup_done then
          return
        end
        neotest_setup_done = true

        require("neotest").setup({
          adapters = {
            require("rustaceanvim.neotest"),
            require("neotest-python")({
              runner = "pytest",
              python = function()
                local root = python_root()
                return "direnv exec " .. vim.fn.shellescape(root) .. " python"
              end,
              pytest_discover_instances = true,
            }),
          },
          quickfix = {
            enabled = false,
          },
          output = {
            enabled = true,
            open_on_run = false,
          },
          output_panel = {
            enabled = true,
            open = "botright split | resize 12",
          },
          summary = {
            enabled = true,
            animated = false,
            follow = true,
          },
          status = {
            enabled = true,
            virtual_text = true,
          },
          icons = {
            child_indent = "│",
            child_prefix = "├",
            collapsed = "─",
            expanded = "╮",
            failed = "✖",
            final_child_indent = " ",
            final_child_prefix = "╰",
            non_collapsible = "─",
            passed = "✔",
            running = "⟳",
            skipped = "○",
            unknown = "?",
          },
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "rust", "python" },
        callback = function()
          setup_neotest()
        end,
      })
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>tn";
        action = helpers.mkRaw ''function() require("neotest").run.run() end'';
        options.desc = "Run nearest test";
      }
      {
        mode = "n";
        key = "<leader>tf";
        action = helpers.mkRaw ''function() require("neotest").run.run(vim.fn.expand("%")) end'';
        options.desc = "Run file tests";
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = helpers.mkRaw ''function() require("neotest").summary.toggle() end'';
        options.desc = "Toggle test summary";
      }
      {
        mode = "n";
        key = "<leader>to";
        action = helpers.mkRaw ''function() require("neotest").output.open({ enter = true }) end'';
        options.desc = "Open test output";
      }
      {
        mode = "n";
        key = "<leader>tO";
        action = helpers.mkRaw ''function() require("neotest").output_panel.toggle() end'';
        options.desc = "Toggle test output panel";
      }
      {
        mode = "n";
        key = "<leader>tr";
        action = helpers.mkRaw ''function() require("neotest").run.run_last() end'';
        options.desc = "Re-run last test";
      }
      {
        mode = "n";
        key = "<leader>tx";
        action = helpers.mkRaw ''function() require("neotest").run.stop() end'';
        options.desc = "Stop test";
      }
    ];
  };
}
