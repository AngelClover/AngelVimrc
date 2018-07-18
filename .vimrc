"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-node'
Plugin 'taglist.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'w0rp/ale'
Plugin 'rizzatti/dash.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'pangloss/vim-javascript'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"my vimrc @baidu
set tags+=~/gao/tags
set rtp+=~/.vim/bundle/vim-pathogen
set rtp+=~/.vim/bundle/dash.vim
set rtp+=~/.vim/bundle/vim-vue/
set rtp+=~/.vim/vim/runtime
"execute pathogen#infect("~/.vim/bundle/{}")
"set rtp+=~/.vim/bundle/nerdtree
"set rtp+=~/.vim/bundle/vim-nerdtree-tabs
"set rtp+=~/.vim/bundle/nerdtree-git-plugin 
"autocmd GUIEnter * winpos 0 0  | set lines=999 columns=100
func Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
"iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
"iab {} {<cr>}<esc>O<C-R>=Eatchar('\s')<cr>

set mousemodel=popup 
if has("gui_running")
    set foldmethod=indent
	let psc_style='cool'
	"dark
	"color baycomb
	"color candycode
	"color inkpot
	"color lucius
	"color matrix
	"color mustang
	"color neverness "good
	"color night
	"color nightflight
	"color nightshade_print
	"color rainbow_night
	"color desert
	"color rdark
	"color sift
	"color xoria256
	"color molokaimine
	"color slate
	"color gemcolors
	color molokai 
	"color cobalt
	"color inkpot
	"color leo
	"color codeblocks_dark
	"set cursorline
	
	"color vcbc
	"color White2
	"color DevC++mine
	"color bclear
	"color chela_light
	"color delek 
	"color delphi
	"color eclipse
	"color emacs
	"color gobo
	"color kate
	"color lazarus
	"color rainbow_fruit
	"color tolerable
	"color vexorian

	set guioptions-=m "remove menubar"
	set guioptions-=T "remove toolbar"
	"set guioptions-=r " Remove h_scroll bar "
	"set guioptions-=r " Remove v_scroll bar "
	"set guifont=Monaco\ 10
	"set guifont=Consolas\ 10
	"set guifont=Droid\ Sans\ Mono\ 10
	"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
	set guifont=monospace\ 10
	"set guifont=Courier\ 10\ Pitch\ 10
	"set guifont=Courier\ New\ 10
	"set guifont=Luxi\ Mono\ 10
	"set guifont=YaHei\ Consolas\ Hybrid\ 10
	"set guifont=Inconsolata\ 10
	set guitablabel=%t "标签显示设置
	set cursorline

	"set novisualbell
	"set balloondelay=5000
	"set noballooneval

else 
	set vb t_vb=
	set t_Co=256 
	set cursorline
	"colo delek
	"colo bmichaelsen
	"colo developer 
	"colo delek
	"colo satori
	"color railcasts
	color molokai
	"color mustang
	"color mustangmine
	"color lucius
	"color nightflight
	"
	"color rdark-terminal
	"colo xoria256
	"color inkpot
	"colo leo
	"set cursorline
endif
"*****************************Color  Ends***************************************
"minibufexplpp
"let g:miniBufExplMapWindowNavVim = 0 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

func MyInfo()
	call AuthorInfoDetect
endfunc


set wildmode=longest,list "List all matches without completing, then each full match
"set wildmode=list:full

"set textwidth=78I
"ab #D <esc>v:!date<cr>

map<F4> :call AddComment()<cr>
func AddComment()
    if (&filetype=='vim')
        if (getline('.')[0] == '"')
            normal ^xx
        else
            normal 0i" 
        endif
        return
    endif 
    if (&filetype=='python')
        if (getline('.')[0] == '#')
            normal ^xx
        else
            normal 0i# 
        endif
        return
    endif
    if (&filetype=='cpp')
        if (getline('.')[0] == '/')
            normal ^xxx
        else
            normal 0i// 
        endif
        return
    endif
    if (&filetype=='js')
        if (getline('.')[0] == '/')
            normal ^xxx
        else
            normal 0i// 
        endif
        return
    endif
    if (getline('.')[0] == '/')
        normal ^xxx
    else
        normal 0i// 
    endif
