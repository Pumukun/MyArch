function change_color_scheme(scheme, bg_color)
	vim.cmd('colorscheme ' .. scheme)
	vim.cmd('set background=' .. bg_color)
end
