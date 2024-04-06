local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

local status, notify = pcall(require, "notify")
if not status then
    return
end

notify.setup({
    background_colour = "#000000",
    icons = nonicons_extention.icons,
    render = "compact"
})


vim.keymap.set('n', '<leader>di', function () notify.dismiss() end, { noremap = true, silent = true })