endfunc

function! CppHeaderBaidu()
	call setline(1,'#include<iostream>')
	call setline(2,'#include<cstdio>')
	call setline(3,'#include<cstdlib>')
	call setline(4,'#include<cstring>')
	call setline(5,'#include<algorithm>')
	call setline(6,'#include<cassert>')
	call setline(7,'#include<cmath>')
	call setline(8,'#include<queue>')
	call setline(9,'#include<vector>')
	call setline(10,'#include<map>')
	call setline(11,'#include<stack>')
	call setline(12,'#include<set>')
	call setline(13,'using namespace std;')
endfunction
function! CppHeader()
	call setline(1,'const int Debug = 1;')
	call setline(2,'/*')
	call setline(3,' * SOUR:')
	call setline(4,' * ALGO:')
	call setline(5,' * DATE:'.strftime("%Y%b%d %X"))
	call setline(6,' * COMM:')
	call setline(7,' * */')
	call setline(8,'#include<iostream>')
	call setline(9,'#include<cstdio>')
	call setline(10,'#include<cstdlib>')
	call setline(11,'#include<cstring>')
	call setline(12,'#include<algorithm>')
	call setline(13,'#include<cassert>')
	call setline(14,'#include<cmath>')
	call setline(15,'#include<queue>')
	call setline(16,'#include<vector>')
	call setline(17,'#include<map>')
	call setline(18,'#include<stack>')
	call setline(19,'#include<set>')
	call setline(20,'using namespace std;')
	call setline(21,'#define pb(x) push_back(x)')
	call setline(22,'#define fi first')
	call setline(23,'#define se second')
	call setline(24,'#define rab(i,a,b) for(int i(a), _n(b); i <= (_n); i++)')
	call setline(25,'#define rep(i,n) rab(i,0,(n)-1)')
	call setline(26,' ')
	call setline(27,'typedef std::vector < int >vi;')
	call setline(28,'typedef std::pair < int, int > pii;')
	call setline(29,'typedef long long LL;')
	call setline(30,' ')
	call setline(31,'template <class T> void ckmin(T &a,T b) { if (a > b) { a = b; } }')
	call setline(32,'template <class T> void ckmax(T &a,T b) { if (a < b) { a = b; } }')
	call setline(33,'template <class T> void pr(T &a) { cout << a << '' ''; }')
	call setline(34,'template <class T> void print(T &a) { a.__str__(); }')
	call setline(35,'template <class T> int size(const vector<T> &v) { return (int)v.size(); }')
	call setline(36,'#define fpr(...) \')
	call setline(37,'	fprintf(stderr, "%s(%d)-%s: ",__FILE__,__LINE__,__FUNCTION__); \')
	call setline(38,'fprintf(stderr, __VA_ARGS__);')
	call setline(39,'int countbit(int n) { return n == 0 ? 0 : 1 + countbit(n & (n - 1)); }')
	call setline(40,' ')
	call setline(41,'const int maxint = 0x7fffffff;')
	call setline(42,'const long long max64 = 0x7fffffffffffffffll;')
	call setline(43,'/*Every problem has a simple, fast and wrong solution.*/')
	call setline(44,'/*std::ios::sync_with_stdio(false);*/')
	call setline(45,' ')
	call setline(45,' ') 
	call setline(46,'int main()')
	call setline(47,'{')
	call setline(48,'    return 0;')
	call setline(49,'}')
endfunction

function! PyHeader()
	call setline(1,'#!/usr/bin/python') 
	call setline(2,'#coding=utf-8') 
	call setline(3,'import os')
	call setline(4,'import re')
	call setline(5,'import sys') 
	call setline(6,'import md5')
	call setline(7,'import json')
	call setline(8,'import copy')
	call setline(9,'import getopt')
	call setline(10,'import shutil')
	call setline(11,'import logging')
	call setline(12,'import urllib2')
	call setline(13,'')
	call setline(14,'if __name__ == "__main__":') 
	call setline(15,'    return 0')
endfunction

function! PHPHeader()
	call setline(1,'<html>')
	call setline(2,'<title> <?php echo date("Y-m-d H:i:s");?> </title>')
	call setline(3,'<body>')
	call setline(4,'')
	call setline(5,'</body>')
	call setline(6,'</html>')
endfunction
function! HtmlHeader()
	call setline(1,'<html>')
	call setline(2,'<title> <?php echo date("Y-m-d H:i:s");?> </title>')
	call setline(3,'<body>')
	call setline(4,'')
	call setline(5,'</body>')
	call setline(6,'</html>')
endfunction

"failed
function! HHeaderBaidu()
	call append(21,'#include<iostream>')
	call append(22,'#include<cstdio>')
	call append(23,'#include<cstdlib>')
	call append(24,'#include<cstring>')
	call append(25,'#include<algorithm>')
	call append(26,'#include<cassert>')
	call append(27,'#include<cmath>')
	call append(28,'#include<queue>')
	call append(29,'#include<vector>')
	call append(30,'#include<map>')
	call append(31,'#include<stack>')
	call append(32,'#include<set>')
	call append(33,'using namespace std;')
endfunction

"autocmd BufNewFile *.c,*.cpp,*.cc call CppHeaderBaidu()
autocmd BufNewFile *.cpp,*.h 0read ~/.vim/skeletons/skel.cpp 
autocmd BufNewFile *.vue 0read ~/.vim/skeletons/skel.vue
autocmd BufNewFile *.c 0read ~/.vim/skeletons/skel.c 
"autocmd BufNewFile *.h call HHeaderBaidu()
autocmd BufNewFile *.py call PyHeader()
autocmd BufNewFile *.php call PHPHeader()
autocmd BufNewFile *.html,*.htm call HtmlHeader()
autocmd BufNewFile,BufRead *.cu set ft=cuda
autocmd BufNewFile,BufRead *.vue set ft=html

iab #i #include<iostream><cr>#include<cstdio><cr>#include<cstdlib><cr>#include<cstring><cr>#include<algorithm><cr>#include<cassert><cr>#include<cmath><cr>#include<queue><cr>#include<vector><cr>#include<map><cr>#include<stack><cr>#include<set><cr>

iab #I const int Debug = 1;<cr>/* <cr>SOUR:<cr>ALGO:<cr><esc>v:!date<cr>I * DATE: <esc>oCOMM:<cr>*/<cr>#include<iostream><cr>#include<cstdio><cr>#include<cstdlib><cr>#include<cstring><cr>#include<algorithm><cr>#include<cassert><cr>#include<cmath><cr>#include<queue><cr>#include<vector><cr>#include<map><cr>#include<stack><cr>#include<set><cr>using namespace std;<cr>#define pb(x) push_back(x)<cr>#define fi first<cr>#define se second<cr><cr>typedef std::vector < int >vi;<cr>typedef std::pair < int, int > pii;<cr>typedef long long LL;<cr><cr>template <class T> void ckmin(T &a,T b) { if (a > b) { a = b; } }<cr>template <class T> void ckmax(T &a,T b) { if (a < b) { a = b; } }<cr>template <class T> void pr(T &a) { std::cout << a << ' '; }<cr>int countbit(int n) { return n == 0 ? 0 : 1 + countbit(n & (n - 1)); }<cr><cr>const int maxint = 0x7fffffff;<cr>const long long max64 = 0x7fffffffffffffffll;<cr>/*Every problem has a simple, fast and wrong solution.*/<cr>/*std::ios::sync_with_stdio(false);*/<cr><cr>int main()<cr>{<cr>return 0;<cr>}

"au BufWinLeave *.* mkview "remember fold
"au BufWinEnter *.* loadview "load fold
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> sc	   scanf("");<esc>0f"a<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> scanf   scanf("");<esc>0f"a<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> printf   printf("");<esc>0f"a<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> pr   printf("");<esc>0f"a<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> fun   () <cr>{<cr>}<esc>kk0f)i<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> fpr   fprintf(stderr,"\n");<esc>0f"a<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> if    if () {<cr>}<esc>k0f)i<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> for   for () {<cr>}<esc>k0f)i<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> while while () {<cr>}<esc>k0f)i<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> Debug if (Debug) {}<left><cr><C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> debug if (Debug) {<cr>}<esc>ko<C-R>=Eatchar('\s')<cr>

"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> IF    if
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> FOR   for
"autocmd BufEnter *.c,*.cpp,*.cc,*.h,*.java iab <silent> WHILE while

"autocmd BufEnter *.c,*.cpp,*.cc,*.h iab <silent> elif  else if () {<cr>}<esc>k0f)i<C-R>=Eatchar('\s')<cr>
"autocmd BufEnter *.c,*.cpp,*.cc,*.h iab <silent> else  else {<cr>}<esc>ko
"*****************************const***************************************
"set nowrap
set ambiwidth=double        " ambiwidth 默认值为 single。在其值为 single 时，
" 若 encoding 为 utf-8，gvim 显示全角符号时就会
" 出问题，会当作半角显示。
set smartindent
set autoindent 
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=4 tabstop=8 
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=4
" 打开自动缩进和 C 语言风格的缩进模式，
" 定制 C 语言缩进风格
" 其中 tabstop 表示一个 tab 显示出来是多少个空格的长度，默认 8。
"softtabstop 表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用。
"shiftwidth 表示每一级缩进的长度，一般设置成跟 softtabstop 一样。
"当设置成 expandtab 时，缩进用空格来表示，noexpandtab 则是用制表符表示一个缩进。

set hidden                  " 允许在有未保存的修改时切换缓冲区，
" 此时的修改由切换由 vim 负责保存
set hlsearch                " 搜索时高亮显示被找到的文本
"set ignorecase
set smartcase    " ignorecase "搜索时忽略大小写，但在有一个或以上大写字母时
" 仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果

"交换文件"
"set noswapfile
set dir=~/.vim/swap
set gcr=a:blinkon0 "光标不闪
set nocompatible
set showcmd                          "sc:    shows typed commands
set showmode                    "smd:   shows current vi mode in lower left
"set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=1                "ss:    only scroll horizontally little by little
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set scrolloff=4                 "so:    places a line between the current line and the screen edge
set ttyfast                     "tf:    improves redrawing for newer computers

set fencs=utf-8,GBK,gb18030,ucs-bom,default,latin1
"set fileencodings=GBK,utf-8,ucs-bom,CP936,GB18030,GB2312
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set ruler "编辑过程中，在右下角显示光标位置的状态行
"set rulerformat=%8(%p%%\ %L%)
set rulerformat=%45(%m%t\ \ %=HEX=%B\ %4l\ %3c\ %p%%\ %L%)
"set rulerformat=%50(%m%t%=ascii=%b\ hex=%B\ %4l\ %3c\ %p%%\ %L%)
"set sta" 状态栏各个状态
"tusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
let statusHead         ="%-.50f\ %h%m%r"
let statusBreakPoint   ="%<"
let statusSeparator      ="|"
let statusFileType      ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat    ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii         ="\{%b:0x%B\}"
let statusCwd         ="%-.50{getcwd()}"
let statusBody         =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding      ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank         ="%="
let statusKeymap      ="%k"
let statusRuler         ="%-12.(%lL,%c%VC%)\ %P"
let statusTime         ="%{strftime(\"%y-%m-%d %H:%M:%S\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
"" 最终状态栏的模式字符串
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString
set laststatus=2

"设定文件浏览器目录为当前目录编译器
set bsdir=buffer
set autochdir 
set showmatch "显示匹配括号
set number
set autoread
syntax on "语法高亮度显示
filetype on "检测文件的类型
filetype plugin on
filetype plugin indent on
set autoread "自动加载外部修改了的文件

"默认无备份
set backupdir=~/.vim/backup
set backup
set writebackup

"insert下能用删除键进行删除
set backspace=indent,eol,start

if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\ exe "normal g'\"" |
				\ endif
endif
"阿哈!開啟的文件都要能回到上次離開時的位置才是天公地道的事情呀^_^ 

autocmd BufEnter * syntax on 
""""""""""""""""""""""""""""""搜索高亮"""""""""""""""""""""""""""

"set updatetime=500
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

" taglist 自动启动
let Tlist_File_Fold_Auto_Close=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
"let Tlist_Use_Right_Window=1
let Tlist_Auto_Highlight_Tag=0
let Tlist_Display_Prototype=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1

command W w !sudo tee % > /dev/null

map <M-right>	<C-w>l
map <M-left>	<C-w>h
map <M-up>	    <C-w>k
map <M-down>	<C-w>j
map <M-l>		<C-w>l
map <M-h>		<C-w>h
map <M-k>		<C-w>k
map <M-j>		<C-w>j

map <A-l>		<C-w>l
map <A-h>		<C-w>h

"map <C-right>	:bn<cr>
"map <C-left>	:bp<cr> 
map <C-l>		:bn <cr>
map <C-h>		:bp <cr> 
map <M-d>		:bn<cr> :bd # <cr>
"map <M-d>		<C-w>s:bn<cr><C-w>j:bd<cr>
map <C-w>% :set noscrollbind<cr>:vs<cr>:set scb<cr>2<c-w>w<c-f>:set scb<cr>1<c-w>w

function! SwitchToNextBuffer(incr)
	let help_buffer = (&filetype == 'help')
	let current = bufnr("%")
	let last = bufnr("$")
	let new = current + a:incr
	while 1
		if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
			execute ":buffer ".new
			execute ":bd ".current 
			break
		else
			let new = new + a:incr
			if new < 1
				let new = last
			elseif new > last
				let new = 1
			endif
			if new == current
				break
			endif
		endif
	endwhile
endfunction

"map <silent> <M-d> :call SwitchToNextBuffer(1)<CR>


map <C-up>        <C-y><C-y><C-y><C-y>
map <C-down>      <C-e><C-e><C-e><C-e>

"map  <silent> <F1>   :silent !ctags -R * <cr>
"autocmd BufEnter *.cpp,*.cc,*.cxx map      <silent> <F1> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q * <cr>

":!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
"map <silent> <F2>      :A<cr> 
map <silent> <C-F3>      :LustyFilesystemExplorerFromHere<cr>
map <silent> <S-F3>      :LustyFilesystemExplorer<cr>
"map <silent> <F4>      :set filetype=cpp<cr> 
"map  <silent> <F4>   ,c<space>ll

"map  <silent> <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --tag-relative=yes -f ~/tags/tmp *
"map  <silent> <F6>  :set fenc=utf-8<cr>:wqa<cr>
map <silent> <F6> :FencView<cr>
map  <silent> <F7> :wa<cr>:make<cr>
"map  <silent> <C-F6> :up <cr> :w! %~<cr> :!clean<cr>

"map  <F6> :update<cr>:make -B<cr> :cw<cr> 
"autocmd BufEnter *.cpp,*.cc map <silent><F7> :update<cr> :w! %~<cr> :!clear<cr> :!g++ -g -Wall '%' -o "%<"<CR>
"autocmd BufEnter *.c map <silent><F7> :update<cr> :w! %~<cr> :!clear<cr> :!gcc -g -Wall '%' -o '%<'<CR> 
autocmd BufEnter *.cpp,*.cc,*.cxx,*.h,*.hpp map <silent> <C-F11> :update<cr> :w! %~<cr> :!clear<cr> :!indent '%' -npro -kr -i8 -ts8 -sob -l150 -ss -ncs -cp1  <cr> 
autocmd BufRead  *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class 
autocmd BufEnter *.php map <silent> <F5> :!php -l "%" <cr>
"autocmd BufRead  *.py set shiftwidth=4
"autocmd BufEnter *.py map <silent> <C-F11> :!pydent '%' <cr>
"autocmd BufEnter *.py map <silent> <F5> :!python "%" <cr>
"autocmd BufEnter *.java map  <silent> <C-F11> :update<cr> :!clear<cr>  :!astyle --style=ansi  '%' <cr>
"autocmd BufEnter *.java map  <C-F5> :!clear<cr> :!java '%<' <CR>

map  <silent> <F8>  :Tlist<cr>
"map  <silent> <F9>  :LustyBufferExplorer<cr>
map  <silent> <F9> :MRU <cr>
"map  <silent> <F10>  :BufExplorer<cr>
"map  <silent> <C-F9>  :BufExplorer<cr>
"map  <silent> <F11> :LustyBufferGrep<cr>

let MRU_Max_Entries=20
let g:AutoComplPop_IgnoreCaseOption=1
let g:AutoComplPop_NotEnableAtStartup=1
"map  <silent> <F12> :AuthorInfoDetect <cr>
"map  <silent> <M-F12> :AutoComplPopDisable <cr>

"Disable Middle mouse button to paste
:map  <MiddleMouse> <Nop>
:map! <MiddleMouse> <Nop>
:map  <2-MiddleMouse> <Nop>
:map! <2-MiddleMouse> <Nop>
:map  <3-MiddleMouse> <Nop>
:map! <3-MiddleMouse> <Nop>
"其中2-,3-是为了把鼠标双击，三击(!)也去掉


"-----------------------------ctags--------------------------------------------------

"下面的设置用于当用户预先声明namespace时也能自动补全代码（如使用using std::string）
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_GlobalScopeSearch=1 " 0 or 1
"let OmniCpp_NamespaceSearch=1 " 0 , 1 or 2
"let OmniCpp_DisplayMode=1
"let OmniCpp_ShowScopeInAbbr=0
"let OmniCpp_ShowPrototypeInAbbr=1
"let OmniCpp_ShowAccess=1
"let OmniCpp_MayCompleteDot=1
"let OmniCpp_MayCompleteArrow=1
"let OmniCpp_MayCompleteScope=1
""
"去掉预览窗口的显示
set completeopt=longest,menu

"安装帮助文档
"helptags ~/.vim/doc
set tags=./tags,../tags,../../tags
"command W w !sudo tee % > /dev/null

"⌊⌋⌈⌉←↑→↓↖↗↘↙∞π√ ^ ∴∵∈∪∩Φ / ÷ * × = ≡ ~= ≈ != ≠ >= ≥ <= ≤αβ
"γδεζηθικλμνξοπρστυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥ
"ΦΧΨΩ 
":w !sudo tee % > /dev/null 强制存
"TagList
 let Tlist_Show_One_File=1 " 仅显示当前文件的tags目录  
 let Tlist_Exit_OnlyWindow=1 " 当仅剩下taglist窗口的时候启动关闭
 let Tlist_Ctags_Cmd='/Users/angelclover/Developer/homebrew/bin/ctags'
 map <f10> :Tlist<cr> 
 imap <f10> <esc><f10>a

 "WinManager
 let g:winManagerWindowLayout='FileExplorer|TagList' " 设置窗口布局 
 map <f12> :WMToggle<cr> 
 imap <f12> <esc><f12>a

 "MiniBufExplorer
 let g:miniBufExplMapCTabSwitchBufs = 1 " 供过tab切换窗口（这个好像没有发挥作用，不知道为什么）
 let g:miniBufExplMapWindowNavVim = 1 " 通过h,j,k,l切换窗口
 let g:miniBufExplMapWindowNavArrows = 1 " 通过方向键切换窗口

 "OmniCppComplete
 set tags+=~/.vim/tags/ctags
 set tags+=~/.vim/tags/cpptags
 set tags+=~/.vim/tags/linuxtags
 " OmniCppComplete
 let OmniCpp_NamespaceSearch = 1
 let OmniCpp_GlobalScopeSearch = 1
 let OmniCpp_ShowAccess = 1
 let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
 let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
 let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
 let OmniCpp_MayCompleteScope = 0 " 输入 :: 后自动补全
 "let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
 "配色
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
 " 自动关闭补全窗口
 set completeopt=menuone,menu,longest
 "Grep
nnoremap <silent> <F3> :Grep<CR>
"SuperTab
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" 设置按下<Tab>后默认的补全方式, 默认是<C-P>,
" 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
" 还有其他的补全方式, 你可以看看下面的一些帮助:
" :help ins-completion
" :help compl-omni


set noinsertmode
set encoding=utf-8
set tenc=utf-8
let g:fencview_autodetect=1
let g:fencview_checklines=4000
let g:fencview_auto_patterns='*.cpp,*.h,*.txt,*.htm{l\=},*.py,*.idl'

let NERDTreeWinPos='right'
let NERDTreeWinSize=30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"map <leader>n  <plug>NERDTreeTabsToggle<CR>
map <c-n>  <plug>NERDTreeTabsToggle<CR>
"map <C-n> :NERDTreeToggle<CR>

" 关闭NERDTree快捷键
"map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
"let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=0
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
