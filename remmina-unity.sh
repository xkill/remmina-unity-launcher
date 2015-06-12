#!/bin/bash
# Bash Script to integrate Remmina into Unity Launch bar.
# Creator: Daniel Scholtus
# Version: 2
# Date:    March 23, 2011

if [ -e ~/.local/share/applications/remmina.desktop ]
then
    echo "Deleting old Launcher"
    rm ~/.local/share/applications/remmina.desktop
fi

echo "Creating Base Launcher"
cp /usr/share/applications/remmina.desktop ~/.local/share/applications/remmina.desktop

echo "Adding shortcuts items declaration"
echo "" >> ~/.local/share/applications/remmina.desktop

AYATANA="X-Ayatana-Desktop-Shortcuts="

FILES=("`ls ~/.remmina/*.remmina`")
for f in ${FILES}
do
    FILE=`basename $f .remmina`
    AYATANA=$AYATANA$FILE";"
done

AYATANA=$AYATANA"Settings;Update;Restart"

echo $AYATANA >> ~/.local/share/applications/remmina.desktop
echo "" >> ~/.local/share/applications/remmina.desktop

echo "Adding shortcuts items descriptions"
echo "" >> ~/.local/share/applications/remmina.desktop

echo " - Settings"
echo "[Settings Shortcut Group]" >> ~/.local/share/applications/remmina.desktop
echo "Name=Settings" >> ~/.local/share/applications/remmina.desktop
echo "Exec=remmina" >> ~/.local/share/applications/remmina.desktop
echo "TargetEnvironment=Unity" >> ~/.local/share/applications/remmina.desktop
 
echo " - Update"
echo "[Update Shortcut Group]" >> ~/.local/share/applications/remmina.desktop
echo "Name=Update List (needs to re-lock to the panel)" >> ~/.local/share/applications/remmina.desktop
echo "Exec=bash ~/.local/bin/remmina-unity.sh" >> ~/.local/share/applications/remmina.desktop
echo "TargetEnvironment=Unity" >> ~/.local/share/applications/remmina.desktop
 
echo " - Restart"
echo "" >> ~/.local/share/applications/remmina.desktop
echo "[Restart Shortcut Group]" >> ~/.local/share/applications/remmina.desktop
echo "Name=Update List and restart Unity" >> ~/.local/share/applications/remmina.desktop
echo "Exec=bash ~/.local/bin/remmina-unity.sh & setsid unity --replace" >> ~/.local/share/applications/remmina.desktop
echo "TargetEnvironment=Unity" >> ~/.local/share/applications/remmina.desktop

for f in ${FILES}
do
    NAME=`cat $f | grep -m 1 ^name= | cut -d= -f2`

    echo " - "$NAME
    echo "" >> ~/.local/share/applications/remmina.desktop
    echo "[`basename $f .remmina` Shortcut Group]" >> ~/.local/share/applications/remmina.desktop
    echo "Name=$NAME" >> ~/.local/share/applications/remmina.desktop
    echo "Exec=remmina -c $f" >> ~/.local/share/applications/remmina.desktop
    echo "TargetEnvironment=Unity" >> ~/.local/share/applications/remmina.desktop
done



