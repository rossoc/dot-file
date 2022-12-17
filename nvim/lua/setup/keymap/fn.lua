function compile()
    if (vim.bo.filetype == 'rust' ) 
        then ans = "!(cd "..vim.fn.expand('%:p:h').." && rustc " 
	elseif (vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c')
		then ans = cpp("compile")
	elseif (vim.bo.filetype == 'tex')
		then ans = "!(cd "..vim.fn.expand('%:p:h').." && pdflatex " -- nb consiglio di compilare il file nella direcotory giusta
	elseif (vim.bo.filetype == 'go')
		then ans = "!(cd "..vim.fn.expand('%:p:h').." && go build "
	elseif (vim.bo.filetype == 'python')
		then return
	else
		ans = "make "
    end        

	ans = ans..vim.fn.expand('%:p')

	if (vim.bo.filetype == 'rust' or vim.bo.filetype == 'go' or vim.bo.filetype == 'tex')
		then ans = ans..")"
	end
	vim.api.nvim_command(ans)
end

function make(opt) 
    compile();
	if (vim.bo.filetype == 'python')
		then ans = "!python3 "
	else
		ans = cpp(opt)
	end
    vim.api.nvim_command(ans..vim.fn.expand('%:p'))
end

function cpp(opt)
	return ":!make -f /Users/carlorosso/.config/Makefile "..opt.." arg="
end
