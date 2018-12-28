scriptencoding utf-8
set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off

" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'                                        " required by other plugins
Plugin 'epeli/slimux'                              " send text from vim to another tmux pane
Plugin 'jpalardy/vim-slime.git'

" Lang-specific
Plugin 'godlygeek/tabular'                  " Vim script for text filtering and alignment; also required by vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'slim-template/vim-slim'
Plugin 'ayu-theme/ayu-vim'

" Ruby
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ruby.vim--IGREQUE'      " Improved Indendation
Plugin 'tpope/vim-endwise'
Plugin 'janko-m/vim-test'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/javascript-libraries-syntax.vim'

" Html
Plugin 'alvan/vim-closetag'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'                  " Adds :Gbrowse

" Syntax
Plugin 'tomtom/tcomment_vim'

" Indentation
Plugin 'vim-scripts/IndentAnything'

" Autocompletion
Bundle 'surround.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'

" Navigation
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" File navigation
Plugin 'rking/ag.vim'                       " Search in files
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'kien/ctrlp.vim'                     " Quick file navigation
Plugin 'FelikZ/ctrlp-py-matcher'

" Util
Plugin 'vimwiki/vimwiki.git'
Plugin 'airblade/vim-rooter'
Plugin 'ap/vim-css-color'
Plugin 'benmills/vimux'
Plugin 'calebsmith/vim-lambdify'
Plugin 'ngmy/vim-rubocop'

" Themes
Plugin 'gmitrev/amalgam.vim'
Plugin 'gmitrev/darksong.vim'
Plugin 'itchyny/lightline.vim'


call vundle#end()
filetype plugin indent on
filetype plugin on

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set textwidth=99    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode.
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
set colorcolumn=120 " Vertical column at char 120
set title
set nobackup        " We don't want no backup
set noswapfile      " Get rid of swap files
set nocompatible
set gdefault        " Apply substitutions globally by default
set wildmenu         " make cmdline tab completion similar to bash
set nolist          " Don't show invisible characters
set cul             " highlight current line
set scrolloff=3     " scroll when nearing screen top/end
set pastetoggle=<F2> " External copy/paste
" Open splits in the right or bottom
set splitbelow
set splitright
set cursorline      " Highlight current line
set fillchars+=vert:│        "Better vertial split"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on

set background=dark
color darksong

" Alias :W to :w
ca W w

" Move a line with Alt+[jk]
nmap <C-k> :m-2<CR>
nmap <C-j> :m+1<CR>

" Replace thanks for flying vim with something more useful
let &titleold=getcwd()

" Remap jj to esc
inoremap jj <Esc>

" Remap leader
let mapleader=","

" Make j and k jump visual, not real lines
nnoremap j gj
nnoremap k gk

" Make copy and pasting great again
vnoremap <C-c> "+y

" No need to type 'asdasdasfdgfd' after search to clear highlights
nmap <silent> <leader>q :nohlsearch<CR>

" Show highlight group for object under cursor
map <Leader>z :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Center on current line when searching
nmap n nzz
nmap N Nzz

" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set viewoptions=folds

" Swtich between buffers with tab
noremap <tab> gt<CR>
noremap <S-tab> gT<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Syntax config
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.thor set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead .pryrc set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.pp set filetype=ruby
au BufNewFile,BufRead *.prawn set filetype=ruby
au BufNewFile,BufRead Appraisals set filetype=ruby
au BufNewFile,BufRead .psqlrc set filetype=sql
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead bash_profile set filetype=sh
au BufNewFile,BufRead *.vue set filetype=vue.js.html.css
au BufNewFile,BufRead Jenkinsfile* set filetype=groovy

" Ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>p :CtrlPTag<CR>
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
let g:ctrlp_max_files = 100000

" Ignore crappy folders
let g:ctrlp_custom_ignore = '\v[\/](coverage|tmp|out|node_modules|deps|_build)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Edit/source vimrc bindings
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_matchpairs = 1

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap <space> <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap <Leader><space>  <Plug>(easyoperator-line-select)
omap <Leader><space>  <Plug>(easyoperator-line-select)
xmap <Leader><space>  <Plug>(easyoperator-line-select)
nmap d<Leader><space> <Plug>(easyoperator-line-delete)

" Enable lightline
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': ''  },
      \ 'subseparator': { 'left': '', 'right': ''  }
      \ }

set noshowmode

" Remove trailing spaces on save (oh yeah)
autocmd BufWritePre * :%s/\s\+$//e

set list listchars=precedes:<,extends:>
set list listchars=tab:>-,trail:·,precedes:<,extends:>

" Tabular mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>

" Highlight debugging statements
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.rb syn match error contained "\<byebug\>"

" I can't spell
au BufEnter *.rb syn match error contained "\<perfrom\>"
au BufEnter *.rb syn match error contained "\<perfrom_later\>"
au BufEnter *.rb syn match error contained "\<perfrom_now\>"

"
autocmd Filetype gitcommit setlocal spell textwidth=72

" When you forget sudo
cnoremap w!! %!sudo tee > /dev/null %

" NERD Tree
nmap <F3> :NERDTreeFind<CR>
map <F4> <plug>NERDTreeTabsToggle<CR>

" Config custom js libs
let g:used_javascript_libs = 'react,jquery'

" Use react syntax on plain old .js files
let g:jsx_ext_required = 0

" vim-test config
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>a :TestSuite<CR>

let test#strategy = "vimux"
let g:rspec_command = "!zeus test {spec}"

" function RunRubocopOnCurrentFile()
"   execute "!bundle exec rubocop %"
" endfunction
" map <Leader>g :call RunRubocopOnCurrentFile()<CR>
map <Leader>g :RuboCop<CR>

map <Leader>b :Gblame<CR>

" Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

nmap <Leader>dn :VimwikiDiaryNextDay<CR>
vmap <Leader>dn :VimwikiDiaryNextDay<CR>
nmap <Leader>dp :VimwikiDiaryPrevDay<CR>
vmap <Leader>dp :VimwikiDiaryPrevDay<CR>
map <Leader>dd <Plug>VimwikiToggleListItem
map <Leader>db <Plug>Vimwiki2HTMLBrowse

" Closetag config
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.eex"

" Slimux config
let g:slime_target = "tmux"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
map <Leader>r <Plug>SlimeLineSend
map <Leader>e <Plug>SlimeRegionSend

nmap 0 ^

" Use system clipboard
set clipboard=unnamed

set re=1
set rnu
set nocursorline
set lazyredraw
set ttyfast
