local status, surround = pcall(require, "nvim-surround")
if not status then
	return
end

surround.setup({})

-- use :h nvim-surround.usage to know how to use this plugin
