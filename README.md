# DBGPavim Wrapper Client

This is a wrapper to the DBGPavim for vim: a remote debugger interface to the
DBGp protocol.

This plugin provides a trigger to source the dbgpavim plugin so the F-keys are
not used up by debugger commands until you need the debugger.

This uses the latest DBGPavim plugin available here: https://github.com/brookhong/DBGPavim

## Installation

This plugin is pathogen ready, simply place into your `.vim/bundle` directory.

## Usage

- Use command `LaunchDebugger` to save the current mappings and load the debugger.
- Use command `ExitDebugger` to revert back to your saved mappings.

The above commands are mapped to `Ctrl-F11`.

Once the debugger environment is launched, use the commands and function keys
as described in DBGPavim help text:

### In normal mode

```
<F5>  => start debugger backend
<F6>  => stop debugger backend
<F8>  => toggle dbgPavimBreakAtEntry, when g:dbgPavimBreakAtEntry=0,
         debugger backend breaks only at breakpoints.
<F10> => toggle breakpoint at current line

:Bl        => to list all breakpoints
:Bp [expr] => toggle breakpoint on current line, if expr is provided, that is
              conditional breakpoint, for example, `:Bp ($i > 3)` only breaks when $i is
              larger than 3.
:Dp [args] => to debug current file from CLI, it will run 
              'php-dxdebug.remote_autostart=1 -dxdebug.remote_port=<your_port>
              <current_file_in_vim> [args]'

:Wc [$foo] => to toggle watch on variable $foo, if no parameter is provided, it
              will toggle watch on CONTEXT.
:We [foo]  => to eval expression `foo` automatically after each step.
:Wl        => to list all watched variables. By default, you can get output
              like *CONTEXT*, which means context are automatically populated each step in
              WATCH WINDOW.
```

### In debugging mode

```
<F1>  => toggle help window
<F2>  => step into
<F3>  => step over
<F4>  => step out
<F5>  => start debugging / run
<F6>  => stop debugging
<F7>  => evalute expression and display result. cursor is automatically move to watch window. type line and just press `Enter`.
<F9>  => toggle layout
<F11> => shows all variables
<F12> => shows variable on current cursor
```
