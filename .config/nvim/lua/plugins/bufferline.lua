return {
	"akinsho/bufferline.nvim",
	config = function()
		bufferline = require("bufferline")

		bufferline.setup {
			options = {
				close_command = "bp|sp|bn|bd! %d",
				modified_icon = "",
				show_close_icon = false,
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 10,
				show_tab_indicators = true,
				indicator = {
					style = "underline",
				},
				enforce_regular_tabs = false,
				view = "multiwindow",
				show_buffer_close_icons = true,
				separator_style = "thin",
				always_show_bufferline = true,
				diagnostics = false,
				themable = true,
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold
				},
			},
		}

		local cache = {}
		local last_tab = 0

		local utils = {}

		utils.is_valid = function(buf_num)
			if not buf_num or buf_num < 1 then
				return false
			end

			local exists = vim.api.nvim_buf_is_valid(buf_num)

			return vim.bo[buf_num].buflisted and exists
		end

		utils.get_valid_buffers = function()
			local buf_nums = vim.api.nvim_list_bufs()
			local ids = {}
			for _, buf in ipairs(buf_nums) do
				if utils.is_valid(buf) then ids[#ids + 1] = buf end
			end
			return ids
		end

		local autocmd = vim.api.nvim_create_autocmd

		autocmd("TabEnter", {
			callback = function()
				local tab = vim.api.nvim_get_current_tabpage()
				local buf_nums = cache[tab]
				if buf_nums then
					for _, k in pairs(buf_nums) do
						vim.api.nvim_buf_set_option(k, "buflisted", true)
					end
				end
			end,
		})

		autocmd("TabLeave", {
			callback = function()
				local tab = vim.api.nvim_get_current_tabpage()
				local buf_nums = utils.get_valid_buffers()
				cache[tab] = buf_nums
				for _, k in pairs(buf_nums) do
					vim.api.nvim_buf_set_option(k, "buflisted", false)
				end
				last_tab = tab
			end,
		})

		autocmd("TabClosed", {
			callback = function()
				cache[last_tab] = nil
			end
		})

		autocmd("TabNewEntered", {
			callback = function()
				vim.api.nvim_buf_set_option(0, "buflisted", true)
			end,
		})

		local map = vim.keymap.set

		map("n", "<leader>k", "<cmd> enew <CR>")
		map("n", "<leader>l", "<cmd> BufferLineCycleNext <CR>")
		map("n", "<leader>h", "<cmd> BufferLineCyclePrev <CR>")
		map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>")
	end,
}
