" LOCAL OVERRIDES (EARLY)
" =======================

if filereadable(expand("~/.vimrc.local.early"))
  source $HOME/.vimrc.local.early
endif


" BUNDLES
" =======

" Load vim-plug plug-ins.

call plug#begin('~/.vim/plugged')


" Vimroom
" -------
" Convenient layout for writing.
" Trigger with :VimroomToggle.

Plug 'mikewest/vimroom'

" FZF
" ---
" Super fast file finder.
" Installs to its own directory because it can work standalone.
" Also provides shell shortcuts: ctrl-T, ctrl-R, alt-C. See
" https://github.com/junegunn/fzf.
" TODO: Disable and remove CtrlP, which it replaces.

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" vim-online-thesaurus
" --------------------
" <localleader>K to look up the word under the cursor.

Plug 'beloglazov/vim-online-thesaurus'

" vim-argumentative
" -----------------
" Add grammar objects for function arguments.
" Shift arguments with <, and >,
" Move between argument boundaries with [, and ],
" New text objects a, and i,

Plug 'PeterRincker/vim-argumentative'

" vim-obsession
" -------------
" Improves several aspects of sessions. If a session is loaded (or started with
" :Obsess) it stays updated automatically.

Plug 'tpope/vim-obsession'

" vim-go
" ------
" Extensive set of Go-related plugins.
" See Plug 'fatih/vim-go'.
" Use a tagged release for stability.

Plug 'fatih/vim-go', { 'tag': '*' }

" vim-gitgutter
" -------------
" Add Git status symbols in the gutter for the relevant lines.
" TODO: look at https://github.com/mhinz/vim-signify for something that supports
"       more VCS.

Plug 'airblade/vim-gitgutter'

" vim-eunuch
" ----------
" UNIX command line helpers, including SudoEdit and SudoWrite.

Plug 'tpope/vim-eunuch'

" EasyMotion
" ----------
" Awesome navigation plugin.
" <leader><leader>[motion command] to apply that motion visually.
" I.e. ",,b" to jump to the beginning of one of the previous words, ",,fR" to
" jump to one of the next 'R' in the file...
" See https://github.com/easymotion/vim-easymotion.

Plug 'easymotion/vim-easymotion'

" vim-css-color
" Colorize colors in CSS files.

Plug 'skammer/vim-css-color'

" vim-airline
" -----------
" Awesome tabline with compatibility with LOADS of plugins.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERD Commenter
" --------------
" Commenting made easy.
" ",cc" to comment. ",cu" tu uncomment. ",c<space>" to toggle.
" ",cy" to yank before commenting.
" See https://github.com/scrooloose/nerdcommenter.

Plug 'scrooloose/nerdcommenter'

" Tagbar
" ------
" A tag indexing plugin. Compatible with Airline.

Plug 'majutsushi/tagbar'

" Tabular
" -------
" Super cool plugin to help lining things vertically.

Plug 'godlygeek/tabular'

" Syntastic
" ---------
" Terrific syntax checking plug-in.
" Requires some third party tools (like flake8 for Python).

Plug 'scrooloose/syntastic'

" Supertab
" --------
" Plug-in to use <Tab> for completions, because, y'know.

Plug 'ervandew/supertab'

" CtrlP
" -----
" Awesome fuzzy file finder.

Plug 'ctrlpvim/ctrlp.vim'

" bufexplorer
" -----------
" Convenient buffer switcher. ",be" to open.

Plug 'corntrace/bufexplorer'

" ack.vim
" -------
" Use ack from inside vim. Requires ack to be installed (d'uh).

Plug 'mileszs/ack.vim'

" ag.vim
" ------
" Ditto with ag. TODO: replace ack wih ag.

Plug 'rking/ag.vim'

" vim-colors-solarized
" --------------------
" See https://github.com/altercation/vim-colors-solarized for the settings.

Plug 'altercation/vim-colors-solarized'

" NERD Tree
" ---------
" Explore files and directory as a convenient tree in a vim buffer.
" Also mark git status of files.

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" vim-repeat
" ----------
" Let the . shortcut work with plug-ins!

Plug 'tpope/vim-repeat'

" vim-surround
" ------------
" Expand the vim grammar with shortcuts for dealing with surrounding elements
" in pairs.

Plug 'tpope/vim-surround'

" jedi-vim
" --------
" Awesome autocompletion. See https://github.com/davidhalter/jedi-vim.

Plug 'davidhalter/jedi-vim'

" delimitMate
" -----------
" Quote and parentheses auto-closing.
" ":help delimitMate" for the details.

Plug 'Raimondi/delimitMate'

" vim-tmux-navigator
" ------------------
" Easily navigate between Vim and tmux panes.
" Requires some tmux setup. See
" https://github.com/christoomey/vim-tmux-navigator.

Plug 'christoomey/vim-tmux-navigator'


" Finalize vim-plug loading.

call plug#end()


" TODO: Look into YouCompleteMe when it can use a non-beta version of vim.


" GENERAL PREFERENCES
" ===================

" TODO: Look into vim-sensible for a set of sane default; simplify the following
" accordingly.


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

"General format options.
set formatoptions-=o formatoptions+=rqc

"Python-specific format options:
autocmd Filetype python setlocal formatoptions-=t formatoptions+=l
autocmd Filetype python setlocal textwidth=79
autocmd Filetype python setlocal comments=b:##,O:#

"Override unfortunate silliness in GetPythonIndent():
let g:pyindent_open_paren=0
let g:pyindent_nested_paren=0

"Highlight space characters:
set list
set listchars=tab:»·,trail:·

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace "\s\+$"

"Highlight characters > 80 column in Python files:
highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=white gui=bold guibg=red guifg=white
autocmd Filetype python 2match OverColLimit "\%>79v.\+"

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

"Disable somewhat noisy line number symbol.
let g:airline_symbols = {}
let g:airline_symbols.maxlinenr = ''

"Ack configuration:
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"Load correct check for Syntastic on Python:
let g:syntastic_python_checkers=['flake8', 'python']
let $PYFLAKES_NODOCTEST=1

"Let Jedi configure Vim to suit its needs.
let g:jedi#auto_vim_configuration = 1

"Don't popup Jedi completion whenever a dot is entered:
let g:jedi#popup_on_dot = 0

"Don't show function definitions when opening a paren; it's nice but a bit
"buggy:
let g:jedi#show_call_signatures = 0

" Override Jedi shortcuts to avoid conflicts with other plugins:
let g:jedi#goto_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>jn"

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

"Expand spaces and CR in delimitMate:
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"Also recognize triple quotes in Python:
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]


" SHORTCUTS
" =========

"Cd to current buffer's directory
command! CD :execute ":lcd " . expand("%:p:h")

"Remap window switching keys:
"noremap <C-Down>  <C-W>j
"noremap <C-Up>    <C-W>k
"noremap <C-Left>  <C-W>h
"noremap <C-Right> <C-W>l
"Remap window switching keys with tmux-navigator compatibility:
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

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
let maplocalleader=","

"Bind key shortcut for NERDtree:
nnoremap <silent> <Leader>f <ESC>:NERDTreeToggle<CR>

"Bind key shortcut for TagBar:
nnoremap <silent> <Leader>t <ESC>:TagbarToggle<CR>
nnoremap <silent> <Leader>T <ESC>:TagbarOpenAutoClose<CR>

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
