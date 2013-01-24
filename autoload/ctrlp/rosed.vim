if exists('g:loaded_ctrlp_rosed') && g:loaded_ctrlp_rosed
  finish
endif
let g:loaded_ctrlp_rosed = 1

let s:rosed_var = {
\ 'init': 'ctrlp#rosed#init()',
\ 'exit': 'ctrlp#rosed#exit()',
\ 'accept': 'ctrlp#rosed#accept',
\ 'lname': 'rosed',
\ 'sname': 'rosed',
\ 'type': 'rosed',
\ 'sort': 0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:rosed_var)
else
  let g:ctrlp_ext_vars = [s:rosed_var]
endif

function! ctrlp#rosed#init()
  let cmd = 'rospack list | cut -d " " -f 1'
  let rospacks = split(system(cmd),"\n")
  return rospacks
endfunc

function! ctrlp#rosed#accept(mode, str)
  call ctrlp#exit()
  exec "Rosed ".a:str
endfunction

function! ctrlp#rosed#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#rosed#id()
  return s:id
endfunction
