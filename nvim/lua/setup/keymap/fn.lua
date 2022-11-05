function compile()
    local ans = "make -f /Users/carlorosso/.config/Makefile ";
    if (vim.bo.filetype == 'rust' ) 
        then ans = "rustc " 
    elseif (vim.bo.filetype == 'cpp' ) 
        then ans = ans.."compile arg=";
    end        
    --print(ans..vim.fn.expand('%:p'));
    vim.api.nvim_command("! "..ans..vim.fn.expand('%:p'))
end

function make(opt) 
    compile();
    vim.api.nvim_command("! make -f /Users/carlorosso/.config/Makefile "..opt.." arg="..vim.fn.expand('%:p'))
end
