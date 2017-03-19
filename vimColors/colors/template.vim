" Vim colorscheme template file
" Author: 
" Maintainer: 
" Notes: 

" --------------------------------
set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="template"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=7       ctermbg=none    cterm=none
"hi Cursor          ctermfg=none    ctermbg=none    cterm=none
"hi CursorLine      ctermfg=none    ctermbg=none    cterm=none
hi LineNr          ctermfg=7       ctermbg=none    cterm=none
"hi CursorLineNR    ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
"hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
"hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
"hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=7       ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
"hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
"hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
"hi TabLine         ctermfg=none    ctermbg=none    cterm=none
"hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
"hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
"hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=15      ctermbg=21      cterm=none
"hi IncSearch       ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=0       ctermbg=7       cterm=none
hi StatusLineNC    ctermfg=7       ctermbg=none    cterm=none
"hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
"hi Question        ctermfg=none    ctermbg=none    cterm=none
"hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
"hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=21      cterm=none
hi Visual          ctermfg=15      ctermbg=21      cterm=none
"hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=8       ctermbg=none    cterm=none

hi Todo            ctermfg=0       ctermbg=226     cterm=none
"hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=7       ctermbg=196     cterm=none
hi ErrorMsg        ctermfg=196     ctermbg=none    cterm=none
hi WarningMsg      ctermfg=226     ctermbg=none    cterm=none
"hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=237     ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
"hi Constant        ctermfg=none    ctermbg=none    cterm=none
"hi String          ctermfg=none    ctermbg=none    cterm=none
"hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
"hi Character       ctermfg=none    ctermbg=none    cterm=none
"hi Number          ctermfg=none    ctermbg=none    cterm=none
"hi Boolean         ctermfg=none    ctermbg=none    cterm=none
"hi Float           ctermfg=none    ctermbg=none    cterm=none

"hi Identifier      ctermfg=none    ctermbg=none    cterm=none
"hi Function        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
"hi Statement       ctermfg=none    ctermbg=none    cterm=none
"hi Conditional     ctermfg=none    ctermbg=none    cterm=none
"hi Repeat          ctermfg=none    ctermbg=none    cterm=none
"hi Label           ctermfg=none    ctermbg=none    cterm=none
"hi Operator        ctermfg=none    ctermbg=none    cterm=none
"hi Keyword         ctermfg=none    ctermbg=none    cterm=none
"hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=2       ctermbg=none    cterm=none

"hi Special         ctermfg=none    ctermbg=none    cterm=none
"hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
"hi Tag             ctermfg=none    ctermbg=none    cterm=none
"hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
"hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
"hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
"hi PreProc         ctermfg=none    ctermbg=none    cterm=none
"hi Include         ctermfg=none    ctermbg=none    cterm=none
"hi Define          ctermfg=none    ctermbg=none    cterm=none
"hi Macro           ctermfg=none    ctermbg=none    cterm=none
"hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

"hi Type            ctermfg=none    ctermbg=none    cterm=none
"hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
"hi Structure       ctermfg=none    ctermbg=none    cterm=none
"hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
"hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
"hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
"hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
"hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=0       ctermbg=7       cterm=none
hi PmenuSel        ctermfg=7       ctermbg=21      cterm=bold
hi PmenuSbar       ctermfg=none    ctermbg=7       cterm=none
hi PmenuThumb      ctermfg=8       ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
"hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
"hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
"hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
"hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
