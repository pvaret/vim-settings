" BUNDLES
" =======

"Load Pathogen bundle manager.

call pathogen#infect()


" GENERAL PREFERENCES
" ===================

"Allow Vim to use 256 colors (for some color scheme):
set t_Co=256

"Disable Background Color Erase (BCE) so that color schemes work properly when
"Vim is used inside tmux and screen.
"See http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

"Setup color scheme:
set background=light
colorscheme solarized

"Jump to the last position when reopening a file:
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Load per-filetype plugins.
filetype plugin indent on

"Show partial commands in status line:
set showcmd

"Show matching brackets:
set showmatch

"Preferred tabbing mode.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"But allow files to override those settings:
set modeline

"Preferred completion mode:
set wildmenu
set wildmode=longest:full,full
set completeopt=longest,menu

"Open vertical split to the right by default:
set splitright

"Change dirs automatically when switching buffers.
"set autochdir   "Causes some problems with some plugins.

"Wait 1 secs before cancelling an unfinished command.
set timeoutlen=100

"Display cursor line.
set cursorline

"Extended status bar:
set statusline=%<\ %n:%f\ %m%r%y\ %=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"Always display the status bar:
set laststatus=2

"Keep some space between cursor and window border:
set scrolloff=2

"We're using a fast term, indeed.
set ttyfast

"Relative numbering (for vim 7.3)
if version >= 703
  set relativenumber
endif

"Keep undo history (for vim 7.3)
if version >= 703
  set undofile
  set undodir=/tmp/
endif

"Search configuration
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Python-specific format options:
autocmd Filetype python setlocal formatoptions-=t formatoptions+=croql
autocmd Filetype python setlocal textwidth=79
autocmd Filetype python setlocal comments=b:##,O:#

"Folding options.
set foldminlines=2

"Highlight space characters:
set list
set listchars=tab:»·,trail:·

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace "\s\+$"

"Highlight characters > 80 column in Python files:
highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=white gui=bold guibg=red guifg=white
autocmd Filetype python 2match OverColLimit "\%>79v.\+"

"Treat ZCML as XML:
autocmd BufRead,BufNewFile *.zcml set filetype=xml


" PLUGIN CONFIGURATION
" ====================

"Extended Python matching configuration, for python.vim:
let python_highlight_all=1
let python_slow_sync=1

"SuperTab configuration:
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabClosePreviewOnPopupClose=1

"Use Powerline font in airline, and use proper theme.
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

"Ack configuration:
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Load UniCycle for reStructuredText files only:
autocmd FileType rst UniCycleOn

"Let Jedi configure Vim to suit its needs.
let g:jedi#auto_vim_configuration = 1

" Don't popup Jedi completion whenever a dot is entered:
let g:jedi#popup_on_dot = 0

"Don't show function definitions when opening a paren; it's nice but a bit
"buggy:
let g:jedi#show_function_definition = 0

" Override Jedi shortcuts to avoid conflicts with other plugins:
let g:jedi#goto_command = "<leader>jg"
let g:jedi#get_definition_command = "<leader>jd"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#related_names_command = "<leader>jn"

"OTOH, we want the standard shortcut for autocompletion:
"XXX Doesn't work. Investigate later.
"let g:jedi#autocompletion_command = "<C-Space>"


" SHORTCUTS
" =========

"Cd to current buffer's directory
command CD :execute ":lcd " . expand("%:p:h")

"Remap window switching keys:
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

"Convenient shortcut:
set pastetoggle=<F10>

"Make help easier to browse with convenient shortcuts:
autocmd Filetype help nnoremap <buffer><CR> <c-]>
autocmd Filetype help nnoremap <buffer><BS> <c-T>

"Use standard regex in searches by default:
nnoremap / /\v
vnoremap / /\v

"Better leader than the default:
let mapleader=","

"Bind key shortcut for NERDtree:
nnoremap <silent> <Leader>f <ESC>:NERDTreeToggle<CR>

"Bind key shortcut for TagList:
nnoremap <silent> <Leader>t <ESC>:TlistToggle<CR>

"Bind key shortcut for Ack:
nnoremap <leader>a <ESC>:LAck<space>
nnoremap <leader>A <ESC>"9yiw:LAck<space>-w<space><C-R>9<CR>
vnoremap <leader>A "9y:LAck<space>"<C-R>9"<CR>

"Clear searches with this:
nnoremap <leader><space> :noh<CR>

"Delete trailing whitespace with this:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Select last pasted text:
nnoremap <leader>v V`]

"Open vertical split and switch to it:
nnoremap <leader>w <C-w>v<C-w>l

"Open new tab with current file:
nnoremap <silent> <leader>nn <ESC>:tabnew<CR>
nnoremap <silent> <leader>nc <ESC>:tabclose<CR>

"Toggle folding:
noremap <space> zA

"Fugitive bindings:
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>ge :Gedit<cr>
nmap <leader>gb :Gblame<cr>

"Add empty line above/below:
nnoremap <silent> <leader>o <ESC>o<ESC>
nnoremap <silent> <leader>O <ESC>O<ESC>


" LOCAL OVERRIDES
" ===============

if filereadable(expand("~/.vimrc.local"))
  source $HOME/.vimrc.local
endif
