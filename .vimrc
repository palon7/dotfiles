" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

helptags ~/.vim/doc
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
syntax on
set whichwrap=b,s,<,>,[,]

set backup
set backupdir=/root/.vim-backup
let &directory = &backupdir
let g:user_zen_settings = {
            \'indentation' : "\t",
            \}
set ambiwidth=double

set nocompatible
set t_Co=256
" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

set hidden
set wildmenu
set showcmd
set hlsearch
" 検索時に大文字・小文字を区別しない
set ignorecase
set smartcase
" 自動で行頭に移動しない
set nostartofline
" ルーラー
set ruler
" ステータスを常に表示
set laststatus=2
" バッファが変更されていたら確認を求める
set confirm
" マウス有効化
set mouse=a
" コマンドラインを二行に
"set cmdheight=2
" 行番号の表示
set number
" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200
" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

nnoremap <C-L> :nohl<CR><C-L>

set nocompatible               " be iMproved
filetype off

set ttymouse=xterm2

command NERDTreeToggle nt

"
" NeoBundle
" 
"

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/AutoComplPop'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
    
    filetype plugin indent on     " required!
    filetype indent on
    syntax on
    
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
 
if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
        \   'insert' : 1,
        \ }}
endif
 
NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}
 
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
 
NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}
 
NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}
 
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}
 
NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}
 
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}
 
NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}


"<TAB>で補完
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
"inoremap <C-tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key
"
"
let g:acp_behaviorKeywordLength = 4

" コメントの色を緑にする
hi Comment ctermfg=lightgreen
" カーソル行の強調表示
" set cursorline
highlight CursorLine ctermbg=234
highlight Search ctermbg=240
" 行移動を左右カーソル移動で可能にする
set whichwrap=b,s,<,>,[,]

hi Pmenu ctermbg=245
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

" ハイライトをEsc連打で消せる
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" インクリメンタルサーチを有効化
set incsearch

set lazyredraw
