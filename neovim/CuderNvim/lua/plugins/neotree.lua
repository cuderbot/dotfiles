return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main", -- HACK: force neo-tree to checkout `main` for initial v3 migration since default branch has changed
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Neotree",
  init = function() 
    vim.g.neo_tree_remove_legacy_commands = true
  end,
  opts = function()
    local opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = "" .. "File" },
          { source = "buffers", display_name = "󰈙" .. "Bufs" },
          { source = "git_status", display_name = "󰊢" .. "Git" },
          { source = "diagnostics", display_name = "󰒡" .. "Diagnostic" },
        },
      },
      default_component_configs = {
        indent = { padding = 0 },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "󰈙",
        },
        modified = { symbol = "" },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      commands = {
        -- system_open = function(state)
        --   -- TODO: just use vim.ui.open when dropping support for Neovim <0.10
        --   (vim.ui.open or require("astronvim.utils").system_open)(state.tree:get_node():get_id())
        -- end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
        -- copy_selector = function(state)
        --   local node = state.tree:get_node()
        --   local filepath = node:get_id()
        --   local filename = node.name
        --   local modify = vim.fn.fnamemodify
        --
        --   local vals = {
        --     ["BASENAME"] = modify(filename, ":r"),
        --     ["EXTENSION"] = modify(filename, ":e"),
        --     ["FILENAME"] = filename,
        --     ["PATH (CWD)"] = modify(filepath, ":."),
        --     ["PATH (HOME)"] = modify(filepath, ":~"),
        --     ["PATH"] = filepath,
        --     ["URI"] = vim.uri_from_fname(filepath),
        --   }

          -- local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
          -- if vim.tbl_isempty(options) then
          --   utils.notify("No values to copy", vim.log.levels.WARN)
          --   return
          -- end
          -- table.sort(options)
          -- vim.ui.select(options, {
          --   prompt = "Choose to copy to clipboard:",
          --   format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
          -- }, function(choice)
          --   local result = vals[choice]
          --   if result then
          --     utils.notify(("Copied: `%s`"):format(result))
          --     vim.fn.setreg("+", result)
          --   end
          -- end)
        -- end,
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          O = "system_open",
          Y = "copy_selector",
          h = "parent_or_close",
          l = "child_or_open",
          o = "open",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<C-j>"] = "move_cursor_down",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
      },
    }

    -- if utils.is_available "telescope.nvim" then
    --   opts.commands.find_in_dir = function(state)
    --     local node = state.tree:get_node()
    --     local path = node.type == "file" and node:get_parent_id() or node:get_id()
    --     require("telescope.builtin").find_files { cwd = path }
    --   end
    --   opts.window.mappings.F = "find_in_dir"
    -- end
    --
    -- if utils.is_available "toggleterm.nvim" then
    --   local toggleterm_in_direction = function(state, direction)
    --     local node = state.tree:get_node()
    --     local path = node.type == "file" and node:get_parent_id() or node:get_id()
    --     require("toggleterm.terminal").Terminal:new({ dir = path, direction = direction }):toggle()
    --   end
    --   local prefix = "T"
    --   ---@diagnostic disable-next-line: assign-type-mismatch
    --   opts.window.mappings[prefix] =
    --     { "show_help", nowait = false, config = { title = "New Terminal", prefix_key = prefix } }
    --   for suffix, direction in pairs { f = "float", h = "horizontal", v = "vertical" } do
    --     local command = "toggleterm_" .. direction
    --     opts.commands[command] = function(state) toggleterm_in_direction(state, direction) end
    --     opts.window.mappings[prefix .. suffix] = command
    --   end
    -- end

    return opts
  end,
}