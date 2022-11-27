function compile()
    if (vim.bo.filetype == 'rust' ) 
        then ans = "!rustc " 
	elseif (vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c')
		then ans = "!make -f /Users/carlorosso/.config/Makefile arg="
	elseif (vim.bo.filetype == 'tex')
		then ans = "!pdflatex " -- nb consiglio di compilare il file nella direcotory giusta
	elseif (vim.bo.filetype == 'go')
		then ans = "!go build "
	elseif (vim.bo.filetype == 'python')
		then return
	else
		ans = "make "
    end        
    vim.api.nvim_command(ans..vim.fn.expand('%:p'))
end

function make(opt) 
    compile();
	if (vim.bo.filetype == 'python')
		then ans = "!python3 "
	else
		ans = "! make -f /Users/carlorosso/.config/Makefile "..opt.." arg="
	end
    vim.api.nvim_command(ans..vim.fn.expand('%:p'))
end
