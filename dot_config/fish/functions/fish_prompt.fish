function fish_prompt --description 'Write out the prompt'
    echo ""

    # Host
    set_color $fish_color_user
    echo -n (prompt_hostname)
    set_color normal

    __terlar_git_prompt
    __fish_hg_prompt

    set_color brwhite
    echo -n "("
    echo -n $DTACH_SESSION
    echo -n ")"

    set_color normal

    echo ""

    set -l last_status $status

    function ipaddr
ip address | grep "inet" | grep -v "inet6" | tail -n +2 | awk '{print $2}'
    end

    echo -n (ipaddr)

    echo ""

    # User
    set_color $fish_color_host
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # PWD
    set_color $fish_color_cwd
    echo -n (pwd)
    echo -n ':'
    set_color normal

    echo

    if not test $last_status -eq 0
set_color $fish_color_error
    end

    # Main
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '

    set_color normal

    echo ""

end

function fish_right_prompt
    date
end
