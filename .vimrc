" Hello, friend.
" There are many .vimrcs, but this one is mine.
"
" This file is roughly split into the following sections:
" Packaging, Customization, Bindings, Files, Plugins and Misc Fun
"
" In the beginning there was vi, and that could be Improved:
set nocompatible

" -------------------------------
" packaging
" -------------------------------
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/vim-oscyank'
Plug 'preservim/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

call pathogen#infect()

packadd! matchit

" -------------------------------
"  vim customization
" -------------------------------

syntax on
filetype plugin indent on

" terminal handling options
" -------------------------------

set mouse+=a " mouse in terminal
if !has("gui_macvim") && !has("gui_running")
  set ttymouse=xterm2 " supposed to help with tmux
endif

" https://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
" slash also in tmux:
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set termguicolors " real colours in term
colorscheme reslate
" rendering & editing
" -------------------------------
set encoding=utf-8

set wrap                  " wrap long lines
set number
set ruler
set visualbell            " shut the fuck up

set display+=lastline     " when lines overflow, show me the line, not an @
set autoindent            " indent at the same level of the previous line
set backspace=2           " allow backspacing over everything in insert mode

" everything is spaces! and indents are 2 spaces! {
set expandtab							" tab key inserts spaces
set smarttab
set tabstop=2							" tab width
set shiftwidth=2          " indent width
set softtabstop=2					" number of cols for a tab
" }

" file handling:
" -------------------------------
set autoread              " load file when it changes
" no hidden, no autowrite
" everything buffer wise that happens is 'intentional'

" user interface tweaks
" -------------------------------

" searching
set hlsearch              " highlight search
set incsearch
set ignorecase
set smartcase             " ... unless they contain at least one capital letter
set showmatch             " show matching parens, etc
" clear search:
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" w/vim-airline, the mode change msg is redundant:
set noshowmode

