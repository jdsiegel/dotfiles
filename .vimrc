" Clear out all autocmds to be reload friendly
autocmd!

" Load plugins
call plug#begin('~/.vim/plugged')

if isdirectory(expand('~/.fzf'))
  Plug '~/.fzf'
else
  Plug '/usr/local/opt/fzf'
endif

Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-grepper'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'easymotion/vim-easymotion'
Plug 'tomasiser/vim-code-dark'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'dense-analysis/ale'
" Plug 'maximbaz/lightline-ale'
" Plug 'preservim/vim-indent-guides'

" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'

" Language Server

Plug 'yegappan/lsp'

" Filetype plugins

" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'
" Plug 'othree/html5.vim'
Plug 'StanAngeloff/php.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

let mapleader = ";"
let $BASH_ENV = "~/.bash_aliases"

set nocompatible      " Use vim, no vi defaults

set t_Co=256
" set background=dark
" color jellybeans
color codedark

if has('gui_running')
  set guifont=Consolas:h12
endif

syntax enable         " Turn on syntax highlighting allowing local overrides
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set ttyfast
set cursorline

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
" set shell=bash
set nojoinspaces
set re=1                          " Use v1 regex engine for faster Ruby syntax highlighting
set splitbelow
set splitright
set switchbuf=useopen
set mouse=a
set ttymouse=sgr

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
" Fill chars
"set fillchars+=vert:\ 

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


" Wild Mode
set wildmode=longest,list
set wildmenu

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" Ignore Rails specific directories
set wildignore+=*/tmp,*/coverage
" Ignore npm and bower jank
set wildignore+=**/bower_components/*,**/node_modules/*
" Ignore elixir/erlang artifacts
set wildignore+=*/_build,*/deps
" Ignore python artifacts
set wildignore+=*.pyc

set backupdir=~/.vim-tmp,/tmp  " where to put backup files.
set directory=~/.vim-tmp,/tmp  " where to put swap files.

set scrolloff=3
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  "set statusline=%f\ %m\ %r
  "set statusline+=Line:%l/%L[%p%%]
  "set statusline+=Col:%v
  "set statusline+=Buf:#%n
  "set statusline+=[%b][0x%B]

  set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)0x%B
endif

runtime! macros/matchit.vim

"""
" Maps
"""

" Toggle paste mode
nmap <silent> <leader>q :set invpaste<CR>:set paste?<CR>

" Clipboard
map <leader>y "*y
map <leader>p "*p

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize splits with <m-HJKL>
nnoremap <Esc>k 4<c-W>+
nnoremap <Esc>j 4<c-W>-
nnoremap <Esc>h 4<c-W><
nnoremap <Esc>l 4<c-W>>

" Clear the search buffer when hitting <leader>return
nnoremap <leader><cr> :nohlsearch<cr>

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

nnoremap <leader><leader> <c-^>

"""
" Autocommands
"""

au FileType markdown,text set wrap linebreak textwidth=79 nolist
au FileType cpp setlocal commentstring=//\ %s

"""
" junegunn/fzf.vim
"""

nnoremap <silent> <Leader>t :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

"""
" tpope/vim-fugitive
"""

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>


"""
" scrooloose/nerdtree
"""

map <leader>n :NERDTreeToggle<CR>

"""
" mhinz/vim-grepper
"""

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>fg :Grepper -tool git<cr>
nnoremap <leader>fa :Grepper -tool rg<cr>
nnoremap <leader>fs :Grepper -tool rg -side<cr>

let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']
let g:grepper.prompt_mapping_tool = '<leader>fa'

"""
" dense-analysis/ale
"""

nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 0
"let g:ale_sign_column_always = 1
let g:ale_linters = {
      \   'html': ['htmlhint'],
      \   'python': [ 'flake8', 'pylint'],
      \   'cpp': ['clangcheck']
      \}
let g:ale_linters_ignore = {
      \   'ruby': ['rubocop']
      \}
let g:ale_python_flake8_options = '--ignore=E111,E114,E121,E501,W291,W293,F401'
let g:ale_set_balloons = 1

"""
" itchyny/lightline.vim
" maximbaz/lightline-ale
"""

