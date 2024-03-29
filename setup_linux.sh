SOURCE_TMUX_CONF_PATH=$PWD/tmux/tmux.conf
SOURCE_TMUX_THEME_PATH=$PWD/tmux/tmux-theme
SOURCE_NVIM_CONF_PATH=$PWD/nvim/
SOURCE_ZSHRC_PATH=$PWD/linux/zshrc
#SOURCE_BIN_PATH=$PWD/osx/bin/

DEST_TMUX_CONF_PATH=$HOME/.tmux.conf
DEST_TMUX_THEME_PATH=$HOME/.tmux-theme
DEST_NVIM_CONF_PATH=$HOME/.config/nvim
DEST_ZSHRC_PATH=$HOME/.zshrc
#DEST_BIN_PATH=$HOME/bin

# REMOVE OLD PATHS
rm $DEST_TMUX_CONF_PATH
rm $DEST_TMUX_THEME_PATH
rm -r $DEST_NVIM_CONF_PATH
rm $DEST_ZSHRC_PATH
#rm -r $DEST_BIN_PATH

# ADD NEW PATHS
ln -s $SOURCE_TMUX_CONF_PATH $DEST_TMUX_CONF_PATH
ln -s $SOURCE_TMUX_THEME_PATH $DEST_TMUX_THEME_PATH
ln -s $SOURCE_NVIM_CONF_PATH $DEST_NVIM_CONF_PATH
ln -s $SOURCE_ZSHRC_PATH $DEST_ZSHRC_PATH
#ln -s $SOURCE_BIN_PATH $DEST_BIN_PATH

echo "DONE!"
