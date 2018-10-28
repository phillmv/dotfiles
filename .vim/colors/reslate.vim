" Seems to be mostly based off 256-jungle.
" Vim remains relusive and mysterious to me.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="reslate"

"hi String guibg=bg guifg=#87ceeb gui=none
hi ColorColumn      term=reverse ctermbg=4 guibg=DarkRed
hi Comment          term=bold ctermfg=11 guibg=bg guifg=#80a0ff gui=none " nice blue
hi Conceal          ctermfg=7 ctermbg=8 guifg=LightGrey guibg=DarkGrey
hi Constant         ctermfg=13 ctermfg=13 guibg=bg guifg=#ffa0a0 gui=none
hi Cursor           guifg=slategrey guibg=khaki
hi CursorColumn     term=reverse ctermbg=8 guibg=Grey40
hi CursorLine       term=underline cterm=underline guibg=Grey40
hi Define           guibg=bg guifg=#ffd700 gui=bold
hi DiffAdd          term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange       term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete       term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText         term=reverse cterm=bold ctermbg=1 gui=bold guibg=Red
hi Directory        term=bold ctermfg=3 guifg=Cyan
hi ErrorMsg         term=standout cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi FoldColumn       term=standout ctermfg=4 ctermbg=7 guifg=grey20 guibg=black
hi Folded           term=standout ctermfg=7 ctermbg=8 guifg=grey40 guibg=black
hi Function         guibg=bg guifg=#ffdead gui=none
hi Identifier       term=underline cterm=bold ctermfg=11 guibg=bg guifg=#40ffff gui=none
hi IncSearch        term=reverse ctermfg=14 ctermbg=10 guifg=wheat guibg=peru
hi Include          guibg=bg guifg=#ff0000 gui=none
hi LineNr           term=underline ctermfg=3 guifg=grey50
hi MatchParen       term=reverse ctermbg=3 guibg=DarkCyan
hi ModeMsg          term=bold ctermfg=6 gui=bold guifg=goldenrod
hi MoreMsg          term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi NonText          term=bold cterm=bold ctermfg=9 gui=bold guifg=RoyalBlue guibg=grey15
hi Normal           ctermfg=15 ctermbg=0 guifg=White guibg=grey15 "background
hi Operator         guibg=bg guifg=#ff0000 gui=none
hi Pmenu            ctermbg=13 guibg=Magenta
hi PmenuSbar        ctermbg=7 guibg=Grey
hi PmenuSel         ctermbg=8 guibg=DarkGrey
hi PmenuThumb       cterm=reverse gui=reverse
hi PreProc          term=underline ctermfg=9 guibg=bg guifg=#ff80ff gui=none
hi Question         term=standout ctermfg=10 gui=bold guifg=springgreen
hi Search           term=reverse ctermfg=7 ctermbg=9 guifg=wheat guibg=peru
hi SignColumn       term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=Grey
hi Special          term=bold ctermfg=12  guibg=bg guifg=#ffa500 gui=none
hi SpecialKey       term=bold ctermfg=2 guifg=yellowgreen
hi SpellBad         term=reverse ctermbg=12 gui=undercurl guisp=Red
hi SpellCap         term=reverse ctermbg=9 gui=undercurl guisp=Blue
hi SpellLocal       term=underline ctermbg=11 gui=undercurl guisp=Cyan
hi SpellRare        term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi Statement        term=bold ctermfg=14 guibg=bg guifg=#ffff60 gui=bold
hi StatusLine       term=bold,reverse cterm=bold,reverse guifg=grey15 guibg=white
hi StatusLineNC     term=reverse cterm=reverse guifg=grey15 guibg=#c2bfa5
hi String           guibg=bg guifg=#40A629 gui=none " dark greenish
hi TabLine          term=underline cterm=underline ctermfg=15 ctermbg=8 gui=underline guibg=DarkGrey
hi TabLineFill      term=reverse cterm=reverse gui=reverse
hi TabLineSel       term=bold cterm=bold gui=bold
hi Title            term=bold cterm=bold ctermfg=14 gui=bold guifg=gold
hi Title            guibg=bg guifg=#ffd700 gui=bold " nice orange
hi Todo             guibg=#ffff00 guifg=#0000ff gui=none
hi Type             term=underline ctermfg=10 guibg=bg guifg=#60ff60 gui=bold
hi Underlined       guibg=bg guifg=#80a0ff gui=underline
hi VertSplit        term=reverse cterm=reverse guifg=grey15 guibg=#c2bfa5
hi Visual           term=reverse cterm=reverse guifg=khaki guibg=olivedrab
hi VisualNOS        term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg       term=standout ctermfg=1 guifg=salmon
hi WildMenu         term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow


" custom for languages (varies even per syntax file)
hi javaScriptLabel  guibg=bg guifg=#ffa500 gui=none
hi lCursor          guifg=bg guibg=fg
hi rubyPredefinedVariable   guibg=bg guifg=#ffa0a0 gui=none
hi rubyRegexpQuantifier     guifg=wheat
hi htmlEndTag guifg=#ffd700

hi coffeeObjAssign guibg=bg guifg=#ffd700 gui=bold
hi coffeeExtendedOp guibg=bg guifg=#ffd700 gui=none

hi NERDTreeCMD      guifg=#ffd700
hi NERDTreeCWD      guifg=#ffd700
hi NERDTreeDir      guifg=#80a0ff
hi NERDTreeDirSlash guifg=#80a0ff
hi NERDTreeUp       guifg=#40A629

" for completion menu
hi Pmenu ctermbg=238 guibg=brown gui=bold


highlight def StatusLineModified           term=bold cterm=bold,reverse ctermfg=DarkRed  gui=bold guibg=black guifg=white
highlight def StatusLineModifiedNC         term=reverse      cterm=reverse      ctermfg=DarkRed  gui=reverse    guibg=white guifg=grey40


