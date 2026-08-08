local jdtls = require 'jdtls'

-- Find Mason's install path
local mason_path = vim.fn.stdpath 'data' .. '/mason/packages'
local jdtls_path = mason_path .. '/jdtls'

-- Lombok path
local lombok_path = vim.fn.expand '$MASON/share/jdtls/lombok.jar'

-- Determine OS-specific config
local os_config = 'linux'
if vim.fn.has 'macunix' == 1 then
  os_config = 'mac'
elseif vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
  os_config = 'win'
end

-- Project-specific workspace (prevents projects from interfering)
local project_name = vim.fn.fnamemodify(jdtls.setup.find_root { '.git', 'gradlew', 'mvnw' }, ':p:h:t')
local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls-workspace/' .. project_name

local config = {
  cmd = {
    'java',
    '-javaagent:' .. lombok_path,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    jdtls_path .. '/config_' .. os_config,
    '-data',
    workspace_dir,
  },

  root_dir = jdtls.setup.find_root { '.git', 'gradlew', 'mvnw' },

  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,

  settings = {
    java = {
      configuration = {
        runtimes = {
          -- Add your Java installations here if needed
          -- {
          --   name = "JavaSE-17",
          --   path = "/path/to/jdk-17",
          -- },
        },
      },
    },
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
