#!/usr/bin/env bash
set -x
NAME=$1
echo "[Desktop Entry]" >> $NAME.desktop
echo "Name="$NAME >> $NAME.desktop
echo "Exec=/usr/bin/toolbox --container "$NAME" run emacs --load /var/local/init.el" >> $NAME.desktop
echo "Icon="$HOME"/.local/share/applications/"$NAME".png" >> $NAME.desktop
echo "Type=Application" >> $NAME.desktop
echo "Categories=Development;" >> $NAME.desktop

desktop-file-validate $NAME.desktop
cp $NAME/$NAME.png $HOME/.local/share/applications/
desktop-file-install --dir=$HOME/.local/share/applications $NAME.desktop
update-desktop-database $HOME/.local/share/applications
rm $NAME.desktop
