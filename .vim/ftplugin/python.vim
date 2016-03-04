" Hack to keep smartindent from moving python comments all the way to the left
inoremap # x<bs>#

" Comment/uncomment the current line
nnoremap <buffer> <localleader>c 0i#<esc>
nnoremap <buffer> <localleader>C 0x<esc>

" Run tests in working directory
nnoremap <buffer> <localleader>t :!python -m unittest discover<cr>
