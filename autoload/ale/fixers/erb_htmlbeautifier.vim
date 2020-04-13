" Author: Bryan Tomlin - https://github.com/bdtomlin
" Description: Fix Erb files with htmlbeautify gem.

call ale#Set('erb_htmlbeautifier_executable', 'htmlbeautifier')
call ale#Set('erb_htmlbeautifier_options', '')

function! ale#fixers#erb_htmlbeautifier#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'erb_htmlbeautifier_executable')
    let l:options = ale#Var(a:buffer, 'erb_htmlbeautifier_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . (empty(l:options) ? '' : ' ' . l:options)
    \}
endfunction
