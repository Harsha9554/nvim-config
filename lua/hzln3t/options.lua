local options = {
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	showtabline = 4,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h17",
	shell = "zsh",
	wrap = false,

	-- disable additional junk files
	swapfile = false,
	backup = false,
	writebackup = false,
}

vim.opt.shortmess:append "c"
vim.g.netrw_banner=0

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- auto-refresh
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- vim.cmd [[set g:netrw_banner=0]]
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
