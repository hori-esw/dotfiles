"背景色
set background=light
"インデントの設定
set autoindent
set smartindent
" タブ幅の設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
"行番号の表示
set number
"カーソル行強調
"重くなるので試しにOFF
" set cursorline
"再描画をlazyに
set lazyredraw
set incsearch    "インクリメンタルサーチを行う
set hlsearch    "検索結果をハイライトする
set ignorecase    "検索時に文字の大小を区別しない
set smartcase    "検索時に大文字を含んでいたら大小を区別する
set wrapscan    "検索をファイルの先頭へループする
"" 空白文字を表示
"タブ、行末等の不可視文字を表示する
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
"シンタックス設定
syntax on
"ステータス行表示設定
"http://ogawa.s18.xrea.com/fswiki/wiki.cgi?page=Vim%A4%CE%A5%E1%A5%E2
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w[%Y]%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
"ビープ音すべてを無効にする
"set visualbell
set t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
"常にPerlのような正規表現(+, |, ?など)が使えるようにする
"http://d.hatena.ne.jp/tyru/20111214/play_with_vim_regexp#20111214fn2
nnoremap / /\v
" .md他の拡張子をmarkdownファイルだと認識させる。
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" 無名レジスタに入るデータを、*レジスタにも入れる。
set clipboard=unnamedplus
"印刷時フォント設定
set printfont=ＭＳ_ゴシック:h12:cSHIFTJIS

set backupdir=~/.vim/vim_bk/ "バックアップディレクトリを指定する
set directory=~/.vim/vim_bk/    "スワップファイルディレクトリを指定する
set undodir=~/.vim/vim_bk/     "アンドゥファイルディレクトリを指定する
" fcitx
set iminsert=2
set imsearch=2
set imactivatefunc=ImActivate
function! ImActivate(active)
  if a:active
    call system('fcitx-remote -o')
  else
    call system('fcitx-remote -c')
  endif
endfunction
"set imstatusfunc=ImStatus
"function! ImStatus()
"  return system('fcitx-remote')[0] is# '2'
"endfunction
