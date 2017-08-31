" Explicitly set this script's encoding, so it doesn't fail under other
" locales.
scriptencoding utf-8


" LOCAL OVERRIDES (EARLY)
" =======================

if filereadable(expand("~/.vimrc.local.early"))
  source $HOME/.vimrc.local.early
endif


" BUNDLES
" =======

" Load vim-plug plug-ins.

call plug#begin('~/.vim/plugged')


" vim-startify
" ------------
" Nice and friendly start screen that shows bookmarks and current sessions.

Plug 'mhinz/vim-startify'


" Goyo
" ----
" Distraction-free writing plug-in. Basically VimRoom, but improved.
" Can make use of Limelight for even more focus. Toggle with ":Goyo".

Plug 'junegunn/goyo.vim'


" Limelight
" ---------
" Use brighter colors in the paragraph where the cursor is.
" Toggle with ":Limelight!!".

Plug 'junegunn/limelight.vim'


" FZF
" ---
" Super fast file finder.
" Installs to its own directory because it can work standalone.
" Also provides shell shortcuts: "ctrl-T", "ctrl-R", "alt-C". See
" https://github.com/junegunn/fzf.
" TODO: Disable and remove CtrlP, which it replaces.

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" vim-online-thesaurus
" --------------------
" ",K" to look up the word under the cursor.

Plug 'beloglazov/vim-online-thesaurus'


" vim-argumentative
" -----------------
" Add grammar objects for function arguments.
" Shift arguments with "<," and ">,".
" Move between argument boundaries with "[," and "],".
" New text objects "a," and "i,".

Plug 'PeterRincker/vim-argumentative'


" vim-obsession
" -------------
" Improves several aspects of sessions. If a session is loaded (or started with
" ":Obsess") it stays updated automatically.

Plug 'tpope/vim-obsession'


" vim-go
" ------
" Extensive set of Go-related plugins.
" See https://github.com/fatih/vim-go.
" Use a tagged release for stability.

Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries' }


" vim-signify
" -----------
" Add gutter status symbols for a whole bunch of VCS. So like vim-gitgutter,
" just more generic.
" ']c', '[c' to navigate between hunks.
" New motions 'ic', 'ac' operate on current hunk.

Plug 'mhinz/vim-signify'

let g:signify_vcs_list               = ['perforce', 'git', 'hg']
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change


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
" -------------
" Colorize colors in CSS files.

Plug 'skammer/vim-css-color'


" vim-airline
" -----------
" Awesome tabline with compatibility with LOADS of plugins.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmuxline.vim
" ------------
" Configure the tmux status line from inside vim.
" ":Tmuxline [theme] [preset]" applies the given Airline theme and tmuxline
" preset (from autoload/tmuxline/presets/) to the tmux status line.
" ":TmuxlineSnapshot [file]" saves that configuration to [file], to be loaded
" from .tmux.conf.
" By default it automatically applies the current Airline style.

Plug 'edkolev/tmuxline.vim'


" NERD Commenter
" --------------
" Commenting made easy.
" ",cc" to comment. ",cu" tu uncomment. ",c<Space>" to toggle.
" ",cy" to yank before commenting.
" Loads more options! See https://github.com/scrooloose/nerdcommenter.

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


" ConradIrwin/vim-bracketed-paste
" -------------------------------
" Automatically switch to paste mode when pasting stuff inside a term. Or in
" other words, total magic.

Plug 'ConradIrwin/vim-bracketed-paste'


" Codi
" ----
" Awesome interactive scratchpad for Python and others.
" Start with ":Codi" in a Python buffer or ":Codi python" elsewhere.

Plug 'metakirby5/codi.vim'


" vim-dispatch
" ------------
" Adds the ":Dispatch" command, which runs command line tools asynchronously in
" an automatically opened tmux window. Can also run tasks entirely in the
" background with ":Dispatch!" and focus the new window with ":Start".

Plug 'tpope/vim-dispatch'


" vim-windowswap
" --------------
" Adds a simple way to swap two windows. <leader>ww in a window to mark it,
" <leader>ww in another window to swap it, without affecting the layout.

Plug 'wesQ3/vim-windowswap'


" splitjoin.vim
" -------------
" Split lines into blocks and join blocks into lines.
" Default shortcuts: "gS" and "gJ", respectively.

Plug 'AndrewRadev/splitjoin.vim'


" UltiSnips
" ---------
" Good snippets plug-in. Integrates with vim-go.

Plug 'sirver/ultisnips'


" YouCompleteMe
" -------------
" Solid instantaneous completion engine for a lot of languages.
" A bit heavy, but very handy. Requires a heavy download and then an
" installation step, so only use if explicitly activated in .vimrc.local.early.

