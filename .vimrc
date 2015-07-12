filetype on
syntax on
colorscheme desert
set background=dark
hi Comment ctermfg=darkred
hi String ctermfg=darkgreen
hi Constant ctermfg=darkgreen
hi LineNr ctermfg=lightgrey
hi ColorColumn ctermbg=black
let &colorcolumn=join(range(81,999),",")
hi WarningMsg ctermfg=red

hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
hi DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
" Automatically refresh a diff when either file is edited
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

set ic
set incsearch
set smartcase
set ruler
set showcmd
set nu

set expandtab
set smartindent
set ts=4
set sw=4

map <space> zz
map Y y$
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h
map <C-L> <C-W>l
map <F8> <C-N>
