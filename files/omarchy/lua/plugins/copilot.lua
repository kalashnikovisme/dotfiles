return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = function(_, opts)
      opts = opts or {}
      opts.suggestion = opts.suggestion or {}
      opts.suggestion.enabled = true
      if opts.suggestion.auto_trigger == nil then
        opts.suggestion.auto_trigger = true
      end
      opts.suggestion.keymap = opts.suggestion.keymap or {}
      opts.suggestion.keymap.accept = false
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = opts.mapping or {}

      local has_luasnip, luasnip = pcall(require, "luasnip")

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then
          return false
        end
        local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
        return current_line:sub(col, col):match("%s") == nil
      end

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        local copilot_ok, copilot = pcall(require, "copilot.suggestion")
        if copilot_ok and copilot.is_visible() then
          local accepted = copilot.accept()
          if accepted then
            return
          end
        end
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_luasnip and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
}

