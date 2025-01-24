if status is-interactive
    abbr --add fconfig nvim ~/.config/fish/config.fish
    abbr --add gconfig nvim ~/.config/ghostty/config
    abbr --add nvc nvim ~/.config/nvim/
    abbr --add zconfig nvim ~/.config/zellij/
    abbr --add breakout zellij --layout ~/.config/zellij/config/layout/breakout.kdl
    abbr --add physics zellij --layout ~/.config/zellij/config/layout/physics.kdl
    abbr --add research zellij --layout ~/.config/zellij/config/layout/research.kdl
    abbr --add papers zellij --layout ~/.config/zellij/config/layout/papers.kdl
    # Commands to run in interactive sessions can go here
end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/jaken/miniconda3/bin/conda
    eval /home/jaken/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/jaken/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/jaken/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/jaken/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

/home/jaken/.local/bin/mise activate fish | source
