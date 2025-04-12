return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		--local defaults = require("formatter.defaults")
		--local js_ts_filetype = { defaults.eslint_d, defaults.prettierd }

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort", "ruff" },
				go = { "goimports", "gofmt" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
