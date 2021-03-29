"" Last update: 26.03.2021 17:26
set shiftwidth=4                                    " размер отступов
set tabstop=4                                       " ширина табуляции
set number
set linebreak                                       " переносить целые слова
set mouse=a                                         " включает поддержку мыши при работе в терминале
set showmatch
set clipboard=unnamed,unnamedplus                  "глобальный буфер обмена
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
        
set ignorecase  									" поиск без учёта регистра символов
set nohlsearch
set incsearch 									   	" поиск фрагмента по мере набора
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>

"set foldenable 									" включить фолдинг
"set foldmethod=syntax                              " определять блоки на основе синтаксиса файла
"set foldcolumn=3                                   " показать полосу для управления сворачиванием
set foldopen=all                                    " автоматическое открытие сверток при заходе в них

autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))
syntax on                                           " включить подсветку синтаксиса
set expandtab 					                    " преобразовать табуляцию в пробелы
set smartindent                                     " Умные отступы (например, автоотступ после {)
set autoindent                                      " ai - включить автоотступы (копируется отступ предыдущей строки)

call pathogen#infect()                              " pathogen turn on

function! VisualSearch()
   let l:old_reg=getreg('"')
   let l:old_regtype=getregtype('"')
   normal! gvy
   let @/=escape(@@, '$.*/\[]')
   normal! gV
   call setreg('"', l:old_reg, l:old_regtype)
endfunction

" F11 - включить-выключить нумерацию строк
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>

filetype plugin indent on
autocmd FileType c set omnifunc=ccomplete#Complete

augroup Systemverilog
    autocmd!
    autocmd FileType systemverilog setlocal omnifunc=syntaxcomplete#Complete
augroup END

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
map <F2> :Explore<CR>
map й q
map ц w
map ш i
map щ o
map Ж :
cnoreabbrev цй wq
cnoreabbrev й! q!
