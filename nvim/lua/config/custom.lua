vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if arg and vim.fn.isdirectory(arg) == 1 then
			-- Clean up any stale swap files for the directory
			local swap_file = vim.fn.fnamemodify(arg, ":p")
			local swap_path = vim.fn.fnamemodify(swap_file, ":h") .. "/.local/state/nvim/swap/%" .. vim.fn.fnamemodify(swap_file, ":t") .. ".swp"
			if vim.fn.filereadable(swap_path) == 1 then
				vim.fn.delete(swap_path)
			end
			-- Schedule the Dired command to run after VimEnter completes
			vim.schedule(function()
				vim.cmd("Dired " .. vim.fn.fnameescape(arg))
			end)
		end
	end,
})
