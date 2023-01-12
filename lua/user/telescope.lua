local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print 'TELESCOPE ERROR'
  return
end

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
require("telescope").load_extension("ui-select")
