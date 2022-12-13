local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions
local z_utils = require("telescope._extensions.zoxide.utils")

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        --        dynamic_preview_title = true,
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            theme = "dropdown",
            previewer = false
        }
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
            },
        },
        zoxide = {
            prompt_title = "[ Z Jump ]",
            mappings = {
                default = {
                    after_action = function(selection)
                        print("Update to (" .. selection.z_score .. ") " .. selection.path)
                    end
                },
                ["<C-s>"] = {
                    before_action = function(selection) print("before C-s") end,
                    action = function(selection)
                        vim.cmd("edit " .. selection.path)
                    end
                },
                -- Opens the selected entry in a new split
                ["<C-q>"] = { action = z_utils.create_basic_command("split") },
            },
        },
    },
}

vim.keymap.set("n", "<leader>tb", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
    })
end)
vim.keymap.set("n", "<leader>tz", require("telescope").extensions.zoxide.list)

telescope.load_extension("file_browser")
telescope.load_extension("zoxide")
