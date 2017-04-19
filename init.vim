
" Set plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gnuplot.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'FredKSchott/CoVim'

Plug '~/.config/nvim/lambda_11235'

" Language support
Plug 'derekelkins/agda-vim'
Plug 'hura/vim-asymptote'
Plug 'idris-hackers/idris-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'derekwyatt/vim-scala'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'

Plug 'fsharp/vim-fsharp', {'for': 'fsharp', 'do': 'make fsautocomplete'}

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
call plug#end()


filetype indent plugin on

" Does auto-indent without moving cursor
function AutoIndent()
    let l:position = getpos(".")
    normal ==
    call setpos(".", l:position)
endfunction

" Enable 256 colors
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

" Set color scheme
try
  colorscheme Dark
catch
  echo "Bad colorscheme: Dark"
  colorscheme delek
endtry

" Spell check latex files
autocmd BufNewFile,BufRead,FileType *.tex :set spell

" Automatically indent
set autoindent

" Make backspace work correctly
set bs=2

" Mark and break at column 80
set colorcolumn=80
set formatoptions=cjq
set textwidth=80

" Set default dictionary
set dictionary=/usr/share/dict/american-english

" Use spaces not tabs
set expandtab

" Set up folding
set foldmethod=syntax
set foldlevelstart=5

" Enable modelines
set modeline

" Turn on line numbering
set number

" Always show at several lines after and before the cursor
set scrolloff=5

" Disable startup message
set shortmess+=I

" Set tab stops to be 2 spaces apart
set shiftwidth=2
set tabstop=2

" Show commands as they are being typed
set showcmd

" Disable spell checking
set nospell spelllang=en_us
" Enable for Tex or LaTeX
autocmd FileType tex :set spell spelllang=en_us

" Turn Syntax coloring on
syntax on

" Allow virtual editing in visual block mode
set virtualedit=block

""""""""""""""""""""""""""""""""""""""""
" Key Bindings and Commands
""""""""""""""""""""""""""""""""""""""""

" Save all files
map <Leader><Leader> :wa<CR>

" Save all files and make
map <Leader>m :wa \| make<CR>

" Save all files and quit
map <Leader>q :wqa<CR>

" Open a file in a new tab
map <Leader>te :tabe<Space>

" Open all buffers in tabs
map <Leader>ta :tab ball<CR>

" Add a newline below/above the current one
map <Leader>n o<Esc>
map <Leader>N O<Esc>


""""""""""""""""""""""""""""""""""""""""
" Ultisnippet Setup
""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips", "ultisnippets"]


""""""""""""""""""""""""""""""""""""""""
" easy-align
""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""
" vimtex
""""""""""""""""""""""""""""""""""""""""
let g:vimtex_latexmk_options = "-pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode -lualatex"
let g:vimtex_view_general_viewer = 'zathura'

call vimtex#imaps#add_map({'lhs' : '/', 'rhs' : '\frac', 'wrapper' : 'vimtex#imaps#wrap_math'})

""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = "distinguished"
let g:airline_powerline_fonts = 0
