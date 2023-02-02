function compile()
    if (vim.bo.filetype == 'rust' ) 
        then ans = "!cd "..vim.fn.expand('%:p:h').." && rustc "
	elseif (vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c')
		then ans = ":!make -f /Users/carlorosso/.config/Makefile compile arg="
	elseif (vim.bo.filetype == 'tex')
		then ans = "!cd "..vim.fn.expand('%:p:h').." && pdflatex "
	elseif (vim.bo.filetype == 'go')
		then ans = "!cd "..vim.fn.expand('%:p:h').." && go build "
	elseif (vim.bo.filetype == 'python')
		then ans = "!cd "..vim.fn.expand('%:p:h').."&& python "
	end
	vim.api.nvim_command(ans..fname())
end

function make(opt) 
	compile();
	if (vim.bo.filetype == 'python')
		then ans = "!python3 "
	else
		ans = ":!make -f /Users/carlorosso/.config/Makefile "..opt.." arg="
	end
	vim.api.nvim_command(ans..fname())
end

function fname()
	return vim.fn.expand('%:p')
end
