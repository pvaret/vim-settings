" LOCAL OVERRIDES (EARLY)
" =======================

if filereadable(expand("~/.vimrc.local.early"))
  source $HOME/.vimrc.local.early
endif


" BUNDLES
" =======

"Load Pathogen bundle manager.

call pathogen#infect()



" TODO: Look into YouCompleteMe when it can use a non-beta version of vim.


" GENERAL PREFERENCES
" ===================

"We do in fact want syntax coloring:
syntax on

"Allow Vim to use 256 colors (for some color scheme):
set t_Co=256

"Disable Background Color Erase (BCE) so that color schemes work properly when
"Vim is used inside tmux and screen.
"See http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

"Vim fails to detect that our tmux setup sends xterm keys. We work around that here.
"Without this, Ctrl-* shortcuts don't work. "screen-256color" is the TERM that
"tmux advertises by default.
if &term == "screen-256color"
    set term=xterm-256color
endif

"Setup color scheme:
set background=dark
colorscheme solarized

"Set Vim shell to the simplest thing available, for plugins that need it:
set shell=/bin/bash

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
set timeoutlen=1000

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

"Ignore Python object files:
set wildignore+=*.pyc,*.pyo


" PLUGIN CONFIGURATION
" ====================

"SuperTab configuration:
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabClosePreviewOnPopupClose=1

"Set up airline.
let g:airline_powerline_fonts=1
let g:airline_inactive_collapse=1
let g:airline_theme='solarized'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
"And its extensions.
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#enabled=1

"Ack configuration:
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"Load correct check for Syntastic on Python:
let g:syntastic_python_checkers=['flake8', 'python']
let $PYFLAKES_NODOCTEST=1

" Load UniCycle for reStructuredText files only:
" Disabled until it knows to act on the local buffer only. :/
" autocmd FileType rst UniCycleOn

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


"Let TagBar know it can use our Ubuntu-patched implementation of ctags for Go:
let g:tagbar_type_go = {
  \'ctagstype': 'go',
  \'kinds': [
    \'p:package',
    \'f:function',
    \'v:variables',
    \'t:type',
    \'c:const'
  \]
\}


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

"Make help easier to browse help with convenient shortcuts:
autocmd Filetype help nnoremap <buffer><CR> <c-]>
autocmd Filetype help nnoremap <buffer><BS> <c-T>
autocmd Filetype help nnoremap <buffer>q :close<CR>

"Close quickfix window more conveniently:
autocmd Filetype qf nnoremap <buffer>q :lclose<CR>

"Use standard regex in searches by default:
nnoremap / /\v
vnoremap / /\v

"Better leader than the default:
let mapleader=","

"Bind key shortcut for NERDtree:
nnoremap <silent> <Leader>f <ESC>:NERDTreeToggle<CR>

"Bind key shortcut for TagBar:
nnoremap <silent> <Leader>T <ESC>:TagbarToggle<CR>
nnoremap <silent> <Leader>t <ESC>:TagbarOpenAutoClose<CR>

"Align first = in line:
nnoremap <silent> <Leader>= <ESC>:Tabularize /^[^=]*\zs=<CR>

"Align colon declarations:
nnoremap <silent> <Leader>: <ESC>:Tabularize /:\zs/l0l1<CR>

"Bind key shortcut for Ack:
"TODO: Consider replacing with Ag.
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

"Toggle VimRoom:
nmap <leader>zz :VimroomToggle<cr>

"Add empty line above/below:
nnoremap <silent> <leader>o <ESC>o<ESC>
nnoremap <silent> <leader>O <ESC>O<ESC>

"Disable Ex mode. :|
map Q <Nop>


" LOCAL OVERRIDES
" ===============

if filereadable(expand("~/.vimrc.local"))
  source $HOME/.vimrc.local
endif
