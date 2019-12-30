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


" vim-sensible
" ------------
" Sensible defaults for everything that vim does better than vi if you ask it
" to.

Plug 'tpope/vim-sensible'


" vim-startify
" ------------
" Nice and friendly start screen that shows bookmarks and current sessions.

Plug 'mhinz/vim-startify'


" Vim-OrgMode
" -----------
" A task outlining plug-in. Lots of features. See
" https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt for the
" rundown.

Plug 'jceb/vim-orgmode'


" tpope/vim-speeddating
" ---------------------
" Make ctrl-A/ctrl-X work on dates too. Also used by Vim-OrgMode.

Plug 'tpope/vim-speeddating'


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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }


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


" vim-prosession
" --------------
" Automates Obsession. Sessions are managed automatically based on the working
" directory, and saved in ~/.vim/session/.
" Depends on 'tpope/vim-obsession'.

Plug 'dhruvasagar/vim-prosession'


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


" vim-illuminate
" --------------
" Highlight other occurences of the word under the cursor.

Plug 'RRethy/vim-illuminate'


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


" bufexplorer
" -----------
" Convenient buffer switcher. ",be" to open.

Plug 'corntrace/bufexplorer'


" ag.vim
" ------
" Use ag from inside vim. Requires ag to be installed (d'uh).

Plug 'rking/ag.vim'


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
" Awesome Python autocompletion. See https://github.com/davidhalter/jedi-vim
" for the many possibilities.

Plug 'davidhalter/jedi-vim'


" Auto Pairs
" ----------
" Auto-closes quotes and parentheses.

Plug 'jiangmiao/auto-pairs'


" vim-tmux-navigator
" ------------------
" Easily navigate between Vim and tmux panes.
" Requires some tmux setup. See
" https://github.com/christoomey/vim-tmux-navigator.

Plug 'christoomey/vim-tmux-navigator'


" vim-tmux-focus-events
" ---------------------
" Make FocusEnter and FocusLeave events work again when in tmux.

Plug 'tmux-plugins/vim-tmux-focus-events'


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
" Override the local dispatch action with ":let b:dispatch='command args'"

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


" YouCompleteMe
" -------------
" Solid instantaneous completion engine for a lot of languages.
" A bit heavy, but very handy. Requires a heavy download and then an
" installation step, so only use if explicitly activated in .vimrc.local.early.

if exists("g:do_activate_youcompleteme") && g:do_activate_youcompleteme == 1
  Plug 'Valloric/YouCompleteMe', { 'do': '~/.vim/plugged/YouCompleteMe/install.py --clang-completer --gocode-completer' }
endif


" UltiSnips
" ---------
" Good snippets plug-in. Integrates with vim-go and YouCompleteMe.

Plug 'sirver/ultisnips'


" vim-colors-solarized
" --------------------
" See https://github.com/altercation/vim-colors-solarized for the settings.

Plug 'altercation/vim-colors-solarized'


" Seoul256
" --------
" A soft color theme. Load with "colorscheme".

Plug 'junegunn/seoul256.vim'


" Finalize vim-plug loading.

call plug#end()


" GENERAL PREFERENCES
" ===================

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

" Disable modeline, as it's a security liability. :(
set nomodeline

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
autocmd InsertEnter * highlight CursorLine term=underline ctermbg=250 cterm=bold
autocmd InsertLeave * highlight CursorLine term=underline ctermbg=252 cterm=none

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace "\s\+$"

" Show boundary at column textwidth+1:
set colorcolumn=+1

" Extended status bar:
set statusline=%<\ %n:%f\ %m%r%y\ %=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

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
set showmatch
set hlsearch

" General format options.
set formatoptions-=o formatoptions+=rqc

" Silence completion messages like "match 1 of 2", which get spammy with
" plugins like YouCompleteMe.
set shortmess+=c

" Highlight space characters:
set list
set listchars=tab:»·,trail:·

" Don't display list characters -- especially tabs -- in Go.
au FileType go set nolist

" Python-specific format options:
autocmd Filetype python setlocal formatoptions-=t formatoptions+=l
autocmd Filetype python setlocal textwidth=80
autocmd Filetype python setlocal comments=b:##,O:#
" Override the unfortunate overrides in the default Python ftplugin. :/
autocmd Filetype python setlocal shiftwidth=2
autocmd Filetype python setlocal softtabstop=2
autocmd Filetype python setlocal tabstop=2

" Ignore Python object files:
set wildignore+=*.pyc,*.pyo

