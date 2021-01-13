" # Fisa-vim-config
" # http://fisadev.github.io/fisa-vim-config/
" # version: 8.2
" https://realpython.com/vim-and-python-a-match-made-in-heaven/#vim-extensions
" # Other ref: https://nvie.com/posts/how-i-boosted-my-vim/

set encoding=utf-8
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:


"" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
"" Code commenter
Plug 'scrooloose/nerdcommenter'
"" Class/module browser (te muestra las defs del archivo)
Plug 'majutsushi/tagbar'
"" Airline (la barrita de abajo)
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
"" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
"" Autoclose (si pones un parentesis, te pone el q cierra)
Plug 'Townk/vim-autoclose'
"" Better autocompletion
Plug 'Shougo/neocomplcache.vim'
"" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
"if has('python')
    " YAPF formatter for Python
"    Plug 'pignacio/vim-yapf-format'
"endif
" Search results counter
"Plug 'IndexedSearch'
" Surround
Plug 'tpope/vim-surround'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'klen/python-mode'
"" Para borrar los espacios en blanco al final de las líneas automágicamente
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
" Para que marque en rojo los espacios al final de las líneas
Plug 'bitc/vim-bad-whitespace'
"
"
" Enable folding of portion of code
"Plug 'tmhedberg/SimpylFold'
" colorsschems (en el vim, apretar, :color + space + tab y te tira los colores a
" elegir
Plug 'roosta/srcery'
Plug 'mkarmona/colorsbox'

" Python and other languages code checker
"Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'fisadev/vim-isort'

" Better file browser
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
" Nerdtree file highlighting
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

