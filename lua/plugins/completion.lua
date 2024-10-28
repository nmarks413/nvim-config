return {
  {
    --Snippet manager
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- {
  -- 	--completion engine
  -- 	"hrsh7th/nvim-cmp",
  -- 	dependencies = {
  -- 		"hrsh7th/cmp-nvim-lsp",
  -- 		"hrsh7th/cmp-buffer",
  -- 		"hrsh7th/cmp-path",
  -- 	},
  -- 	event = "InsertEnter",
  -- 	config = function()
  -- 		-- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  -- 		local cmp = require("cmp")
  -- 		cmp.setup({
  -- 			window = {
  -- 				documentation = cmp.config.window.bordered(),
  -- 				completion = cmp.config.window.bordered(),
  -- 			},
  -- 			completion = {
  -- 				completeopt = "menu, menuone, noinsert, noselect",
  -- 			},
  -- 			snippet = {
  -- 				expand = function(args)
  -- 					require("luasnip").lsp_expand(args.body)
  -- 				end,
  -- 			},
  -- 			mapping = cmp.mapping.preset.insert({
  -- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
  -- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
  -- 				["<C-Space>"] = cmp.mapping.complete(),
  -- 				["<C-e>"] = cmp.mapping.abort(),
  -- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
  -- 			}),
  -- 			--add new sources here
  -- 			sources = cmp.config.sources({
  -- 				{ name = "lazydev" },
  -- 				{ name = "nvim_lsp" },
  -- 				{ name = "luasnip" },
  -- 				{ name = "path" },
  -- 			}, {
  -- 				{ name = "buffer" },
  -- 			}),
  -- 			-- experimental = {
  -- 			-- 	ghost_text = {
  -- 			-- 		hl_group = "CmpGhostText",
  -- 			-- 	},
  -- 			-- },
  -- 		})
  -- 	end,
  -- },
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },

      -- experimental signature help support
      trigger = { signature_help = { enabled = true } }
    }
  }
}
