" Author: Bryan Tomlin - https://github.com/bdtomlin
" Description: Fix Erb files with htmlbeautify gem.

call ale#Set('erb_htmlbeautifier_executable', 'htmlbeautifier')
call ale#Set('erb_htmlbeautifier_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('erb_htmlbeautifier_options', '')
call ale#Set('erb_htmlbeautifier_change_directory', 1)

          ale#fixers#erb_htmlbeautifier#Fix
function! ale#fixers#erb_htmlbeautifier#Fix(buffer) abort
    let l:executable = ale#ruby#FindExecutable(
    \   a:buffer,
    \   'erb_htmlbeautifier',
    \   ['htmlbeautifier']
    \)

    let l:options = ale#Var(a:buffer, 'erb_htmlbeautifier_options')

    return {
    \   'command': ale#Escape(l:executable). ' ' . l:options . ' -',
    \}
endfunction
