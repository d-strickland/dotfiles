let mapleader = ","
let maplocalleader = ";"

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

" .vimrc Meta Settings {{{
" Easy access to this file
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>cv :source $MYVIMRC<cr>:wq<cr>
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <localleader>ws :write<cr>:source %<cr>
augroup END
" }}}

" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'scrooloose/syntastic'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim.git'
Plugin 'tpope/vim-vinegar.git'
Plugin 'Scuilion/gradle-syntastic-plugin'
Plugin 'tpope/vim-dispatch'
Plugin 'tfnico/vim-gradle'

call vundle#end()
" }}}

" Syntax Highlighting {{{
syntax on
filetype plugin indent on
colorscheme desert
set background=dark
highlight Comment ctermfg=darkred
highlight String ctermfg=darkgreen
highlight Constant ctermfg=darkgreen
highlight LineNr ctermfg=lightgrey
highlight ColorColumn ctermbg=black
" let &colorcolumn=join(range(81,999),",")
highlight WarningMsg ctermfg=red
highlight Folded ctermfg=lightgrey
highlight Search cterm=NONE ctermfg=grey ctermbg=darkblue
" }}}

" Statusline {{{
set laststatus=2            " Always show status line

set statusline=%f           " Relative path to file
set statusline+=\ %y        " Filetype
set statusline+=[%{&ff}]    " File format
set statusline+=%h          " Help file flag
set statusline+=%m          " Modified flag
set statusline+=%r          " Read only flag
set statusline+=%=          " Left/right separator
set statusline+=%c,         " Cursor column
set statusline+=%l\ of\ %L  " Cursor line/total lines
set statusline+=\ \(%P\)    " Percent through file
" }}}

" Misc. Global Settings {{{
set ignorecase  " Ignore case in searches unless a capital letter is included.
set smartcase   " Both ignorecase and smartcase must be set.
set incsearch
set gdefault
set showmatch
set nohlsearch
set showcmd
set number

set expandtab
set smartindent
set ts=4
set sw=4

set modelines=0

set encoding=utf-8
set scrolloff=2
set autoindent
set showmode
set hidden
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1

let g:netrw_winsize = 20
"}}}

" General Mappings {{{
" zz is hard to press and space is too good of real estate to shadow l
nnoremap <space> zz

" Make Y consistent with how D and C behave. Use yy to yank a line.
nnoremap Y y$

" Avoid the escape key at all costs
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
vnoremap v <esc>
vnoremap <esc> <nop>

" Get around OS mapping of <c-v>
nnoremap <c-b> <c-v>

" <c-u> to capitalize the current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Open a split containing the previous buffer.
nnoremap <leader>sp :execute "rightbelow split " . bufname("#")<CR>

" Seek and destroy trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :%s/\v\s+$//<cr>:let @/=''<cr>

" Normal regex search
nnoremap / /\v
vnoremap / /\v

" Quickfix shortcuts
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>co :copen 5<cr>
nnoremap <leader>cc :cclose<cr>

" Location list shortcuts
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>
nnoremap <leader>lo :lopen 3<cr>
nnoremap <leader>ll :lopen 3<cr>
nnoremap <leader>lc :lclose<cr>

nnoremap <tab> %
vnoremap <tab> %

"Save on losing focus from vim.
au FocusLost * :wa

nnoremap <f8> :Dispatch<cr>
" }}}

" Window Navigation {{{

" MaximizeWithoutResizingQuickfix
" Barry Arthur, 2012 08 14
" A solution not using vimple

function! MaximizeWithoutResizingQuickfix()
  let qfwnr = get(get(filter(map(range(1,winnr('$')), '[v:val, getwinvar(v:val, "&buftype")]'), 'v:val[1] =~ "quickfix"'), 0, []), 0, -1)
  let qfh = winheight(qfwnr)
  wincmd _
  if qfwnr != -1
    exe qfwnr . "wincmd w"
    exe "resize " . qfh
    wincmd p
  endif
endfunction

" Two-keystroke window switching
nnoremap <silent> <c-j> <c-w>j:call MaximizeWithoutResizingQuickfix()<cr>
nnoremap <silent> <c-k> <c-w>k:call MaximizeWithoutResizingQuickfix()<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" }}}

" Toggle paste mode automatically {{{
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" }}}

" HTML Settings {{{
" HTML folding
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" Markdown Settings {{{
augroup filetype_md
    autocmd!
    autocmd FileType modula2 nnoremap <buffer> <localleader>u= yypVr=
    autocmd FileType modula2 nnoremap <buffer> <localleader>u- yypVr-
augroup END
" }}}

" Vimdiff Settings {{{
hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
hi DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
augroup vimdiff
    autocmd!
    " Automatically refresh a diff when either file is edited
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif
augroup END
" }}}

" Syntastic Settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
" }}}

