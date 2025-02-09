DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if nvim exists
NVIM_VERSION=$(nvim --version) 

NVIM_VERSION_NUM=$(echo $NVIM_VERSION | grep -o 'v[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}')

if [ ${NVIM_VERSION_NUM:1} == "" ]; then
    echo "Nvim is not installed!"
    exit 1
fi

# Symlink dotfiles
echo "Symlinking nvim dotfiles..."

# If the directory already exists, remove it
if [ -d $HOME/.config/nvim ]; then
    rm -rf $HOME/.config/nvim
fi

ln -sf $DIR $HOME/.config


