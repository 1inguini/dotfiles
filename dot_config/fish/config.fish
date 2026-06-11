if status is-interactive
    # Commands to run in interactive sessions can go here
    alias sudo='run0'
    alias hx='helix'
    export EDITOR=helix
    alias ls='eza --time-style=long-iso -g -T -L1'
    alias rm='echo use trash instead'
    alias gm='trash'
    alias cpr='rsync --archive --acls --xattrs -hh --partial --info=stats1,progress2 --modify-window=1 --no-inc-recursive'
    alias mvr='rsync --archive --acls --xattrs -hh --partial --info=stats1,progress2 --modify-window=1 --no-inc-recursive --remove-source-files'

    alias pd='pushd'
    alias tmpd='pushd $(mktemp -d)'

    bind alt-right 'commandline -f forward-bigword'
    bind \e\[1\;9C 'commandline -f forward-bigword'
    bind alt-left 'commandline -f backward-word'
    bind \e\[1\;9D 'commandline -f backward-word'
    bind alt-backspace 'commandline -f backward-kill-word'
    bind ctrl-alt-h 'commandline -f backward-kill-word'
    bind alt-delete 'commandline -f kill-word'
end
