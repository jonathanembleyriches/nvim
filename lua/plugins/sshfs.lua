return {
  'nosduco/remote-sshfs.nvim',
  config = function()
    require('remote-sshfs').setup{
      connections = {
        ssh_configs = {
          vim.fn.expand "$HOME" .. "/.ssh/config",
        },
        sshfs_args = {
          "-o reconnect",
          "-o ConnectTimeout=5",
        },
      },
      mounts = {
        base_dir = vim.fn.expand "$HOME" .. "/.sshfs/",
        unmount_on_exit = true,
      },
      handlers = {
        on_connect = {
          change_dir = true,
        },
        on_disconnect = {
          clean_mount_folders = false,
        },
      },
      ui = {
        select_prompts = false,
        confirm = {
          connect = false,  -- Disable the confirmation prompt
          change_dir = false,
        },
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          util = false,
          handler = false,
          sshfs = false,
        },
      },
    }
  end
}

