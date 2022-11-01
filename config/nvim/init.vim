call plug#begin('~/.config/nvim/plugged')
    " Sensible defaults.
    Plug 'tpope/vim-sensible'

    " Just a support for treesitter in nvim
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Requires nodejs and yarn
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }

    " Support for various languages
    Plug 'sheerun/vim-polyglot'

    " Full rust language support, adds cargo commands
    Plug 'rust-lang/rust.vim'

    " Code Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/seoul256.vim'

    " Status line
    Plug 'itchyny/lightline.vim'

    " Smooth scrolling
    Plug 'yonchu/accelerated-smooth-scroll'

    " Navigate files easily
    Plug 'lokaltog/vim-easymotion'

    " Git support
    Plug 'tpope/vim-fugitive'

    " Allow repetition of plugin mappings
    Plug 'tpope/vim-repeat'

    " Commenting plugin
    Plug 'tpope/vim-commentary'

    " Session management
    Plug 'tpope/vim-obsession'

    " Fuzzy search 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " Display diff symbols
    Plug 'mhinz/vim-signify'

  	" FileTree navigator
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggleVCS' }

    " Nerdtree plugin to show git status
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Add developer icons
    Plug 'ryanoasis/vim-devicons'

    " Automatically set cwd
    Plug 'airblade/vim-rooter'

    " View LSP Symbols
    Plug 'liuchengxu/vista.vim'

    " Pulse the line after a search
    Plug 'danilamihailov/beacon.nvim'

    " Highlight word under the cursor
    Plug 'RRethy/vim-illuminate'

    " Distraction free writing
    Plug 'junegunn/goyo.vim'

    " Limelight
    Plug 'junegunn/limelight.vim'

    " CMake support
    Plug 'cdelledonne/vim-cmake'

    " Undo tree
    Plug 'sjl/gundo.vim'

call plug#end()
" }}}

" Options ----------------------------------------------------------------- {{{

let mapleader = ","
" Default to dark color groups for backgrounds
set background=dark

colo seoul256

" Show line numbers
set number

" Give more space for displaying messages
set cmdheight=2

" Limit width to 100
set textwidth=100

" Horizontal splits open below
set splitbelow

" Vertical splits open to the right
set splitright

" Number of visual spaces per TAB
set tabstop=2

" Number of spaces in tab when editing
set softtabstop=2

" Number of columns text is indented with when reindenting using << or >>
set shiftwidth=2

" Highlight matching [{()}]
set showmatch

" Use spaces instead of tabs
set expandtab

" Disable wrapping by default
set nowrap

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" Fold based on indent level
set foldmethod=indent

" Required for operations modifying multiple buffers like rename.
set hidden

" Redraw only when we need to
set lazyredraw

" Disable swap files
set noswapfile

" Use file names as title of terminal while editing
set title

" Hide mouse when typing
set mousehide

" No alarms and no surprises
set noerrorbells visualbell t_vb=

" Yank and paste with the system clipboard
set clipboard=unnamed

" Apply substitutions globally by default
set gdefault

" Ignore certain file types and directories from fuzzy finding
set wildignore+=node_modules/*,target/*

" Make searches case insensitive
set ignorecase

" Override ignorecase option if search contains uppercase characters
set smartcase

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Wrapping options
set formatoptions=tc " Wrap text and comments using textwidth
set formatoptions+=r " Continue comments when pressing ENTER in insert mode
set formatoptions+=q " Enable formatting of comments with qg
set formatoptions+=n " Detect lists for formatting
set formatoptions+=b " Auto-wrap in insert mode, and do not wrap old long lines

" Always show the signcolumn
set signcolumn=yes
" Enable 24-bit RGB color in the TUI
set termguicolors

" }}}

" Keybindings ------------------------------------------------------------- {{{
" Easier movement between windows
noremap <leader>wh <C-w>h
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l

nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>feD :vsplit $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :wa<cr>
nnoremap <leader>sl y:execute @@<cr>
vnoremap <leader>sl ^vg_y:execute @@<cr>
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bb :buffers<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>wd :q<cr>
nnoremap <leader>w- :split<cr>
nnoremap <leader>w/ :vsp<cr>
nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>:call clearmatches()<cr>
" Open a quickfix window for the last search
nnoremap <silent> <leader>en :lopen<cr> :lnext<cr>
nnoremap <silent> <leader>ep :lopen<cr> :lprevious<cr>
nnoremap <silent> <leader>ec :lclose<cr>
nnoremap <silent> <leader>ls :mksession!<cr>
nnoremap <silent> <leader>'  :split<cr> :terminal<cr> :resize 12<cr>i

" Yank entire buffer to clipboard
nnoremap <leader>bY gg"*yGgg"+yG

" Select line and ignore indentation
nnoremap vv ^vg_

" Remap yank register to "
nnoremap "" "0"

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

nnoremap j gj
nnoremap k gk

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Left and right can switch buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" Use Tab and Shift-Tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Suppress newline when completing from popup menu
inoremap <expr> <cr> pumvisible() ? "\<C-Y>" : "\<cr>"

" Jump to previously opened buffer

nnoremap <leader><Tab> :b#<cr>

" Vim-Plug
nnoremap <leader>vpi :PlugInstall<cr>
nnoremap <leader>vpu :PlugUpdate<cr>
nnoremap <leader>vpU :PlugUpgrade<cr>
nnoremap <leader>vpc :PlugClean!<cr>
nnoremap <leader>vps :PlugStatus<cr>

" Goyo with Limelight integration
nnoremap <leader>Tz :Goyo<cr>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Find files using Telescope command-line sugar.
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

" Coc.nvim {{{

" Open Coc config 
nnoremap <leader>CC :CocConfig<cr>

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Mappings for CoCList

" Show all diagnostics.
nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>

" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<cr>

" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<cr>

" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<cr>

" Open yank list
nnoremap <silent><nowait> <leader>cy  :<C-u>CocList -A --normal yank<cr>

" Open Vista using Coc symbols
nnoremap <silent><nowait> <leader>cv  :Vista coc<cr>

" }}}

" Nerd Tree
nnoremap <leader>pt :NERDTreeToggleVCS<cr>

" Rust
autocmd FileType rust nnoremap ,cl :Cbuild --release<cr>
autocmd FileType rust nnoremap ,cx :Crun --release<cr>

" Undo tree
nnoremap <leader>u :GundoToggle<cr>

" }}}

" Settings ---------------------------------------------------------------- {{{

if exists('g:fvim_loaded')
    nnoremap <leader>TF :FVimToggleFullScreen<cr>
endif

" Use fold markers when editing vim files
au BufNewFile,BufRead *.vim set foldmethod=marker

" Properly match comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Toggle relativenumber in insert mode and regular line numbers in normal mode
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Set grep program to ripgrep if available and set the format
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

augroup MyCursorLineGroup
    autocmd!
    au WinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup end

" }}}

let g:rustfmt_autosave = 1

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-rust-analyzer',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ ]

let g:gundo_prefer_python3 = 1

let g:NERDTreeGitStatusUseNerdFonts = 1
