DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if nvim exists
if ! command -v tmux &> /dev/null; then
    echo "Tmux is not installed!"
    exit 1
fi

# Symlink dotfiles
echo "Symlinking tmux dotfiles..."
ln -sf $DIR/.tmux.conf $HOME/.tmux.conf
rm -rf $HOME/.tmux/plugins/tpm
rm -rf $HOME/.tmux/plugins/tmux
mkdir -p $HOME/.tmux/plugins

# For TPM
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
chmod +x $HOME/.tmux/plugins/tpm/tpm

# For Catppuccin
git clone https://github.com/catppuccin/tmux $HOME/.tmux/plugins/tmux

echo "Loading new dotfiles..."

# Before running tmux commands
if ! tmux has-session 2>/dev/null; then
  tmux new-session -d
fi
tmux source-file ~/.tmux.conf
tmux run-shell ~/.tmux/plugins/tpm/bindings/clean_plugins
tmux run-shell ~/.tmux/plugins/tpm/bindings/install_plugins