set wildmenu
set wildignore+=*.log,*.jpg,*.png,*.gif,*.swp,vendor/rails/**
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*.pdf,*.jpg,*.jpeg

" handle side scrolling
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

"" what's shown if 'set list' is used
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j            " Delete comment character when joining commented lines
endif

" ctags
set tags+=gems.tags
set tags+=stdlib.tags

" Backup and swap files
set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

" -------------------------------
"  Key bindings
" -------------------------------

inoremap jj <Esc>

" Movement & making vim like gui editors
" -------------------------------

" sane movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
vmap <left> h
vmap <right> l


" I like to use shift+arrows for selecting:
imap <S-up> <Esc>vk
imap <S-down> <Esc>vj
imap <S-left> <Esc>vh
imap <S-right> <Esc>vl

map <S-up> <Esc>vk
map <S-down> <Esc>vj
map <S-left> <Esc>vh
map <S-right> <Esc>vl

vmap <S-up> k
vmap <S-down> j
vmap <S-left> h
vmap <S-right> l

" instead of selectmode, let's just go to visual mode
" when pressing shift-arrows
set selectmode=

"  Allow me to use Ctrl-C for copying to system buffer
" -------------------------------
if has("clipboard")
  " copy and paste
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
endif

if !empty($CODESPACES)
  " copy over ssh
  vmap <C-c> :OSCYankVisual<CR>
  " https://github.com/ojroques/vim-oscyank/issues/26
  let g:oscyank_term = 'default'
endif

" alt-arrows, alt-bs should skip over words
" TODO: get this to work for vmap? & alt
imap <M-left> <Esc>Bi
imap <Esc>[1;9D <Esc>Bi

imap <M-right> <Esc>lWi
imap <Esc>[1;9C <Esc>lWi

imap <M-backspace> <Esc>B"_dwi

" switching between tabs
" -------------------------------
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

" by default in OSX alt sends different chars
" so here we map the alt-chars next to the vim equiv
map  †      :tabnew<CR>
map  <A-t> :tabnew<CR>

map º 0gt
map  <A-0> 0gt
imap <A-0> <Esc>0gt

map ¡ 1gt
map  <A-1> 1gt
imap <A-1> <Esc>1gt

map ™ 2gt
map  <A-2> 2gt
imap <A-2> <Esc>2gt

map £ 3gt
map  <A-3> 3gt
imap <A-3> <Esc>3gt

map ¢ 4gt
map  <A-4> 4gt
imap <A-4> <Esc>4gt

map ∞ 5gt
map  <A-5> 5gt
imap <A-5> <Esc>5gt

map § 6gt
map  <A-6> 6gt
imap <A-6> <Esc>6gt

map ¶ 7gt
map  <A-7> 7gt
imap <A-7> <Esc>7gt

map • 8gt
map  <A-8> 8gt
imap <A-8> <Esc>8gt

map ª 9gt
map  <A-9> 9gt
imap <A-9> <Esc>9gt

" move to next/prev tab
map ” gT
map  <A-{> gT
" alt-}
map ’ gt
map  <A-}> gt
" alt-w to close tabs
map ∑ :q<CR>
map <A-w> :q<CR>

" splits
" -------------------------------

" with macmeta turned off, can't just use
" M-arrow, so let's just use alt-shift arrows
map <M-S-left> <C-w>h
map <M-S-down> <C-w>j
map <M-S-up> <C-w>k
map <M-S-right> <C-w>l

" using mapping out Alt specifically:
map <A-S-left> <C-w>h
map <A-S-down> <C-w>j
map <A-S-up> <C-w>k
map <A-S-right> <C-w>l

" for terminal equivalent escape codes:
map <Esc>[1;10D <C-w>h
map <Esc>[1;10B <C-w>j
map <Esc>[1;10A <C-w>k
map <Esc>[1;10C <C-w>l

" with macmeta turned off, alt-, produces ≤
""Horizontal split
map <M-,> :split<CR><C-w>j
map ≤ :split<CR><C-w>j
" with macmeta turned off, alt-. produces ≥
"" Vertical split
map <M-.> :vsplit<CR><C-w>l
map ≥ :vsplit<CR><C-w>l

" Convert vertical to horizontal split
map <M-<> <C-w>K
map ¯ <C-w>K
" Convert horizontal to vertical split
map <M->> <C-w>L
map ˘ <C-w>L

" identation
" -------------------------------
" taken from janus:

" Map command-[ and command-] / alt-[ and alt-] to indenting or outdenting
" while keeping the original selection in visual mode.

vmap ‘ >gv
vmap <A-]> >gv
vmap <D-]> >gv

vmap “ <gv
vmap <A-[> <gv
vmap <D-[> <gv

nmap ‘ >>
nmap <A-]> >>
nmap <D-]> >>

nmap “ <<
nmap <A-[> <<
nmap <D-[> <<

omap ‘ >>
omap <A-]> >>
omap <D-]> >>

omap “ <<
omap <A-[> <<
omap <D-[> <<

imap ‘  <Esc>>>i
imap <A-]> <Esc>>>i
imap <D-]> <Esc>>>i

imap “ <Esc><<i
imap <A-[> <Esc><<i
imap <D-[> <Esc><<i

" commenting 
" -------------------------------
nmap <D-'>  :TComment<CR>
vmap <D-'>  :TComment<CR>
imap <D-'>  <Esc>:TComment<CR>a

nmap æ  :TComment<CR>
vmap æ  :TComment<CR>
imap æ  <Esc>:TComment<CR>a

nmap <A-'>  :TComment<CR>
vmap <A-'>  :TComment<CR>
imap <A-'>  <Esc>:TComment<CR>a

" Environment specific options:
if has("gui_macvim") && has("gui_running")

    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    " VERA SANS MONO FO LIFE
    set guifont=Bitstream\ Vera\ Sans\ Mono:h13
    set guioptions-=T         " no macvim toolbar

    " cmd key + arrows and alt key plus arrows should behave like other text
    " field editors
    map <D-right> $
    map <D-left> 0
    imap <D-right> <Esc>$a
    imap <D-left> <Esc>0i

  else

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif

" ----------------------------------
" Misc bindings:
" ----------------------------------
 " C-i goes 'forwards'
 " C-o goes 'backwards'
map <C-}> <C-w><C-]>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]> :vsp <CR>:exec('tag '.expand('<cword>'))<CR>
map <Leader>1 :NERDTreeFind<CR>
map <Leader>! :NERDTreeToggle<CR>


""" Buffers
" map <M-]> :bnext<CR>
" map <M-[> :bprev<CR>
" map <M-backspace> :bdelete<CR>

" also taken from Janus:
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" upper/lower word
" selection reversed from Janus
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" " upper/lower first char of word
" nmap <leader>u mQgewvU`Q
" nmap <leader>l mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
" open files from wd of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" map :etruby :tabe<bar>:set filetype=ruby 

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
" nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>


" -------------------------------
"" HANDLING FILES
" -------------------------------
" ruby {
  auto BufNewFile,BufRead [cC]apfile set filetype=ruby
  auto BufNewFile,BufRead Gemfile* set filetype=ruby
  auto BufNewFile,BufRead Vagrantfile set filetype=ruby
  auto BufNewFile,BufRead Cheffile set filetype=ruby
  auto BufNewFile,BufRead *.ru set filetype=ruby
  auto BufNewFile,BufRead *.erb set filetype=eruby

  "lol asset pipeline
  autocmd BufNewFile,BufRead *.jsx.erb let b:jsx_ext_found = 1
  autocmd BufNewFile,BufRead *.jsx.erb set filetype=javascript

  "autocomplete pls?
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby nmap <Leader>i :vsplit<CR> <C-w><C-l><C-]>
  au FileType ruby nmap <Leader>I <C-]>

  " via skalnik
  let g:ruby_heredoc_syntax_filetypes = {
    \ "graphql" : {
    \   "start" : "GRAPHQL",
    \},
  \}
" }


" golang {
  auto BufNewFile,BufRead *.go set ft=go
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>g :TagbarToggle<CR>
  au FileType go nmap <Leader>] :GoImplements<CR>

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>c <Plug>(go-test)
  " au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  "If you change the command used by :GoFmt to goimports, it will also manage your imports (e.g., by inserting the missing “fmt” import in the above example):
  let g:go_fmt_command = "goimports"

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

" }

auto BufNewFile,BufRead *.sc set filetype=scheme
auto BufNewFile,BufRead *.json set ft=javascript
au FileType make setl noexpandtab


" add certain tags to html indent
let g:html_indent_inctags="section\|dt"


" -------------------------------
" PLUGINS
" -------------------------------

" fzf ftw
map <Leader>t :FZF<CR>
let g:fzf_layout = { 'down': '40%' }


" rainbow parens {
au VimEnter * RainbowParentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" }

" set up default nerdtree settings
" autocmd vimenter * NERDTree " open by default
"autocmd vimenter * if !argc() | NERDTree | endif " open even if no files are selected
" autocmd VimEnter * wincmd p     " set focus on opened buffer and not nerdtree
" quit when nerdtree is the last buffer standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <Leader>U :UndotreeToggle<cr>

" airline {
let g:airline#extensions#tagbar#enabled = 0
"}


" -------------------
" MISC FUN(ctions)
" -------------------

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" via dctucker:
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
        let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
        let initial = substitute( initial, '\t', '    ', 'g' )
        let linenum = v:foldstart + 1
        while linenum < v:foldend
            let line = getline( linenum )
            let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
            if comment_content != ''
                break
            endif
            let linenum = linenum + 1
        endwhile
        let sub = initial . ' ' . comment_content
    else
        let sub = substitute( line, '\t', repeat(' ', &tabstop), 'g' )
        let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
        if startbrace == '{'
            let line = getline(v:foldend)
            let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
            if endbrace == '}'
                let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
            endif
        endif
    endif
    let n = v:foldend - v:foldstart + 1
    let info = " " . n . " lines"
    let sub = sub . "                                                                                                                  "
    let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
    let fold_w = getwinvar( 0, '&foldcolumn' )
    let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
    return sub . info
endfunction
set foldtext=MyFoldText()

" misc deprecated stuff that i haven't the heart to delete _just yet_
" =====================================================================
" ctrlp {
"  let g:ctrlp_match_window = 'top'
"  let g:ctrlp_lazy_update = 1
"  let g:ctrlp_custom_ignore = {
"        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
"        \ 'file': '\.exe$\|\.so$\|\.dll$' }
"
"  let g:ctrlp_user_command = {
"        \ 'types': {
"        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
"        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"        \ },
"        \ 'fallback': 'find %s -type f'
"        \ }
"  " Reuse already-open buffers? (Default: 'Et')
"  let g:ctrlp_reuse_window = 'NERD'
"
"  " per zerowidth
"  let g:ctrlp_switch_buffer = 'etvh' " jump to buffers where they're already open in the current tab
"  let g:ctrlp_use_caching = 1
"  let g:ctrlp_max_files = 0 " no limits
"  let g:ctrlp_mruf_relative = 1 " only relative MRU files (not cross-project)
"  let g:ctrlp_working_path_mode = 'a'
" "  map <Leader>t :CtrlPMixed<CR> # deprecated in favour or FZF

 "}

"
""
"" STATUS
""

" superseded by airline, so commented out
" if has('cmdline_info')
"     set ruler             " show the ruler
"     " a ruler on steroids
"     set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
"     set showcmd           " show partial commands in status line and
"                           " selected characters/lines in visual mode
" endif

"" superseded by airline, so commented out
" if has('statusline')
"     set laststatus=2     
"     " a statusline, also on steroids
"     set statusline=%m
"     set statusline+=%t
"     set statusline+=%<\ 
"     set statusline+=[%{strlen(&ft)?&ft:'none'},
"     set statusline+=\ %{strlen(&fenc)?&fenc:'none'},
"     set statusline+=\ %{&ff}]
"     set statusline+=%=
"     set statusline+=:\b%n
"     set statusline+=%{fugitive#statusline()}
"     set statusline+=%r%w\ %l,%c%V\ [%b,0x%-8B]
"     set statusline+=%P
" endif
