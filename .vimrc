" This is my attempt at making a vimrc on 7/5/18 2:36 AM using
" gougblack.io/words/a-good-vimrc.html as a guide

call pathogen#infect()    " Use pathogen to load plugins

" ---------------------------------------------------------

" UI/FUNCTIONS
" Attempts to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on 

" COLORS
colorscheme badwolf       " I like badwolf and lucius
syntax enable             " Enable syntax coloring

" It hides buffers instead of closing them. This means that you can have unwritten...
"  changes to a file and open a new file using :e, without being forced to write or...
"  undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.
"  -Vincent Driessen in How I boosted my Vim
set hidden

set confirm               " Prompts for save if command used requires it
set visualbell            " Show a visible bell instead of error beep 
set mouse=a               " Allow use of mouse for all modes
set cmdheight=2           " Makes space for messages bigger


" UI CONFIG
set number                " Shows line numbers
set showcmd               " Shows last inputted command in bottom bar
filetype indent off       " Loads ~/.vim/indent/<some language>/vim files with indentation files
set wildmenu              " Graphical menu of all autocomplete options
set lazyredraw            " Redraw screen only when needed. Makes macros faster if setted
set showmatch             " Match/Highlight parantheses [{()}]
set ruler                 " Show cursor positiov
set laststatus=2          " Always shows status bar, even with only one window
set textwidth=92          " Width 92, unless next word makes it go past 92

" SEARCHING
set incsearch             " Search as characters are entered
set hlsearch              " Highlight matches
set ignorecase            " Case insensitive searches unless uppercase used
set smartcase

" FOLDING
set foldenable            " Enable folding
set foldlevelstart=10     " Open most folds by default
set foldnestmax=10        " Allows 10 nested folds max
set foldmethod=indent     " fold based on indent level

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"" Makes trailing spaces and tabs visible. Thanks to guckes.net
set list
set lcs=tab:»·
set lcs+=trail:·
set fillchars+=vert:┃     " Fils vertical separator with a line, not as choppy as before

" ---------------------------------------------------------

" KEYS 
" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" Space opens and closes folds
nnoremap <space> za 
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" LEADER SHORTCUTS
" leader is \
" jk is escape
inoremap jk <esc>
" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" Save session
nnoremap <leader>s :mksession<CR>
" Edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Open ag.vim
nnoremap <leader>a :Ack
" Use colorscheme lucius
" Use colorscheme badwolf
nnoremap <leader>cb :colorscheme badwolf<CR>
" Use colorscheme meta5
" Use colorscheme gruvbox
" Use colorscheme happy_hacking
" Use colorscheme iceberg
" Use colorscheme lightning
" Use colorscheme summerfruit GUI ONLY
nnoremap <leader>cf :colorscheme summerfruit<CR>
" Use colorscheme colokschi-light
nnoremap <leader>ccl :colorscheme colokschi-light<CR>
" Use colorscheme colokschi dark
nnoremap <leader>ccd :colorscheme colokschi-dark<CR>

" SPACES & TABS
set tabstop=4             " Visible spaces per tab
set softtabstop=4         " # of spaces for tab while editing
set expandtab             " Makes tabs into spaces
set backspace=indent,eol,start " Allows backspace over autoindent linebreaks and start of insert action
set autoindent            " Keeps same indentation on enter if no file specific indenting is enabled
