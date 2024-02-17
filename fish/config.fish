set fish_greeting ""

set -gx TERM xterm-256color

fish_config theme choose "Catppuccin Macchiato"

alias g git
alias ls lsd
alias ll 'ls -hal'
alias lt 'ls --tree'
alias python /usr/local/bin/python3


command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx KUBE_EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
# NodeJS
set -gx PATH node_modules/.bin $PATH

# Remove underline a path
set fish_color_valid_path

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-win.fish
end

starship init fish | source

# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end
