#!/bin/fish

################################################################
# Enable windows paths and history integration for cd.
#
function cd --wraps cd
    if test -d "$argv"
        builtin cd $argv
    else if echo $argv | grep -Pq '[-]\d*'
        prevd (echo $argv | grep -Po '\d*')
    else
        builtin cd (cygpath -u $argv)
    end
end

set_color blue
echo -n "[devenv] "
set_color normal
echo "You can use 'cd' with windows paths now."

set_color blue
echo -n "[devenv] "
set_color normal
echo "Use 'cd -[n]' to go back to the (n-th) previous directory."


################################################################
# Enable explorer integration for cygwin paths.
#
function explorer 
    if test -e "$argv"
        command explorer (cygpath -w $argv)
    else
        command explorer $argv
    end
end

################################################################
# Enable vscode goto line integration.
#
function code
    command code -g $argv
end
