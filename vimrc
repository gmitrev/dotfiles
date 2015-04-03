scriptencoding utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off

" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'L9'                       " required by other plugins
Plugin 'epeli/slimux'

" Lang-specific
Plugin 'Markdown'
Plugin 'tpope/vim-endwise'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'

" Ruby
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-scripts/ruby.vim--IGREQUE'

" Rust
" Plugin 'wting/rust.vim'

" Clj
" Plugin 'tpope/vim-fireplace'
" Plugin 'guns/vim-clojure-static'
" Plugin 'guns/vim-clojure-highlight'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'surround.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'

" Source
Plugin 'vim-scripts/IndentAnything'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Plugin 'ervandew/supertab'

" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'haya14busa/vim-easyoperator-line'
Bundle 'takac/vim-hardtime'
Plugin 'goldfeld/vim-seek'

" Util
Plugin 'kien/ctrlp.vim'
Plugin 'repeat.vim'
Plugin 'danro/rename.vim'        " A command and function that basically does a ':saveas <newfile>' then removes the old filename on the disk.
Plugin 'rking/ag.vim'
Plugin 'vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

" Text transformation
Plugin 'godlygeek/tabular'        " Vim script for text filtering and alignment
Plugin 'AndrewRadev/splitjoin.vim'

" Themes
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ap/vim-css-color'
Bundle 'itchyny/lightline.vim'

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

set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.


set rnu             " Show relative line numbers
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

set term=screen-256color " Better colors

syntax on

color lucius

" Alias :W to :w
ca W w

" Move a line with Alt+[jk]
nmap <C-k> :m-2<CR>
nmap <C-j> :m+1<CR>

" Replace thanks for flying vim with something more useful
let &titleold=getcwd()

" Remap jj toesc
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

au FileType eruby so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

" Java config
au Filetype java setl et ts=4 sw=4

" Ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>p :CtrlPTag<CR>
nmap <F8> :TagbarToggle<CR>

" Edit/source vimrc bindings
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle abs/rel linenumbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set rnu
  endif
endfunction
nnoremap <C-n> :call NumberToggle()<CR>

let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_matchpairs = 1

" EASYMOTIOn
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

" RainbowParens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 11

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

let g:ctrlp_custom_ignore = '\v[\/](coverage|tmp|out)$'

set list listchars=precedes:<,extends:>
set list listchars=tab:>-,trail:·,precedes:<,extends:>

" Tabular mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Highlight debugging statements
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

autocmd Filetype gitcommit setlocal spell textwidth=72

cnoremap w!! %!sudo tee > /dev/null %
