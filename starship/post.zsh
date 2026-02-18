eval "$(starship init zsh)"
[[ -L ~/.config/starship.toml ]] || ln -sf ~/.dotfiles/starship/config.toml ~/.config/starship.toml
