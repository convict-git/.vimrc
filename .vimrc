"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"https://github.com/cstrap/monaco-font and http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf "set gfn=CMU\ Typewriter\ Text\ Bold\ 14 "set gfn=Ubuntu\ Mono\ 13
"set gfn=Monaco\ 10 "set gfn=Monospace\ 10 "set gfn=Terminus\ Medium\ 14
"set gfn=Fixed\ 11 set nornu
set bs=2
set nonu
set gfn=Consolas\ 10.5
" set lines=40 columns=120
set updatetime=100
set history=500
set autoindent
set splitbelow
set splitright
set smartindent
set noswapfile
set tabstop=3
set shiftwidth=3
set expandtab
set smarttab
set autowrite
set nowrap
set ff=unix
set autoread
set wildmenu
set showcmd
set smartcase
set nohlsearch
set ignorecase
set incsearch
set encoding=utf-8
set matchpairs=(:),{:},[:],<:>,':',":"
set noerrorbells
set foldmethod=marker
set mouse=a
set belloff=all
set background=light
set previewheight=25
syntax enable
set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
"set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}
set t_Co=256
set gcr=n-v-c:hor30-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor10-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait0-blinkoff150-blinkon175
set guicursor+=a:blinkon0
set printoptions=paper:A4
" set colorcolumn=80
set completeopt-=preview

""for light schemes
autocmd BufRead,BufNewFile,BufEnter * syn match parens /[\[\](){}]/ | hi parens guifg=black ctermfg=black cterm=bold gui=bold | lcd %:p:h
"for dark schemes
" autocmd BufRead,BufNewFile,BufEnter * syn match parens /[\[\](){}]/ | hi parens guifg=white ctermfg=white cterm=bold gui=bold

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
" colorscheme farNoBoldTMUX
" colorscheme farNoBold " without tmux use this -- Comments reversed

"****************************************************************************
"PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'
Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'enricobacis/vim-airline-clock'
Plugin 'chrisbra/Colorizer'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
"Plugin 'alvan/vim-closetag'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'lambdalisue/vim-fullscreen'
"Plugin 'lpenz/vimcommander'
" Plugin 'cocopon/iceberg.vim'
" Plugin 'rakr/vim-two-firewatch'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'Yggdroot/indentLine'
"for full screen ```sudo apt-get install wmctrl```

call vundle#end()

colorscheme zellner
set background=light
" colorscheme farNoBold set background=dark "/both work together
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:syntastic_mode="passive"
"let g:syntastic_always_populate_loc_list = 1

let g:tagbar_width=40
nnoremap <leader>tag :TagbarToggle<CR>

"nnoremap <C-g> :NERDTreeFocus<CR>
nnoremap <space> :CtrlPCurFile<CR>
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '.viminfo\|*.exe\|*.out'
let g:YcmForceCompileAndDiagnostics = 0
let g:ycm_always_populate_location_list = 1
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 0
let g:syntastic_java_checkers = []

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='badcat'
map <S-m> :NERDTreeToggle<CR>
function! AirlineInit()
   let g:airline_section_z = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_z])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" setlocal statusline=%{countdown#get()} | call countdown#set(4500)
"
"****************************************************************************
"codeforces vim
"
"****************************************************************************
"Man pages for cpp (doesn't works so nice in gvim)
"sudo apt-get install cppman
"autocmd FileType cpp set keywordprg=cppman
"****************************************************************************
"Compilers
" autocmd BufEnter * silent! lcd %:p:h
"
" autocmd filetype cpp nnoremap <C-x> :lcd %:p:h <bar> !clear && clear && tester % 1
autocmd filetype cpp,java,python nnoremap <C-x> :lcd %:p:h <bar> !clear && clear && tester_all % 3 C
autocmd filetype cpp nnoremap <C-c> :lcd %:p:h <bar> !clear && clear && time ./a.out
autocmd filetype java nnoremap <C-c> :lcd %:p:h <bar> !clear && clear && time java -enableassertions %:t:r
autocmd filetype python nnoremap <C-c> :lcd %:p:h <bar> !clear && clear && echo -e "Python3" && time python3 %
autocmd filetype sml nnoremap <C-x> :!clear && clear && sml %
autocmd filetype c nnoremap <C-c> :lcd %:p:h && !clear && clear && gcc -ggdb -DCONVICTION -lm % && ./a.out
autocmd filetype javascript nnoremap <C-c> :!clear && node %
autocmd filetype html nnoremap <C-c> :!google-chrome %<CR>
" autocmd filetype java nnoremap <C-c> :w <bar> !clear && clear && javac % && time java -enableassertions %:t:r < in
autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
autocmd filetype sh nnoremap <C-c> :!clear && clear && sudo chmod +x % && ./%<CR>
"
"****************************************************************************
"
"<C-c> for compiling
"space for ctrlp (file explorer)
" Comments section
"Key bindings
autocmd filetype c,cpp vmap <S-c> :s/^/\/\/ /g<CR>
autocmd filetype asm,py,sh vmap <S-c> :s/^/# /g<CR>
autocmd filetype asm,py,sh vmap <S-x> :s/^# //g<CR>
autocmd filetype c,cpp vmap <S-x> :s/^\/\/ //g<CR>

nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
nnoremap <C-j> :tabNext<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap { 8k
nnoremap } 8j
nnoremap <C-e> 8<C-e>
nnoremap <C-y> 8<C-y>

"<C-n> for nerdtree (file tree)
nnoremap <C-t> :tabnew <bar> Explore<CR>
nnoremap <S-l> :exe "!!"<CR>
"<C-x> for running
nnoremap <F2> :normal "+gP<CR>"
nnoremap <F3> :call VimDiff(
autocmd filetype cpp nnoremap <S-F5> :lcd %:p:h <bar> !clear && clear && g++ -std=gnu++14 -Wall -Wextra -Wshadow -Wfloat-equal -Wconversion -Wshift-overflow=2 -Wduplicated-cond -O2 -DCONVICTION %
autocmd filetype cpp nnoremap <F5> :lcd %:p:h <bar> !clear && clear && compile %
nnoremap <S-F6> :ha > %:t:r <bar> !ps2pdf %:t:r && rm -rf %:t:r
autocmd filetype c,cpp nnoremap <F6> :lcd %:p:h <bar> !clear && clear && valgrind --leak-check=full --show-leak-kinds=all ./a.out
autocmd filetype c,cpp nnoremap <F7> :lcd %:p:h <bar> !clear && clear && gdb ./a.out

autocmd filetype c,cpp nnoremap ; :read ~/Dropbox/myfiles/sport_coding/cplib/snippets/
"autocmd filetype cpp nnoremap <C-x> :cd %:p:h <bar> call RunTest()<CR>
nnoremap <F4> :SyntasticToggleMode<CR>
nnoremap <C-g> :Explore %:p:h<CR>
nnoremap <leader>t :call ShowTestCase()<CR>
nnoremap <C-d> :lcd %:p:h <bar> shell<CR>
nnoremap <C-z> :cd %:p:h <bar> exec '!clear && clear && parse'<CR>
nnoremap <C-a> :cd %:p:h <bar> call AddTestCase()<CR>
nnoremap <S-F9> :silent exec '!gedit % &'
nnoremap <F8> :call ReDraw()<CR>
nnoremap <F10> :source ~/.vimrc
"<F11> for toggling toolbar and menubar
autocmd filetype c,cpp nnoremap <F12> :call Mrconvict()<CR>
autocmd filetype c,cpp nnoremap <S-F12> :call MrconvictAddress()<CR>
nnoremap <F12> :%y+<CR>
nnoremap <S-CR> i<CR><Esc> " Needed for GVIm
autocmd filetype c,cpp nnoremap <leader>ln :lnext<CR>

" nnoremap <leader>cc :call MyTimer(
autocmd filetype cpp nnoremap <leader>rn :random_run %<CR>
nnoremap <leader>cd :Explore ~/Dropbox/myfiles<CR>
nnoremap <leader>hi :!hightail<CR>
nnoremap <leader>cm :%Tabularize /\/\/<CR>
nnoremap <leader>sb :call Submit()
nnoremap <leader>ad :let @+=expand("%:p") <bar> echo expand("%:p")<CR>
nnoremap <leader>my :silent exec 'terminal w3m https://codeforces.com/submissions/mr.convict'<CR>

"****************************************************************************

"templates and other Buffer features
if has("autocmd")
   augroup templates_"
      "autocmd BufEnter *.cpp,*.c,*.cc colorscheme far
      "autocmd BufEnter *.js,*.php,*.html,*.py,in colorscheme jellybeans
      "autocmd BufEnter *.sql,*.md colorscheme peachpuff
      autocmd BufEnter * silent! lcd %:p:h
      autocmd BufEnter .vimrc,*.vim,*.cpp,*.c,*.java,*.py :TagbarOpen
      " autocmd BufEnter .vimrc,*.vim,*.cpp,*.c,*.java,*.py call MyTagbarRefresh()
      autocmd BufEnter *.exe,*.out !xterm -e "./%; read"
      autocmd BufEnter *.jar !xterm -e "java -jar %; read"
      autocmd BufNewFile *.cpp 0r ~/Dropbox/myfiles/sport_coding/cplib/temp.cpp
      autocmd BufNewFile *.java 0r ~/Dropbox/myfiles/sport_coding/cplib/temp.java
      " autocmd BufEnter *.cpp :exec '3,19 fold'
      autocmd BufNewFile *.asm 0r ~/Dropbox/myfiles/mips/temp.asm
      autocmd BufNewFile *.cc 0r ~/temp.cc
      autocmd BufNewFile *.c 0r ~/temp.c
      autocmd BufNewFile *.html 0r ~/temp.html
      autocmd BufWrite *.sql %y+
      " autocmd BufWinLeave *.cpp,*.c,.vimrc,*.py,*.java mkview
      " autocmd BufWinEnter *.cpp,*.c,.vimrc,*.py,*.java silent loadview
   augroup END
endif

"****************************************************************************
"
"Cursor retains the position
autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
"****************************************************************************
function! ReDraw()
   exec 'autocmd BufRead,BufNewFile,BufEnter * syn match parens /[\[\](){}]/ | hi parens guifg=white ctermfg=white cterm=bold gui=bold'
   colorscheme PaperColor
   set background=dark
   lcd %:p:h
   exec 'e'
endfunction
"/****************************************************************************/
"Menu and Toolbar toggle
"
function! ToggleGUICruft()
   if &guioptions=='i'
      exec('set guioptions=imTrL')
   else
      exec('set guioptions=i')
   endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i


"/****************************************************************************/
"Removes trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

"/****************************************************************************/
"
"My functions for gvim && competitive
"
"sudo mv parse.py /usr/bin/parse
"nnoremap <C-z> :cd %:p:h <bar> call Parse()<CR>
"self check test cases
"autocmd filetype cpp nnoremap <C-a> :cd %:p:h <bar> call AddTestCase()<CR>
"autocmd filetype cpp nnoremap <C-x> :cd %:p:h <bar> !xterm -e "./test.sh; read"<CR><CR>
"

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
function! Mrconvict()
   silent exec '0r ~/Dropbox/myfiles/sport_coding/cplib/mrconvict.cpp'
   exec '%y+'
   exec 'w'
   exec '!clear && clear && yank_to_submit % 3'
   silent exec '1,8d | w'
endfunction

function! MrconvictAddress()
   exec '0r ~/Dropbox/myfiles/sport_coding/cplib/mrconvict.cpp'
   exec 'w'
   exec '!clear && clear && yank_to_submit % 3'
   let @+=expand("%:p")
   echo expand("%:p")
   let pasted = input('Submitted?')
   silent exec '1,8d | w'
endfunction

"silent exec '!gnome-terminal --tab -- w3m https://codeforces.com/problemset/submit/' . l:submit_contest. ' '
function! VimDiff(i)
   exec '!vimdiff output' . a:i.' my_output' . a:i. ' '
endfunction

function! ReadProblem()
   let @+=expand("%:p")
   echo expand("%:p")
   let submit_contest = input('Read problem thru? Terminal(t), Chrome(c), Firefox(f) : ')
   if confirm == 't'
      silent exec 'terminal w3m https://codeforces.com/problemset/submit/' . l:submit_contest. ' '
   elif confirm == 'c'
   exec '!google-chrome https://codeforces.com/problemset/submit/' . l:submit_contest. ' '
elif confirm == 'f'
exec '!firefox https://codeforces.com/problemset/submit/' . l:submit_contest. ' '
  endif
endfunction

function! Submit()
   exec '0r ~/Dropbox/myfiles/sport_coding/cplib/mrconvict.cpp'
   write
   exec '!clear && clear && cfsubmit %'
   exec '1,8d'
   write
endfunction

function! AddTestCase()
   let filename = expand("%:t:r")
   let fileNameRegExInput = matchstr(filename, 'input*')
   let fileNameRegExOutput = matchstr(filename, 'output*')
   if (!empty(fileNameRegExOutput))
      exec 'wq | wq | wq'
   elseif (!empty(fileNameRegExInput))
      exec 'q | q | q'
   else
      let index = 1
      while !empty(glob("input".index))
         let index += 1
      endwhile
      exec '15sp my_output' . index . ' | aboveleft vsplit output' . index . ' | aboveleft vsplit input' . index
      "normal "+gP<CR>"
   endif
endfunction

function! TestOutput()
   let filename = expand("%:t:r")
   let fileNameRegExInput = matchstr(filename, 'input*')
   if (empty(fileNameRegExInput))
      echo "It says yes"
   endif
endfunction

function! GetInputIdx()
   let filename = expand("%:t:r")
   let fileNameRegExInput = matchstr(filename, 'input*')
   let fileNameRegExOutput = matchstr(filename, 'output*')
   let fileNameRegExMyOutput = matchstr(filename, 'my_output*')

   if (!empty(fileNameRegExInput))
      let index = 1
      let guessFilename = 'input' . index
      while empty(matchstr(filename, guessFilename))
         let index += 1
         let guessFilename = 'input'. index
      endwhile
      return index
   elseif (!empty(fileNameRegExOutput))
      let index = 1
      let guessFilename = 'output' . index
      while empty(matchstr(filename, guessFilename))
         let index += 1
         let guessFilename = 'output'. index
      endwhile
      return index
   elseif (!empty(fileNameRegExMyOutput))
      let index = 1
      let guessFilename = 'my_output' . index
      while empty(matchstr(filename, guessFilename))
         let index += 1
         let guessFilename = 'my_output'. index
      endwhile
      return index
   else
      return -1
   endif
endfunction

function! ShowTestCase()
   if empty(glob("input1"))
      echo "No Test cases found"
   else
      let mxIdx = 1
      while !empty(glob("input".mxIdx))
         let mxIdx += 1
      endwhile
      let curIdx = GetInputIdx()
      if (curIdx == -1)
         exec '15sp my_output1 | aboveleft vsplit output1 | aboveleft vsplit input1'
      else
         let curIdx += 1
         let curIdx = (curIdx % mxIdx)
         if (curIdx == 0)
            let curIdx += 1
         endif
         exec 'bd! | bd! | bd! | 15sp my_output' . curIdx . ' | aboveleft vsplit output' . curIdx ' | aboveleft vsplit input' . curIdx
      endif
   endif
endfunction
function! TrialTest()
   let file = input ('Input file : ')
   exec '!xterm -e "time ./a.out ' . file '; read"'
   "  if empty(glob("input1"))
   "     let fileVar = input ('Input file: ')
   "     :exec '!clear && clear && echo -e "\033[42mCustom Input\033[0m\033[1m\n" && ./a.out' . fileVar
   "     :exec '!echo -e "\033[0m"'
   "  else
   "     let idx = input ('Test Case: ')
   "     :exec '!clear && clear && ./a.out < input' . idx
   "  endif
endfunction


function! OpenHTML()
   let confirm = input ('Edit this file? (y/n) : ')
   if confirm != 'y'
      silent exec '!gnome-terminal --tab -- firefox % &'
      exec 'Explore %:p:h'
   endif
endfunction

function! OpenPdf()
   let confirm = input ('Edit this file? (y/n) : ')
   if confirm != 'y'
      exec '!gnome-terminal --tab -- evince % &'
      exec 'Explore %:p:h'
   endif
endfunction

function! MyTagbarRefresh()
   exec 'TagbarToggle'
   exec 'TagbarToggle'
endfunction

autocmd vimenter * if !argc() | Explore ~/Dropbox/myfiles/sport_coding | endif
" autocmd vimenter * if !argc() | Explore | endif

"trial functions
let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
   if win_gotoid(s:term_win)
      hide
   else
      new terminal
      exec "resize ".a:height
      try
         exec "buffer ".s:term_buf
         exec "bd terminal"
      catch
         call termopen($SHELL, {"detach": 0})
         let s:term_buf = bufnr("")
         setlocal nonu nornu scl=no nocul
      endtry
      startinsert!
      let s:term_win = win_getid())
   endif
endfunction"


""not my functions
function! MarkWindowSwap()
   let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
   "Mark destination
   let curNum = winnr()
   let curBuf = bufnr( "%" )
   exe g:markedWinNum . "wincmd w"
   "Switch to source and shuffle dest->source
   let markedBuf = bufnr( "%" )
   "Hide and open so that we aren't prompted and keep history
   exe 'hide buf' curBuf
   "Switch to dest and shuffle source->dest
   exe curNum . "wincmd w"
   "Hide and open so that we aren't prompted and keep history
   exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


function! My_Tab_Completion()
   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-P>"
   else
      return "\<Tab>"
   endif
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>


