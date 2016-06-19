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

" Lang-specific
Plugin 'godlygeek/tabular'                  " Vim script for text filtering and alignment; also required by vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'slim-template/vim-slim'

" Ruby
Plugin 'tpope/vim-rails'                    " Rails syntax
Plugin 'gmitrev/vim-ruby'                   " Using my fork because of the support for (), {} and []
Plugin 'vim-scripts/ruby.vim--IGREQUE'      " Improved Indendation
Plugin 'tpope/vim-endwise'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/vim-cjsx'
Plugin 'othree/javascript-libraries-syntax.vim'

" Html
Plugin 'mattn/emmet-vim'

" Clj
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Git
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'scrooloose/syntastic'
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
Plugin 'kien/ctrlp.vim'                     " Quick file navigation
Plugin 'JazzCore/ctrlp-cmatcher'            " Better matching algorithm for ctrlp. Requires additional installation

" Util
Plugin 'danro/rename.vim'                   " A command and function that basically does a ':saveas <newfile>' then removes the old filename on the disk.
Plugin 'AndrewRadev/writable_search.vim'    " Useful for global search and replace
Plugin 'vimwiki/vimwiki.git'

" Text transformation
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'terryma/vim-multiple-cursors'

" Themes
Plugin 'gmitrev/amalgam.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ap/vim-css-color'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'thoughtbot/vim-rspec'

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
set textwidth=79    " Maximum width of text that is being inserted. A longer
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
" set rnu             " Show relative line numbers
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

set term=screen-256color " Better colors

syntax on

set background=dark
color amalgam
" hi Normal ctermbg=none
" set background=light
" colorscheme solarized

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
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make j and k jump visual, not real lines
nnoremap j gj
nnoremap k gk

" No need to type 'asdasdasfdgfd' after search to clear highlights
nmap <silent> <leader>q :nohlsearch<CR>

" Show highlight group for object under cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

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

" Slimux bindings
map <Leader>e :SlimuxREPLSendSelection<CR>
map <Leader>r :SlimuxREPLSendLine<CR>

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

" Java config
au Filetype java setl et ts=4 sw=4

" Ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>p :CtrlPTag<CR>
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' } " Use better matching algorithm
let g:ctrlp_max_files = 100000 " Use better matching algorithm

" Edit/source vimrc bindings
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_matchpairs = 1

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" nmap <space> <Plug>(easymotion-s)
nmap <space> <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
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
      \ 'separator': { 'left': '', 'right': ''  },
      \ 'subseparator': { 'left': '', 'right': ''  }
      \ }

" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': ''  },
"       \ 'subseparator': { 'left': '', 'right': ''  }
"       \ }

" Remove trailing spaces on save (oh yeah)
autocmd BufWritePre * :%s/\s\+$//e

" Ignore crappy folders
let g:ctrlp_custom_ignore = '\v[\/](coverage|tmp|out|node_modules|deps|_build)$'

set list listchars=precedes:<,extends:>
set list listchars=tab:>-,trail:·,precedes:<,extends:>

" Tabular mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>

" syntastic config
let g:syntastic_check_on_open = 1
let g:syntastic_ruby_checkers = ['mri']

" Highlight debugging statements
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.rb syn match error contained "\<byebug\>"

autocmd Filetype gitcommit setlocal spell textwidth=72

cnoremap w!! %!sudo tee > /dev/null %

" NERDTree
map <F4> <plug>NERDTreeTabsToggle<CR>
nmap <F5> :NERDTreeFind<CR>

" Config custom js libs
let g:used_javascript_libs = 'react,jquery'

" Use react syntax on plain old .js files
let g:jsx_ext_required = 0

" Vertical column at char 100
set colorcolumn=100

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!zeus test {spec}"

function RunRubocopOnCurrentFile()
  execute "!bundle exec rubocop %"
endfunction
map <Leader>g :call RunRubocopOnCurrentFile()<CR>

vnoremap <C-c> "+y

" Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
