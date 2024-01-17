return {
  {
    "mfussenegger/nvim-dap-python",
  -- stylua: ignore
    config = function()
      require('dap.ext.vscode').load_launchjs()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
      -- table.insert(require('dap').configurations.python, {
      --   type = 'python',
      --   request = 'launch',
      --   name = 'FastAPI',
      --   cwd = '${workspaceFolder}',
      --   program = '${file}',
      --   python = "/Users/minowak/miniforge3/envs/street-beat-fastapi/bin/python",
      --   env = {
      --     DEVELOPMENT_ENV=true,
      --     GOOGLE_APPLICATION_CREDENTIALS="/Users/minowak/gcp_keys/gcp-credentials-staging.json",
      --     OPENAI_API_KEY="dsadsadsa",
      --     PYTHONUNBUFFERED=1
      --   }
      --   -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      -- })
    end,
  },
}
