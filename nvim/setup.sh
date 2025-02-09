DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if nvim exists
if [ -d $HOME/.config/nvim ]; then
    echo "Nvim is not installed!"
    exit 1
fi

# Symlink dotfiles
echo "Symlinking nvim dotfiles..."
ln -sf $DIR/nvim $HOME/.config/nvim


