"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"		Tim Jansen
"
" Version:
" 		1.0 - 21/06/15 21:50:00
"
" Sections:
" 		-> General
" 		-> VIM user interface
" 		-> Colors and fonts
" 		-> Text, tab, and indents
" 		-> Status bar
" 		-> Spelling
" 		-> Misc
" 		-> Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Re-read a file if it's been edited outside of vim
set autoread

" Number of lines of history VIM remembers
set history=700

" No vi compatibility
set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'""""""""
" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show line numbers
set number

" Numbers take up 4 columns
set numberwidth=4

" Configure backspace
set backspace=2

" Highlight found terms
set hlsearch

" Ignore case when searching
set ignorecase

" When searching be smart about cases
set smartcase

" Makes search act like modern browers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
	colorscheme desert
endif

highlight Cursor ctermbg=NONE ctermfg=NONE cterm=reverse
highlight icursor ctermbg=NONE ctermfg=NONE cterm=reverse
highlight Search ctermbg=blue ctermfg=white
highlight Pmenu ctermbg=white ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=white cterm=bold
highlight PmenuSbar ctermbg=white
highlight Modemsg cterm=NONE
highlight Visual ctermbg=blue ctermfg=white cterm=NONE
highlight Folded ctermbg=black ctermfg=white
highlight MatchParen ctermfg=NONE ctermbg=blue
highlight LineNr ctermfg=gray
highlight NonText ctermfg=gray

" Set uft8 as standard encoding
set encoding=utf8

" Prefer Unix file endings to Windows
set fileformats=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs are four spaces wide
set tabstop=4
set shiftwidth=4

" Do not use spaces instead of tabs
set noexpandtab

" Smart tab
set smarttab

" Auto indent
set autoindent

" Smart indent
set smartindent

" File type detection
filetype plugin indent on
set grepprg=grep\ -nH\ $*

" No text wrapping
set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show current command
set showcmd

" Show line and column
set ruler

" Always display the file name at the bottom
set modeline
set ls=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language
set spl=en spell

" Disable spell checker
set nospell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the buffer when a tab is closed
set nohidden

" Split down or to the right
set splitright
set splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleSpell()
	set spell!
	if &spell
		echo "Spell check enabled"
	else
		echo "Spell check disabled"
	endif
endfunction

" Resize the screen with movement keys
noremap <C-j> :set lines+=1<CR>:echo &lines<CR>
noremap <C-k> :set lines-=1<CR>:echo &lines<CR>
noremap <C-l> :set columns+=1<CR>:echo &columns<CR>
noremap <C-h> :set columns-=1<CR>:echo &columns<CR>