if exists("g:do_activate_youcompleteme") && g:do_activate_youcompleteme == 1
  Plug 'Valloric/YouCompleteMe', { 'do': '~/.vim/plugged/YouCompleteMe/install.py --clang-completer --gocode-completer' }
endif


" Seoul256
" --------
" A soft color theme. Load with "colorscheme".

Plug 'junegunn/seoul256.vim'


" Finalize vim-plug loading.

call plug#end()


" GENERAL PREFERENCES
" ===================

" TODO: Look into vim-sensible for a set of sane default; simplify the following
" accordingly.


" We do in fact want syntax coloring:
syntax on

" Vim fails to detect that our tmux setup sends xterm keys. We work around
" that here.  Without this, Ctrl-* shortcuts don't work. "screen-256color" is
" the TERM that tmux advertises by default.
if &term == "screen-256color"
    set term=xterm-256color
endif

" Allow Vim to use 256 colors (for some color scheme):
"set t_Co=256
" Tentatively disabled on 2016/09/01. The TERM should be set to
" 'something-256color' externally.

" Disable Background Color Erase (BCE) so that color schemes work properly
" when Vim is used inside tmux and screen. This is because we set the term to
" "xterm-256color" just above, which is a lie, and means we need to duct-tape
" this here.
" See http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Setup color scheme:
"set background=dark
"colorscheme solarized
set background=light
colorscheme seoul256-light

" Set Vim shell to the simplest thing available, for plugins that need it:
set shell=/bin/bash

" Jump to the last position when reopening a file:
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Load per-filetype plugins.
filetype plugin indent on

" Auto-save files. Works when calling make or GoBuild.
set autowrite

" Show partial commands in status line:
set showcmd

" Show matching brackets:
set showmatch

" Preferred default tabbing mode.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" But allow files to override those settings:
set modeline

" Preferred completion mode:
set wildmenu
set wildmode=longest:full,full
set completeopt=longest,menu

" Open vertical split to the right by default:
set splitright

" Wait 1 secs before cancelling an unfinished command.
set timeoutlen=1000

" Display cursor line in the current buffer.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Colorize the cursor line differently when in insert mode. Works well with the
" seoul256 color scheme; might need updating with a different scheme.
autocmd InsertEnter * highlight CursorLine term=underline ctermbg=14
autocmd InsertLeave * highlight CursorLine term=underline ctermbg=252

" Extended status bar:
set statusline=%<\ %n:%f\ %m%r%y\ %=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Always display the status bar:
set laststatus=2

" Keep some space between cursor and window border:
set scrolloff=3

" We're using a fast term, indeed.
set ttyfast

" Relative numbering
set relativenumber

" Keep undo history
set undofile
set undodir=/tmp/

" Search configuration
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" General format options.
set formatoptions-=o formatoptions+=rqc

" Silence completion messages like "match 1 of 2", which get spammy with
" plugins like YouCompleteMe.
set shortmess+=c

" Python-specific format options:
autocmd Filetype python setlocal formatoptions-=t formatoptions+=l
autocmd Filetype python setlocal textwidth=80
autocmd Filetype python setlocal comments=b:##,O:#

" Override unfortunate silliness in GetPythonIndent():
let g:pyindent_open_paren=0
let g:pyindent_nested_paren=0

" Highlight space characters:
set list
set listchars=tab:»·,trail:·

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace "\s\+$"

" Highlight characters > 80 column in certain files:
highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=white gui=bold guibg=red guifg=white
autocmd Filetype python 2match OverColLimit "\%>80.\+"
autocmd Filetype cpp 2match OverColLimit "\%>80.\+"

" Ignore Python object files:
set wildignore+=*.pyc,*.pyo


" PLUGIN CONFIGURATION
" ====================

" YouCompleteMe configuration.
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 0

" Set up airline.
let g:airline_powerline_fonts=1
let g:airline_inactive_collapse=1
"let g:airline_theme='solarized'
let g:airline_theme='zenburn'  " Goes well with seoul256
let g:airline_detect_modified=1
let g:airline_detect_paste=1
" And its extensions.
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#obsession#enabled=1
let g:airline#extensions#obsession#indicator_text='✇'

" Disable somewhat noisy line number symbol.
let g:airline_symbols = {}
let g:airline_symbols.maxlinenr = ''

" Don't display empty section at all (errors, typically). Incurs a small
" performance penalty.
let g:airline_skip_empty_sections = 1

" More compact line/column section.
let g:airline_section_z = "%{airline#util#wrap(airline#extensions#obsession#get_status(),0)} %#__accent_bold#%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v"

" Ack configuration:
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Load correct check for Syntastic on Python:
let g:syntastic_python_checkers=['flake8', 'python']
let $PYFLAKES_NODOCTEST=1

if exists("g:do_activate_youcompleteme") && g:do_activate_youcompleteme == 1
  " We want Jedi for its features, but completion is provided by YCM.
  let g:jedi#completions_enabled = 0

