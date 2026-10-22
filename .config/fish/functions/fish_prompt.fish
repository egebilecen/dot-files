function fish_prompt
    set_color blue
    echo -n (prompt_pwd)
    echo ''
    set_color magenta
    echo -n '>> '
end
