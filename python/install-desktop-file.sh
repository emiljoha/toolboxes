desktop-file-validate python.desktop
cp python-logo.svg $HOME/.local/share/applications/
desktop-file-install --dir=$HOME/.local/share/applications python.desktop
update-desktop-database $HOME/.local/share/applications
