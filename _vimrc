set nocompatible

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

syn on
set hlsearch

set incsearch


set encoding=utf-8
language messages zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 


"for python begin
set fileencodings=utf-8,gbk  
set ambiwidth=double

set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2

filetype plugin on  
    autocmd FileType python set omnifunc=pythoncomplete#Complete

map <F5> :!python.exe % <CR>
"for python end
