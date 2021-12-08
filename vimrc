"" Last update: 01.12.2021 11:11

set wrap
set shiftround
set shiftwidth=0
set tabstop=4
set hlsearch
set incsearch
set ignorecase
set number
set linebreak
set mouse=a
set showmatch
set expandtab
set autoindent
set foldopen=all
syntax on

autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))

let mapleader = ","
noremap <leader>z ddp
noremap <leader>Z ddkP
inoremap <c-u> <esc>viwUi
nnoremap <leader><c-u> viwU
inoremap <c-d> dd

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>y<right>`>p
vnoremap <leader>' <esc>`<i'<esc>y<right>`>p

" grep
nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>m :cprevious<cr>

inoremap jk <esc>

map <f2> :Explore<cr>
autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>

set laststatus=2
set statusline=%F
set statusline=%.30F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L

set clipboard=unnamed,unnamedplus                   "глобальный буфер обмена
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

call pathogen#infect()

filetype plugin indent on
autocmd FileType c set omnifunc=ccomplete#Complete

augroup Systemverilog
    autocmd!
    autocmd FileType systemverilog setlocal omnifunc=syntaxcomplete#Complete
augroup END

autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead *.scons    set filetype=python

source ~/.vim/plugin/grep_operator.vim
source ~/.vim/plugin/c_rules.vim
source ~/.vim/plugin/python_rules.vim
source ~/.vim/plugin/markdown_rules.vim
source ~/.vim/abbreviations.vim
source ~/.vim/russian_aliases.vim
