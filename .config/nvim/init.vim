set nu
set t_ut=
set t_Co=256
set mouse=""
set termguicolors
set background=dark
"let &colorcolumn=join(range(100,999),",")
"colorscheme flatlandia
"colorscheme base16-ocean
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16

"let g:solarized_termtrans = 1                                                   
"let g:solarized_termcolors = 256

colorscheme base16-twilight

"let base16colorspace=256

"set encoding=utf-8
"hi ColorColumn guibg=#26292c
"hi Braces guibg=white
"highlight MatchParen cterm=bold ctermfg=cyan ctermbg=black
let loaded_matchparen = 1
"let g:loaded_matchparen=1
"let s:paren_hl_on = 0

"autocmd VimEnter * hi Normal guibg=#2d3033
"autocmd VimEnter * hi NonText guibg=#26292c

set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'flatlandia'
"let g:airline_theme = 'base16_grayscale'
let g:airline_theme = 'base16_twilight'
"let g:airline_theme = 'gruvbox'

let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 50
let g:netrw_preview = 1
let g:netrw_banner = 0
let g:netrw_altv = 1
set splitright
set autochdir

fun! Sidebar()
	if exists("t:lex_opened") && (t:lex_opened)
		execute "Lexplore"
		let t:lex_opened = 0
	else
		execute "Lexplore " . getcwd() 
	       	execute "vertical resize 25"
		let t:lex_opened = 1
		set winfixwidth
		set winfixheight
	endif

	execute "winc ="
endf

fun! SizeEvenly()
	if exists("t:lex_opened") && (t:lex_opened)
		execute "winc ="
	endif
endf

augroup NetrwGroup
      autocmd! BufEnter * execute SizeEvenly()
augroup END

map <C-c> :call Sidebar()<cr>
vnoremap . :normal . <cr>
tnoremap <Esc> <C-\><C-n>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

set fillchars+=vert:\ 

filetype plugin indent on
