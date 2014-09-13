" DBGPavim wrapper client: a remote debugger interface to the DBGp protocol
"
" This plugin allows a trigger to source the dbgpavim plugin so the F-keys are
" not used up by debugger commands until you need them.
"
" Use command `LaunchDebugger` to save the current mappings and load the debugger.
" Use command `ExitDebugger` to revert back to your saved mappings.

" Get absolute path to this vimscript
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
 
" Function to launch the PHP debugger environment
function! s:LaunchDebugger()
    " Save current options and mappings to a file so when the debugger
    " environment is exited we can return to those mappings
    mkexrc! ~/.vim/tmp/savemappings.vim

    " Load the debugger vim source with mappings and settings for the debugger
    " environment
    if filereadable(s:path."/../DBGPavim/plugin/dbgpavim.vim")
        execute 'source' s:path . '/../DBGPavim/plugin/dbgpavim.vim'
    elseif filereadable($VIMRUNTIME."/DBGPavim/plugin/dbgpavim.vim")
        source $VIMRUNTIME/DBGPavim/plugin/dbgpavim.vim
    elseif filereadable($HOME."/.vim/DBGPavim/plugin/dbgpavim.vim")
        source $HOME/.vim/DBGPavim/plugin/dbgpavim.vim
    elseif filereadable($HOME."/.vim/bundle/debugger/DBGPavim/plugin/dbgpavim.vim")
        source $HOME/.vim/bundle/debugger/DBGPavim/plugin/dbgpavim.vim
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