"""""""""""""""""""""""""""""""""""""""""""""""""""

" Python autocompletion
" https://github.com/davidhalter/jedi-vim

" ---------------------------------------------- COMMENT
" Code and files fuzzy finder
"Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
"Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding (VERLO,PARA USARLO)
"Plug 'mattn/emmet-vim'
" Git integration(llamar comandos git desde el editor)
"Plug 'motemen/git-vim'
" Tab list panel
"Plug 'kien/tabman.vim'
" Consoles as buffers
"Plug 'rosenfeld/conque-term'
" Indent text object
"Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
"Plug 'jeetsukumaran/vim-indentwise'
" Snippets manager (SnipMate), dependencies, and snippets repo
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'honza/vim-snippets'
"Plug 'garbas/vim-snipmate'
" Automatically sort python imports
"Plug 'fisadev/vim-isort'
" Drag visual blocks arround
"Plug 'fisadev/dragvisuals.vim'
" Window chooser
"Plug 't9md/vim-choosewin'
" Ack code search (requires ack installed in the system)
"Plug 'mileszs/ack.vim'

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" XML/HTML tags navigation
"Plug 'matchit.zip'
" Gvim colorscheme
"Plug 'Wombat'
" Yank history navigation
"Plug 'YankRing.vim'
" ---------------------------------------------- FIN COMMENT

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Plugins loaded in ~/.vim/bundle folder
"
"
" http://kien.github.io/ctrlp.vim/
" FIND FILES
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " Ignore some files
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" no vi-compatible
set nocompatible


" This enabled Vim to load plugins, settings or key mappings that are only
" useful in the context of specific file types.
" allow plugins by file type (required for plugins!)
"To set some file type specific settings, you can now use the following:
" autocmd filetype python set expandtab
"
"To remain compatible with older versions of Vim that do not have the autocmd functions,
" always wrap those functions inside a block like this:
"if has('autocmd')
" endif
filetype plugin on
filetype indent on

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
set nocp
execute pathogen#infect()



" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
"map <M-Right> <c-w>l
"map <M-Left> <c-w>h
"map <M-Up> <c-w>k
"map <M-Down> <c-w>j
"imap <M-Right> <ESC><c-w>l
"imap <M-Left> <ESC><c-w>h
"imap <M-Up> <ESC><c-w>k
"imap <M-Down> <ESC><c-w>j

" Navigate through split windows. Ctrl + [h,j,k,l]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" save as sudo
" ca w!! w !sudo tee "%"
cmap w!! w !sudo tee % >/dev/null

" simple recursive grep
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

:source $HOME/.vim/colors/colorsbox-faff.vim
" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
 "   colorscheme fisa
    colorscheme colorsbox-faff
else
  "  colorscheme fisa
    colorscheme colorsbox-faff
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" ================ BACKUPS =====================

set nobackup                        " DO NOT make backup files
" set backup                        " make backup files
"set undofile                      " persistent undos - undo after you re-open the file

" If we set backup, they will be done in the following folders

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backupdir=~/.vim/dirs/backups " where to put backup files
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" Python-mode ------------------------------

" trim unused whitespaces on save
let g:pymode_trim_whitespaces = 1
" don't use linter, we use syntastic for that
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_fuzzy_completion = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 3
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
" Remember info about open buffers on close
set viminfo^=%

" make your code look pretty
let python_highlight_all=1
syntax on

" flake8 config
let g:flake8_show_quickfix=1  " show (default)
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
let g:flake8_max_markers=100  " number of marks to show
" autocmd BufWritePost *.py call Flake8()

" isort config
let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

" ======================= COMMANDS MAPPING ========================
"
" NERDTree -----------------------------
" toggle nerdtree display
map <F1> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Nopaste ------------------------------
" Toggle paste/nopaste and show the current state
nnoremap <F2> :set invpaste paste?<CR>
" Tasklist ------------------------------
" show pending tasks list
map <F3> :TaskList<CR>
" Tagbar -----------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" Delete last spaces  -----------------------------
" Already done on save
map <F6> :%s/\s\+$<ENTER>
" Call flake -----------------------------
" Done by default, default mapping
" <F7> calls flake8 on current file: default,
" autocmd FileType python map <buffer> <F7> :call flake8#Flake8()<CR>
" Tagbar -----------------------------
command Pdb :normal Oimport pdb;pdb.set_trace()<ESC>:w<ENTER>
map <F9> Oimport pdb;pdb.set_trace()<ESC>:w<ENTER>
" Delete pdb imports
map <F8> :g/\s*import pdb;\s*pdb.set_trace()$/d<ENTER>
"map <F10> :g/\s*import pdb;\s*pdb.set_trace()  # noqa: E999,E702,E231$/d<ENTER>
runtime macros/matchit.vim
" Map F8 to Autopep : TODO: Not working Autopep8
" autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"

" Enable folding of functions/classes with spacebar
" Lo hice con plugin
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
"

" ======================= CONFIGURATIONS ========================


set backspace=indent,eol,start " allow backspacing over everything in insert mode
" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview
set expandtab " tabs and spaces handling
" One particularly useful setting is hidden. Its name isn’t too descriptive, though.
" It hides buffers instead of closing them. This means that you can have unwritten
" changes to a file and open a new file using :e, without being forced to write
" or undo your changes first. Also, undo buffers and marks are preserved while
" the buffer is open. This is an absolute must-have.
set hidden
set hlsearch        " highlighted search results
"set incsearch      " incremental search, show search matches as you type
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise


set ls=2            " always show status bar
set nowrap          " don't wrap lines
set nu              " show line numbers
set pastetoggle=<F2> " Paste big amount of text: paste mode on/off
set scrolloff=0     " when scrolling, keep cursor X lines away from screen border


set showmode
set showmatch       " set show matching parenthesis
syntax on           " syntax highlight on
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title


" No annoying sound on errors
set noerrorbells
" set noerrorbells visualbell t_vb=
set novisualbell
set t_vb=
set tm=500
set noerrorbells         " don't beep, be silent about invalid cursor moves and other errors.
set belloff=all
set visualbell           " don't beep, be silent about invalid cursor moves and other errors.
autocmd GUIEnter * set visualbell t_vb=


set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set list
" set showbreak=\\  " Show linebreaks
" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨ " Bigger characters
autocmd filetype html,xml set listchars-=tab:>. " In html files , some spaces are ok, do now show them
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=4
set tabstop=4       " a tab is four spaces
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Add mouse support (easily resize split windows). If you do not like here is
" how to resize windows: https://vim.fandom.com/wiki/Resize_splits_more_quickly
" https://vimhelp.org/windows.txt.html#window-resize
" Enable
" set mouse=a
" Disable
" set mouse-=a

" We can change tabs and spaces on a file extension basis :
" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
" au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
