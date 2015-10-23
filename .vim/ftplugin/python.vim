" Hack to keep smartindent from moving python comments all the way to the left
inoremap # x<bs>#

" Comment/uncomment the current line
nnoremap <buffer> <localleader>c 0i#<esc>
nnoremap <buffer> <localleader>C 0x<esc>

iabbrev <buffer> def def ():<cr>"""<cr>"""<up><up>

