" DBGp client: a remote debugger interface to the DBGp protocol
 
" Function to launch the PHP debugger environment
function! s:LaunchDebugger()
    " Save current options and mappings to a file so when the debugger
    " environment is exited we can return to those mappings
    mkexrc! ~/.vim/tmp/savemappings.vim

    " Load the debugger vim source with mappings and settings for the debugger
    " environment
    if filereadable($VIMRUNTIME."/dbg_plugin/dbgpavim.vim")
        source $VIMRUNTIME/dbg_plugin/dbgpavim.vim
    elseif filereadable($HOME."/.vim/dbg_plugin/dbgpavim.vim")
        source $HOME/.vim/dbg_plugin/dbgpavim.vim
    elseif filereadable($HOME."/.vim/bundle/debugger/dbg_plugin/dbgpavim.vim")
        source $HOME/.vim/bundle/debugger/dbg_plugin/dbgpavim.vim
    else
        call confirm('launch-debugger.vim: Unable to find dbgpavim.vim.', 'OK')
    endif

    " Map Ctrl-F11 to exit debugger and restore original mappings
    map <C-F11> :ExitDebugger<CR>

    echomsg "Debugger environment enabled. Press F5 to launch."
:endfunction
command! LaunchDebugger call s:LaunchDebugger()

" Function to exit debugger and restore original mappings
function! s:ExitDebugger()
    source ~/.vim/tmp/savemappings.vim

    echomsg "Debugger environment disabled."
:endfunction
command! ExitDebugger call s:ExitDebugger()