" Override unfortunate silliness in GetPythonIndent():
let g:pyindent_open_paren=0
let g:pyindent_nested_paren=0


" PLUGIN CONFIGURATION
" ====================

" YouCompleteMe
" -------------

let g:ycm_auto_trigger = 0
"TODO: find a trigger that doesn't conflict with UltiSnips.
"let g:ycm_key_invoke_completion = "<c-n>"


" UltiSnips
" ---------

" Make UltiSnips work well with YouCompleteMe:
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" Airline
" -------

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
"let g:airline#extensions#tagbar#enabled=1
"DISABLED on 2018-08-09: breaks horribly with some files. :( (raises several
"lines of error on each cursor motion.)
let g:airline#extensions#tagbar#enabled=0
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


" Syntastic
" ---------

" Load correct check for Syntastic on Python:
let g:syntastic_python_checkers=['flake8', 'python']
let $PYFLAKES_NODOCTEST=1

" Load Syntastic checkers for Go:
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']


" Jedi
" ----

if exists("g:do_activate_youcompleteme") && g:do_activate_youcompleteme == 1
  " We want Jedi for its features, but completion is provided by YCM.
  let g:jedi#completions_enabled = 0

else

  " Let Jedi configure Vim to suit its needs.
  let g:jedi#auto_vim_configuration = 1

  " Don't popup Jedi completion whenever a dot is entered:
  let g:jedi#popup_on_dot = 0

endif

" Only show call signatures in the vim command line. Doing it inline in the
" code window is very buggy.
let g:jedi#show_call_signatures = 2


" Override Jedi shortcuts to avoid conflicts with other plugins:
let g:jedi#goto_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>jn"


" NERD Commenter
" --------------

" Align comments to the left by default.
let NERDDefaultAlign='left'

" Don't insert weird placeholders when commenting stuff with subcomments.
let NERDUsePlaceHolders=0


" vim-go
" ------

" Automatically compute imports on save. Lovely!
let g:go_fmt_command = "goimports"

" Highlight Go things.
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1


" Limelight
" ---------

" Limelight can't compute the proper colors for Solarized, so we let it know
" manually.
"let g:limelight_conceal_ctermfg = 241  " DISABLED while we try out Seoul256.


" Goyo
" ----

" Toggle Limelight alongside Goyo:
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-prosession
" --------------

" Let prosession set the title of the tmux window.
let g:prosession_tmux_title = 1

" Don't run prosession on start-up, we want to let Startify do its thing.
let g:prosession_on_startup = 0

" Use VCS branches on top of directory for the session name:
let g:prosession_per_branch = 1

" TODO: Find a good way to make this work for various VCS setups.
"let g:prosession_branch_cmd = 'hg branch 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null'


" BufExplorer
" -----------

" By default, open new buffer when selecting a file in BufExplorer.
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

" Toggle YouCompleteMe autocompletion:
nnoremap <silent> <leader>yy :let g:ycm_auto_trigger=1-g:ycm_auto_trigger<CR>:echo "Autocompletion toggled."<CR>
nnoremap <silent> <leader>yh :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>

" Trigger Dispatch.
" (Set g:dispatch to the command to be run in Dispatch globally. Make it
" t:dispatch for the current tab and b:dispatch for the current buffer.)
nnoremap <silent> <F9> :wa<CR>:Dispatch<CR>

" Bind key shortcut for NERDtree:
nnoremap <silent> <Leader>f :NERDTreeToggle<CR>

" Bind key shortcut for TagBar:
nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <silent> <Leader>T :TagbarOpenAutoClose<CR>

" Align first = in line:
nnoremap <silent> <Leader>= :Tabularize /^[^=]*\zs=<CR>

" Align colon declarations:
nnoremap <silent> <Leader>: :Tabularize /:\zs/l0l1<CR>

" Bind key shortcut for Ag:
nnoremap <leader>a :LAg<space>
nnoremap <leader>A "9yiw:LAg<space>-w<space><C-R>9<CR>
vnoremap <leader>A "9y:LAg<space>"<C-R>9"<CR>

" Delete trailing whitespace with this:
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<CR>`z

" Select last pasted text:
nnoremap <leader>v V`]

" Open vertical split and switch to it:
nnoremap <leader>w <C-w>v<C-w>l

" Open new tab with current file:
nnoremap <silent> <leader>nn :tabnew<CR>
nnoremap <silent> <leader>nc :tabclose<CR>

" Toggle folding:
noremap <space> zA

" Toggle Goyo:
nmap <leader>zz :Goyo<cr>

" Add empty line above/below:
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

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
