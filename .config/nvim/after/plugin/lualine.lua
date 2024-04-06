local status, lualine = pcall(require, "lualine")
if not status then
    return
end
local icons = require("nvim-nonicons")
local nonicons_extention = require("nvim-nonicons.extentions.lualine")
require("lualine").setup({
    sections = {
        lualine_a = { nonicons_extention.mode, {
            'filename',
            file_status = true,     -- displays file status (readonly status, modified status)
            path = 1                -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_z = {
            {
                "branch",
                icon = icons.get("git-branch"),
            },
        },
    }
})
