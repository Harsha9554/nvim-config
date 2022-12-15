local status, git = pcall(require, "git")
if not status then
	return
end

git.setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})

local status, gitsigns = pcall(require, "gitsigns")
if not status then
	return
end

gitsigns.setup({})
