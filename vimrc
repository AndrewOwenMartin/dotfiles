set nocompatible

" vim: set filetype=vim:
set autoindent

set wildmenu
set showcmd
set ruler
set mouse=

" Experimenting with 'hiding' buffers rather than closing them
set hidden


" More history and undo levels
set history=1000
set undolevels=1000

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Underline current line
" set cursorline

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
" nnoremap j gj
" nnoremap k gk

" don't update screen when playing macro
set lazyredraw

" Experimenting with no (purely cosmetic) wrapping
" set nowrap

" Jump one character at a time when line scrolling
set sidescroll=1
" Start scrolling when 10 chars away from the edge
"set sidescrolloff=10
set listchars+=precedes:<,extends:>,tab:>-,nbsp:~,trail:_

" Press F2 in insertmode to toggle smartindent on paste
set pastetoggle=<F2>
set timeoutlen=1000 ttimeoutlen=0

" Case insensitive search unless mixed case search string
set ignorecase
set smartcase

" enable modeline
" set modeline
" set modelines=5

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set statusline+=%#warningmsg#
set statusline+=%*

" " let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1
" " let g:syntastic_java_checker = 'javac' "deprecated
" let g:syntastic_java_javac_config_file_enabled=1
" let g:syntastic_mode_map={ 'mode': 'passive',
"     \ 'active_filetypes': ["tex","java","json","javascript"],
"     \ 'passive_filetypes': [] }

" disable JSONsyntax highlighting's disagreeable quote hiding.
let g:vim_json_syntax_conceal = 0

" Always display a status line at the bottom of the window
set laststatus=2

" Pythonic Tab style , not Linux Kernal, so choose.
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab 

"set noexpandtab
set smarttab

" === Backup and recovery behaviour ===
" delete old backup, backup current file. 
set writebackup
set backup
" put both backups and swap files in ~/.vim/swap ~/.vim/backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" set backspace behaviour
" allow backspacing to write over
" indent = indents
" eol = previous line
" start = start of current buffer
set backspace=start,eol,indent
"
" use UK English for spelling
set spelllang=en_gb

" Ensure syntax hilighting is on
syntax on

" Search term highlighting on
set hlsearch

" Handle typos when writing and quitting
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Load pathogen and cyntaxcomplete
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" call pathogen#infect()

" """""""""""""""""""""""
" """""""""""""""""""""""

let noweb_backend="tex"
let noweb_language="python"
au BufEnter *.nw set filetype=noweb

" """""""""""""""""""""""
" """""""""""""""""""""""

" Indicate the syntaxtype of various files
au BufNewFile,BufRead *.sage setfiletype python
au BufNewFile,BufRead *.pde setfiletype java
au BufNewFile,BufRead *.maxima setfiletype maxima
au BufNewFile,BufRead *.email setfiletype mail
" au BufNewFile *.email 0r ~/templates/email.email
" au BufNewFile *.java 0r ~/templates/java.java
au FileType make
    \ setlocal noexpandtab shiftwidth=8 softtabstop=0

au FileType python,java,vim 
	\ setlocal colorcolumn=+1 tabstop=4 nospell

au FileType text,tex
	\ setlocal spelllang=en_gb

au FileType text,mail,tex,plaintex
	\ setlocal spell linebreak textwidth=0

au FileType json
	\ setlocal textwidth=0 linebreak tabstop=2 shiftwidth=2 breakindent

au filetype noweb
    \ setlocal keywordprg=pydoc3 linebreak

" w3m temp files to be treated as plain text
au BufRead w3mtmp* setfiletype text

" highlight 80th column.
" :set textwidth=79
" :set colorcolumn=+1


:command -range=% HTML execute "<line1>,<line2>! w3m -dump -T text/html"

