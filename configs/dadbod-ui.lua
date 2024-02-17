vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_table_helpers = {
  postgresql = {
    Count = 'select count(*) from "{table}"',
    List = 'select * from "{table}" order by id asc limit 10',
  },
}
vim.cmd { cmd = "Dotenv", args = {
  vim.fn.stdpath "config" .. "/lua/custom",
} }
