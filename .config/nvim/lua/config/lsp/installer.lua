local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

require("mason").setup()

mason_lspconfig.setup {
  ensure_installed = {
    -- "sumneko_lua",
    "tsserver",
    "eslint",
    "jsonls",
    "yamlls",
    "emmet_ls"
  }
}

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup(opts)
  end,

  ["jsonls"] = function ()
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	local server_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)

    require("lspconfig")["jsonls"].setup(server_opts)
  end,

  -- ["sumneko_lua"] = function ()
	 -- 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 -- 	local server_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  --
  --   require("lspconfig")["sumneko_lua"].setup(server_opts)
  -- end,

  ["pyright"] = function ()
	 	local pyright_opts = require("user.lsp.settings.pyright")
	 	local server_opts = vim.tbl_deep_extend("force", pyright_opts, opts)

    require("lspconfig")["pyright"].setup(server_opts)
  end
}
