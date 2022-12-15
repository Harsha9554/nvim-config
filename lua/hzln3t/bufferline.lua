local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

local highlights = {
	["gruvbox-highlight"] = {
		fill = {
			bg = "#3c3836",
		},
	},
}

bufferline.setup({
	highlights = highlights["gruvbox-highlight"],
	options = {
		mode = "tabs",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		show_buffer_icons = false,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
	},
})