else

  " Let Jedi configure Vim to suit its needs.
  let g:jedi#auto_vim_configuration = 1

  " Don't popup Jedi completion whenever a dot is entered:
  let g:jedi#popup_on_dot = 0

  " Don't show function definitions when opening a paren; it's nice but a bit
  " buggy:
  let g:jedi#show_call_signatures = 0

endif

" Override Jedi shortcuts to avoid conflicts with other plugins:
let g:jedi#goto_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>jn"

" Align comments to the left by default.
let NERDDefaultAlign='left'

" Automatically compute imports on save. Lovely!
let g:go_fmt_command = "goimports"

" Highlight Go things.
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Don't display list characters -- especially tabs -- in Go.
au FileType go set nolist

" Expand spaces and CR in delimitMate:
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" Also recognize triple quotes in Python:
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]

" Limelight can't compute the proper colors for Solarized, so we let it know
" manually.
"let g:limelight_conceal_ctermfg = 241  " DISABLED while we try out Seoul256.

" Toggle Limelight alongside Goyo:
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" By default, open new buffer when selecting a file in BuExplorer.
let g:bufExplorerFindActive = 0

" SHORTCUTS
" =========

" Better leader than the default:
let mapleader=","
let maplocalleader=","

" Cd to current buffer's directory
command! CD :execute ":lcd " . expand("%:p:h")

" Remap window switching keys:
"noremap <C-Down>  <C-W>j
"noremap <C-Up>    <C-W>k
"noremap <C-Left>  <C-W>h
"noremap <C-Right> <C-W>l
" Remap window switching keys with tmux-navigator compatibility:
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Convenient shortcut:
set pastetoggle=<F10>

" Make help easier to browse help with convenient shortcuts:
autocmd Filetype help nnoremap <buffer><CR> <c-]>
autocmd Filetype help nnoremap <buffer><BS> <c-T>
autocmd Filetype help nnoremap <buffer>q :close<CR>

" Close quickfix window more conveniently:
autocmd Filetype qf nnoremap <buffer>q :cclose<CR>

" Use standard regex in searches by default:
nnoremap / /\v
vnoremap / /\v

" Toggle YouCompleteMe autocompletion:
nnoremap <silent> <leader>yy :let g:ycm_auto_trigger=1-g:ycm_auto_trigger<CR>:echo "Autocompletion toggled."<CR>
nnoremap <silent> <leader>yd :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>yh :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>

" Trigger Dispatch.
" (Set g:dispatch to the command to be run in Dispatch globally. Make it
" t:dispatch for the current tab and b:dispatch for the current buffer.)
nnoremap <silent> <F9> :wa<CR>:Dispatch<CR>

" Bind key shortcut for NERDtree:
nnoremap <silent> <Leader>f <ESC>:NERDTreeToggle<CR>

" Bind key shortcut for TagBar:
nnoremap <silent> <Leader>t <ESC>:TagbarToggle<CR>
nnoremap <silent> <Leader>T <ESC>:TagbarOpenAutoClose<CR>

" Align first = in line:
nnoremap <silent> <Leader>= <ESC>:Tabularize /^[^=]*\zs=<CR>

" Align colon declarations:
nnoremap <silent> <Leader>: <ESC>:Tabularize /:\zs/l0l1<CR>

" Bind key shortcut for Ack:
" TODO: Consider replacing with Ag.
nnoremap <leader>a <ESC>:LAck<space>
nnoremap <leader>A <ESC>"9yiw:LAck<space>-w<space><C-R>9<CR>
vnoremap <leader>A "9y:LAck<space>"<C-R>9"<CR>

" Clear searches with this:
nnoremap <leader><space> :noh<CR>

" Delete trailing whitespace with this:
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<CR>`z

" Select last pasted text:
nnoremap <leader>v V`]

" Open vertical split and switch to it:
nnoremap <leader>w <C-w>v<C-w>l

" Open new tab with current file:
nnoremap <silent> <leader>nn <ESC>:tabnew<CR>
nnoremap <silent> <leader>nc <ESC>:tabclose<CR>

" Toggle folding:
noremap <space> zA

" Toggle Goyo:
nmap <leader>zz :Goyo<cr>

" Add empty line above/below:
nnoremap <silent> <leader>o <ESC>o<ESC>
nnoremap <silent> <leader>O <ESC>O<ESC>

" Disable Ex mode. :|
map Q <Nop>

" Build Go code or compile tests based on file name:
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

" Run current Go file:
autocmd FileType go nmap <leader>gr <Plug>(go-run)

" Run Go tests:
autocmd FileType go nmap <leader>gt <Plug>(go-test)

" Show/hide Go test coverage:
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)


" LOCAL OVERRIDES
" ===============

if filereadable(expand("~/.vimrc.local"))
  source $HOME/.vimrc.local
endif
