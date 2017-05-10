colorscheme murphy
cmap w!! w !sudo tee >/dev/null %
map <C-c> "+y


execute pathogen#infect()
syntax on

filetype plugin on
filetype plugin indent on

"enable mouse wheel/selection
set mouse=a

augroup filetypedetect   
	au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 
