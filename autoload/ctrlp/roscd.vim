if exists('g:loaded_ctrlp_roscd') && g:loaded_ctrlp_roscd
  finish
endif
let g:loaded_ctrlp_roscd = 1

let s:roscd_var = {
\ 'init': 'ctrlp#roscd#init()',
\ 'exit': 'ctrlp#roscd#exit()',
\ 'accept': 'ctrlp#roscd#accept',
\ 'lname': 'roscd',
\ 'sname': 'roscd',
\ 'type': 'roscd',
\ 'sort': 0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:roscd_var)
else
  let g:ctrlp_ext_vars = [s:roscd_var]
endif

function! ctrlp#roscd#init()
  let cmd = 'rospack list | cut -d " " -f 1'
  let pathes = split(system(cmd),"\n")
  return pathes
endfunc

function! ctrlp#roscd#accept(mode, str)
  call ctrlp#exit()
  exec "Roscd ".a:str
  echo a:str
endfunction

function! ctrlp#roscd#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#roscd#id()
  return s:id
endfunction
