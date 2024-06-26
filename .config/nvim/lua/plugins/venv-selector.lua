return {
  "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig", 
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
      require("venv-selector").setup {
      settings = {
        search = {
          poetry_venvs = {
            command = "fd /bin/python$ ~/.cache --full-path -H"
          },
          local_venvs = {
            command = "fd /bin/python$ ~/Git --full-path -H"
          }
        }
      }
    }
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
}
