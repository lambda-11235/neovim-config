" Vim color file
" Maintainer:	Taran Lynn

highlight clear Normal
set background=light

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "Light"

" Default color definitions
" The format for color definitions should ideally be:
" highlight group termfg ctermfg guifg termbg ctermbg guibg term cterm gui
highlight Normal      ctermfg=Black   guifg=Black   ctermbg=White guibg=White

highlight ColorColumn ctermbg=Red     guibg=Red
highlight Comment     ctermfg=Green   guifg=Green   gui=italic
highlight Constant    ctermfg=Red     guifg=Red     term=bold     cterm=bold   gui=bold
highlight Error       ctermfg=White   guifg=White   ctermbg=Red   guibg=Red
highlight Special     ctermfg=Magenta guifg=Magenta
highlight SpellBad    ctermfg=Black   guifg=Black   ctermbg=Red   guibg=Red
highlight Statement   ctermfg=Blue    guifg=Blue    term=bold     cterm=bold   gui=bold
highlight Todo        ctermfg=Red     guifg=Red     ctermbg=Black guibg=Black
highlight Type        ctermfg=Cyan    guifg=Cyan
highlight Visual      term=inverse    cterm=inverse gui=inverse

" Special links
highlight link Boolean        Constant
highlight link Character      Constant
highlight link Number         Constant
highlight link String         Constant
highlight link Function       Identifier
highlight link Float          Number
highlight link Define         PreProc
highlight link Include        PreProc
highlight link Macro          PreProc
highlight link PreCondit      PreProc
highlight link Debug          Special
highlight link Delimiter      Special
highlight link SpecialChar    Special
highlight link SpecialComment Special
highlight link Tag            Special
highlight link Conditional    Statement
highlight link Exception      Statement
highlight link Keyword        Statement
highlight link Label          Statement
highlight link Operator       Statement
highlight link Repeat         Statement
highlight link StorageClass   Type
highlight link Structure      Type
highlight link Typedef        Type

