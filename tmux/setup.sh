DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if nvim exists
if [ -d $HOME/.tmux.conf ]; then
    echo "Tmux is not installed!"
    exit 1
fi

# Symlink dotfiles
echo "Symlinking tmux dotfiles..."
ln -sf $DIR/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
ln -sf $DIR/.tmux/plugins/tpm $HOME/.tmux/plugins/tpm
ln -sf $DIR/.tmux/plugins/tmux $HOME/.tmux/plugins/tmux

echo "Loading new dotfiles..."
tmux source-file ~/.tmux.conf
tmux run-shell ~/.tmux/plugins/tpm/bindings/clean_plugins
tmux run-shell ~/.tmux/plugins/tpm/bindings/install_plugins


