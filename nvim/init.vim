" Neovim Config


" -------------
" Global config
" -------------
"
" Make Vim use the indent of the previous line for a newly created line.
set autoindent
" Set backspace options.
"   eol    - allow backspacing over line breaks
"   indent - allow backspacing over autoindent
"   start  - allow backspacing over the start of insert
set backspace=eol,indent,start
" Display a vertical line at 80 characters.
set colorcolumn=80
" Set options for Insert mode completion.
"	menuone	 - use the popup menu even when there is only one match
"	noinsert - do not insert any text for a match until the user selects a match from the menu
"	noselect - do not select a match in the menu; force the user to select one
set completeopt=menuone,noinsert,noselect
" Set the Nerd Font.
set guifont=Hack\ Regular\ Nerd\ Font\ Complete\ 11
" Keep the last 1000 commands and search patterns in the history.
set history=1000
" Highlight matches with the last used search pattern.
set hlsearch
" Ignore case when searching for a pattern.
set ignorecase
" Display matches for a search pattern while you type.
set incsearch
" Disable error bells.
set noerrorbells
" Display line numbers.
set number
" Display relative line numbers.
set relativenumber
" Display the current cursor position.
set ruler
" Set the number of lines to always keep above or below the cursor when scrolling, kind of like padding.
set scrolloff=8
" Set this option so that the line number will display along with Git changes.
set signcolumn=yes
" Search case is smart (will search for exact match if capital letters are present).
"	NOTE: ONLY WORKS IF `ignorecase` IS SET.
set smartcase
" Set number of space characters inserted after indentation.
set shiftwidth=4
" Display an incomplete command in the lower right corner.
set showcmd
" Display the current mode.
set showmode
" Set number of spaces in tab while editing.
set softtabstop=4
" Set tab as four spaces.
set tabstop=4
" Set terminal colors.
set termguicolors


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
call plug#begin('~/.local/share/nvim/plugged')
" The best theme.
Plug 'ayu-theme/ayu-vim'
" MUST HAVE FOR DEVELOPMENT - Load language servers, code completion, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Visualize hex code colors directly in Vim. Useful for frontend development.
Plug 'chrisbra/Colorizer'
" Emmet for Vim - For expanding abbreviations.
Plug 'mattn/emmet-vim'
" fzf - Fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Another great theme.
Plug 'morhetz/gruvbox'
" Add indent line indicators.
Plug 'lukas-reineke/indent-blankline.nvim'
" A Markdown preview plugin.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" A plugin for quickly commenting out code.
Plug 'preservim/nerdcommenter'
" A file browser/tree view on the far left side of the editor.
Plug 'preservim/nerdtree'
" Git integration for NERDTree.
Plug 'Xuyuanp/nerdtree-git-plugin'
" A syntax highlighting and Git status indicator for NERDTree.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" The official Rust Vim plugin - it's only loaded when a Rust file is opened.
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Unicode character plugin.
Plug 'chrisbra/unicode.vim'
" Gotta have a dope and useful status bar.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" MUST HAVE FOR DEVELOPMENT - Git integration for Vim.
Plug 'tpope/vim-fugitive'
" MUST HAVE FOR DEVELOPMENT - Add Git diff markers in the sign column.
Plug 'airblade/vim-gitgutter'
" MUST HAVE FOR DEVELOPMENT - Plugin to quickly match quotes/parentheses.
Plug 'tpope/vim-surround'
" Multiple cursor support.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" File type icons - HAVE TO LOAD THIS PLUGIN LAST.
Plug 'ryanoasis/vim-devicons'
call plug#end()


" -----------------------------
" Configure colorschemes/themes
" -----------------------------
"
"	Configure Ayu theme.
let g:ayucolor = "dark"
" Configure default colorscheme.
colorscheme ayu

" Configure Airline theme.
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu'
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
" <Ctrl-t> toggles the NerdTree.
nnoremap <C-t> :NERDTreeToggle<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>
" <Ctrl-p> is a keybinding to use `ripgrep`, the BEST search/grep tool, for fzf.
"	NOTE: THIS ASSUMES YOU HAVE RIPGREP INSTALLED ON YOUR MACHINE. IT WILL NOT WORK IF IT ISN'T INSTALLED.
nnoremap <silent> <C-p> :Rg<CR>


" ---------------------------------
" Configure indent-blankline plugin
" ---------------------------------
"
let g:indent_blankline_char = '┊'
let g:indent_blankline_show_first_indent_level = v:false

" -----------------------------
" Configure NerdTree Git Plugin 
" -----------------------------
"
" Map custom Git status indicators.
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ 'Modified'  :'M',
	\ 'Staged'    :'A',
	\ 'Untracked' :'U',
	\ 'Renamed'   :'R',
	\ 'Unmerged'  :'═',
	\ 'Deleted'   :'D',
	\ 'Dirty'     :'!',
	\ 'Ignored'   :'I',
	\ 'Clean'     :'✔︎',
	\ 'Unknown'   :'?',
\ }
" Always show hidden files.
let g:NERDTreeShowHidden=1

" --------------------
" Configure coc plugin
" --------------------
" 
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files.
set nobackup
set nowritebackup
" Set a shorter updatetime.
set updatetime=50
" Do not pass messages to |ins-completion-menu|.
set shortmess+=c


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


