"set t_Co=256
set sessionoptions-=help
let g:loaded_session = 1
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_directory = '~/.vim/session'

set backupdir=~/.backup/vim
set nocompatible

set ruler
set showcmd
set incsearch

set tabstop=4
set shiftwidth=4

set showmatch
set number

autocmd BufWritePre * :%s/\s\+$//e

filetype plugin on

au BufRead,BufNewFile ~/.zhengkai,~/.zhengkai_alias set filetype=sh

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

hi clear
"hi Comment  ctermfg=244
"hi Define   ctermfg=LightGreen

"hi String   ctermfg=46
"hi Boolean  ctermfg=LightCyan
"hi Number   ctermfg=LightCyan
"hi Float    ctermfg=LightCyan
"hi phpInclude ctermfg=LightGreen
"hi phpParent ctermfg=LightMagenta

"if [ "$TERM" = "xterm-256color" ]
if &t_Co == 256
	colorscheme desert256
	hi LineNr   ctermbg=232 ctermfg=246
	hi Pmenu    ctermbg=235
	hi PmenuSel ctermbg=237
	hi phpComment ctermfg=251 ctermbg=236
	hi phpFunctions ctermfg=45
	hi phpClassesTag cterm=bold ctermfg=219
	hi phpFunctionsTag cterm=bold ctermfg=75
endif

set cursorline
hi CursorLine cterm=NONE ctermbg=234

set laststatus=2
set numberwidth=6
set sidescrolloff=10

hi StatusLine ctermfg=0 ctermbg=32 cterm=NONE

function! FileSize()
	let bytes = getfsize(expand("%:p"))
	return ' [filesize=' . bytes . ']'
endfunction

set statusline=%t\ \ \    "tail of the filename
set statusline+=%P\ %4l\ \ \   "percent through file
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]   "file format
set statusline+=\ %h      "help file flag
set statusline+=\ %m      "modified flag
set statusline+=\ %r      "read only flag
set statusline+=\ %y      "filetype
set statusline+=%{FileSize()}
set statusline+=%=      "left/right separator
set statusline+=[\ X\ =\ %c\,\ Y\ =\ %l\ /\ %L\ ]     "cursor column
set statusline+=   "cursor line/total lines

set tags=~/.vimtags,~/tags
let g:easytags_always_enabled = 1

set undodir=~/.vim/undo
set undofile

if filereadable(expand('~/.vim/after/completion.vim'))
	source ~/.vim/after/completion.vim
endif

au FileType php,css,js so ~/.vim/autocomplete.vim
au FileType css set omnifunc=csscomplete#CompleteCSS

au BufRead *.php,*.css,*.js,*.html,*.txt,*.conf,*.ini set fileformat=unix

nmap <F1> <nop>

