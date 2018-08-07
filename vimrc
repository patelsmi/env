set nocompatible              " be iMproved, required
filetype off                  " required





"--------VUNDLE SETUP AND PLUGINS--------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Powerful auto completion engines
Plugin 'Valloric/YouCompleteMe'

" Static syntax checkers in this suite
Plugin 'Scrooloose/syntastic'

" File / function accessability
Plugin 'scrooloose/nerdtree'

" Visualization of the bottom line
Plugin 'bling/vim-airline'

Plugin 'mbbill/undotree'

" Git accessability from within vim
" Plugin 'tpope/vim-fugitive'

" taglist (and function list)
" Plugin 'vim-scripts/taglist.vim'

" PyFlakes
"Plugin 'andviro/flake8-vim'
Plugin 'nvie/vim-flake8'

" Pathogen - testing to see if this resolves flake8 path issue
Plugin 'tpope/vim-pathogen'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"function! SetupPluginMaps()
"    if exists(":Tabularize")
"        nmap <Leader>a= :Tabularize /=<CR>
"        vmap <Leader>a= :Tabularize /=<CR>
"        nmap <Leader>a: :Tabularize /:<CR>
"        vmap <Leader>a: :Tabularize /:<CR>
"        nmap <Leader>a:: :Tabularize /:\zs<CR>
"        vmap <Leader>a:: :Tabularize /:\zs<CR>
"        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"        "The below two maps allow you to align C declarations
"        nmap <Leader>aw :Tabularize /\s\<<CR>
"        vmap <Leader>aw :Tabularize /\s\<<CR>
"        nmap <Leader>a, :Tabularize /,<CR>
"        vmap <Leader>a, :Tabularize /,<CR>
"        nmap <Leader>aa :Tabularize /,.\+,\{0,1}\ze<CR>
"        vmap <Leader>aa :Tabularize /,.\+,\{0,1}\ze<CR>
"    endif
"
"    "autocmd FileType python let g:checksyntax#auto_mode=0
"
"endfunction

syntax on

"automatically set pwd of buffer to local file's diectory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

"by default sent encoding to utf-8
scriptencoding utf-8
set encoding=utf-8

"highlight trailing whitespace in a buffer
:autocmd ColorScheme * highlight TrailingWhitespace ctermbg=darkgreen guibg=darkgreen

"set .asm files to filetype c (this works better for syntax highlighting with
"bfin asm files
autocmd BufReadPost *.asm set filetype=c
autocmd BufReadPost *.h set filetype=c

autocmd BufReadPost *.vx set filetype=verilog
autocmd BufReadPost *.vh set filetype=verilog
autocmd BufReadPost *.ness set filetype=verilog
autocmd BufReadPost *.spec set filetype=verilog
autocmd BufReadPost *.ref set filetye=c

"set spell check to on for certain buftypes
autocmd BufRead,BufNewFile *.tex,*.txt,*.rst,*.ref set spell spelllang=en_us tw=80

"set colorscheme to modified molokai (regular molokai with molokai_original
"colors for comments)
colors koehler
"set default font and font size
set guifont=Inconsolata\ Medium\ 12

"let g:molokai_original = 1
" always show line numbers
set number
"autosave every time vim focus is lost
au FocusLost * :wa

"highlight trailing whitespace as long as you are not actively
"typing on a line
:au InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match TrailingWhitespace /\s\+$/

"set command line history depth
set history=1000

"KEY CUSTOMIZATION AND TAG PREVIEWS
"Make the function keys useful, preview tags
"using :botright pta instead of <C-w>} opens a preview window on the bottom
"of the screen that occupies the entire width of the screen. Sorta like source
"explorer. <C-R><C-W> copies and pastes word under cursor
nmap <F8> :botright pta <C-R><C-W><CR>
"use <F9> to close preview window
nmap <F9> <C-w>z
"set preview window height to 25 pixels
set previewheight=25
"use C-\ to bring up a list of matching tags matching
"the tag under cursor. C-] by default jumps to the first
"matching tag. Instead this will let you choose either declaration
"or implementation.
nmap <C-\> :ts <C-R><C-W><CR>

"maps F12 to invoke ctags
nmap <F12> :UpdateTags<CR>
"map <C-F12> :call xolox#shell#execute('ctags -a -f C:\Users\kramakri\_usertags --c++-kinds=+p --fields=+iaS --extra=+q %:p', 0)<CR>
if has('win32') || has('win64')
    set tags+=~/_usertags
endif

if has('unix')
    set tags+=~/.usertags
endif


" enable highlighted search
set hlsearch

" enable xterm mouse scrolling
set mouse=a

" enable vim-airline without a split screen
set laststatus=2

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
