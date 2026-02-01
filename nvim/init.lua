
require("plugins.plugins-setup")
require("core.options")
-- 插件
require("plugins.lualine")
require("plugins/nvim-tree")
require("plugins.coc")
local keyset = vim.keymap.set

-- 1. 使用 Tab 键在补全列表中向下切换
-- 如果没有弹出菜单，则输入 Tab 字符
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 2. 使用回车 <CR> 确认补全
-- 只有在菜单可见且选中项时才确认，否则换行
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