function ShowSyntaxElement()
  return synIDattr(synID(line("."), col("."), 1), "name")
endfunction

let g:lightline = {
    \ 'colorscheme': 'codedark',
    \ }
let g:lightline.component_function = {
    \ 'gitbranch': 'fugitive#head'
    \ }
let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }
let g:lightline.component_type = {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left',
    \ }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'syntax_element' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ], [ 'percent' ],
    \            [ 'fileencoding', 'filetype' ],
    \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
    \ }

"""
" yegappan/lsp
"""

nmap gd :LspGotoDefinition<CR>
nmap gD :LspGotoDeclaration<CR>
nmap gr :LspPeekReferences<CR>
nmap gR :LspShowReferences<CR>
nmap K :LspHover<CR>
nmap <leader>k :LspDiagCurrent<CR>

if executable('clangd')
  let lspOpts = #{
    \   autoHighlightDiags: v:true,
    \   semanticHighlight: v:true
    \ }
  autocmd User LspSetup call LspOptionsSet(lspOpts)

  let lspServers = [#{
    \	  name: 'clang',
    \	  filetype: ['c', 'cpp'],
    \	  path: 'clangd',
    \	  args: ['--background-index']
    \ }]
  autocmd User LspSetup call LspAddServer(lspServers)


  call hlset([
    \  #{name: 'LspSemanticNamespace', default: v:true, linksto: 'LspCxxHlSymNamespace'},
    \  #{name: 'LspSemanticType', default: v:true, linksto: 'Type'},
    \  #{name: 'LspSemanticClass', default: v:true, linksto: 'LspCxxHlSymClass'},
    \  #{name: 'LspSemanticEnum', default: v:true, linksto: 'LspCxxHlSymEnum'},
    \  #{name: 'LspSemanticInterface', default: v:true, linksto: 'TypeDef'},
    \  #{name: 'LspSemanticStruct', default: v:true, linksto: 'LspCxxHlSymStruct'},
    \  #{name: 'LspSemanticTypeParameter', default: v:true, linksto: 'LspCxxHlSymTypeParameter'},
    \  #{name: 'LspSemanticParameter', default: v:true, linksto: 'Identifier'},
    \  #{name: 'LspSemanticVariable', default: v:true, linksto: 'Identifier'},
    \  #{name: 'LspSemanticProperty', default: v:true, linksto: 'Identifier'},
    \  #{name: 'LspSemanticEnumMember', default: v:true, linksto: 'Constant'},
    \  #{name: 'LspSemanticEvent', default: v:true, linksto: 'Identifier'},
    \  #{name: 'LspSemanticFunction', default: v:true, linksto: 'Function'},
    \  #{name: 'LspSemanticMethod', default: v:true, linksto: 'Function'},
    \  #{name: 'LspSemanticMacro', default: v:true, linksto: 'Macro'},
    \  #{name: 'LspSemanticKeyword', default: v:true, linksto: 'Keyword'},
    \  #{name: 'LspSemanticModifier', default: v:true, linksto: 'Type'},
    \  #{name: 'LspSemanticComment', default: v:true, linksto: 'Comment'},
    \  #{name: 'LspSemanticString', default: v:true, linksto: 'String'},
    \  #{name: 'LspSemanticNumber', default: v:true, linksto: 'Number'},
    \  #{name: 'LspSemanticRegexp', default: v:true, linksto: 'String'},
    \  #{name: 'LspSemanticOperator', default: v:true, linksto: 'Operator'},
    \  #{name: 'LspSemanticDecorator', default: v:true, linksto: 'Macro'}
    \ ])
endif

if executable('solargraph')
  " au User lsp_setup call lsp#register_server({
  "   \ 'name': 'solargraph',
  "   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
  "   \ 'initialization_options': {"diagnostics": "true"},
  "   \ 'whitelist': ['ruby'],
  "   \ })
endif

"""
" janko/vim-test
"""

nmap <leader>T :TestFile<CR>
nmap <leader>h :TestNearest<CR>
nmap <leader>a :TestSuite<CR>

"""
" iamcco/markdown-preview.nvim
"""

let g:mkdp_refresh_slow=1

"""
" easymotion/vim-easymotion.git
"""

map <space> <Plug>(easymotion-prefix)
