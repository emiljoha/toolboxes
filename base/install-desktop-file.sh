desktop-file-validate emacs.desktop
cp emacs.desktop.png $HOME/.local/share/applications/
desktop-file-install --dir=$HOME/.local/share/applications emacs.desktop
update-desktop-database $HOME/.local/share/applications
