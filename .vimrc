filetype plugin indent on
syntax on
set hlsearch
au BufRead,BufNewFile *.json set filetype=json
set background=dark
" Fix vimdiff colors
"highlight DiffAdd cterm=none ctermfg=Black ctermbg=Green gui=none guifg=Black guibg=Green
"highlight DiffDelete cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
"highlight DiffChange cterm=none ctermfg=Black ctermbg=Yellow gui=none guifg=Black guibg=Yellow
"highlight DiffText cterm=none ctermfg=Black ctermbg=Magenta gui=none guifg=Black guibg=Magenta
