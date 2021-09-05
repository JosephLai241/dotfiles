" Config for classic Vim.

" Make Vim use the indent of the previous line for a newly created line.
set autoindent
" A buffer becomes hidden when it's abandoned.
set hidden
" Keep the last 1000 commands and search patterns in the history.
set history=1000
" Highlight matches with the last used search pattern.
set hlsearch
" Ignore case when searching for a pattern.
set ignorecase
" Display matches for a search pattern while you type.
set incsearch
" Don't make a backup before overwriting a file.
set nobackup
" Display line numbers.
set number
" Display relative line numbers.
set relativenumber
" Display the current cursor position.
set ruler
" Set the number of lines to always keep above or below the cursor when scrolling, kind of like padding.
set scrolloff=8
" Search case is smart (will search for exact match if capital letters are present).
" 	NOTE: ONLY WORKS IF `ignorecase` IS SET.
set smartcase
" Display an incomplete command in the lower right corner.
set showcmd
" Set a shorter updatetime.
set updatetime=50
" Set gruvbox colorscheme to dark.
set bg=dark

" Switch on syntax highlighting.
syntax on
" Turn on filetype detection, using filetype plugin and indent files.
"	plugin - enable loading the plugin files for specific file types.
"		This may be done by creating a configuration file for a file type, 
"		ie. "~/.config/nvim/ftplugin/rust.vim" for Rust file types.
"	indent - enable loading the indent file for specific file types.
filetype plugin indent on

" -------------------------
" Load plugins via vim-plug
" -------------------------
"
call plug#begin()
" A great theme.
Plug 'morhetz/gruvbox'
" A file navigation plugin.
Plug 'francoiscabrol/ranger.vim'
" Gotta have a dope and useful status bar.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" -----------------------------
" Configure colorschemes/themes
" -----------------------------
"
let g:gruvbox_contrast_dark = "medium"
colorscheme gruvbox

" Configure Airline theme.
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
" Configure Airline tabline extension.
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" --------------------- 
" Configure keybindings
" --------------------- 
"
" <\sv> quickly reloads the `.config/nvim/init.vim` file.
nnoremap <leader>sv :source $MYVIMRC<CR>
" <\vr> shortens the vertical resizing command when editing with split panes.
nnoremap <leader>vr :vertical resize 
" <Ctrl-Left> and <Ctrl-Right> are keybindings to cycle between tabs.
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>

