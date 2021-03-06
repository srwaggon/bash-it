tmux -V >> /dev/null
if [ $? -ne 0 ]; then
  echo Installing tmux...
  sudo apt-get install tmux
  echo Installing tmux... complete.
fi

tmux_config=~/.tmux.conf
if [ ! -e $tmux_config -o ! -h $tmux_config ]; then
  source_file=~/.bash-it/custom/tmux/tmux.conf
  dest_file=~/.tmux.conf
  ln -sf $source_file $dest_file
fi
