return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			keymap = { preset = "super-tab" },

			cmdline = {
				enabled = true,
			},

			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				trigger = {
					show_in_snippet = true,
				},
				accept = { auto_brackets = { enabled = true } },

				documentation = {
					auto_show = true,
				},

				list = {
					selection = { preselect = true },
				},

				ghost_text = { enabled = false },
			},

			-- experimental signature help support
			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" },

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },

				providers = {
					-- dont show LuaLS require statements when lazydev has items
					-- lsp = { fallbacks = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
		},

		opts_extend = { "sources.default" },
	},
}
