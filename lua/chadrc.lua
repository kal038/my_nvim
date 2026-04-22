-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  transparency = true,
  theme = "rosepine",
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    modules = {
      -- Override the built-in 'file' module
      file = function()
        local path = vim.api.nvim_buf_get_name(0)
        local display_path = path == "" and "[No Name]" or vim.fn.fnamemodify(path, ":.")

        -- Pull from nvconfig instead of hardcoding, preserving your current separator style
        local config = require("nvconfig").ui.statusline
        local utils = require "nvchad.stl.utils"

        local sep_style = config.separator_style
        local separators = (type(sep_style) == "table" and sep_style) or utils.separators[sep_style]
        local sep_r = separators and separators["right"] or ""

        -- %#St_file# applies the theme's background/foreground for this block
        return "%#St_file#  󰈔 " .. display_path .. " %#St_file_sep#" .. sep_r
      end,
    },
  },
}
return M
