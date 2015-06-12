This is a bash script to integrate Remmina to the Unity launcher.

## INSTALATION ##

  1. **Create the folders needed** _(just in case their not present)_
```
$ mkdir -p ~/.local/{bin,share/applications}
```
  1. **Download the script & make it executable**
```
$ cd ~/.local/bin
$ wget http://remmina-unity-launcher.googlecode.com/files/remmina-unity.sh
$ chmod u+x remmina-unity.sh
```
  1. **Run it**
```
$ ./remmina-unity.sh
```
  1. If the remmina launcher is Locked to the Unity Bar, unlock it.
  1. Start remmina (`<super>`+"remmina"+`<enter>`) and it's right click menu will have the shiny saved sessions list.
  1. Now you can lock it back, but you'll need to unlock/lock it on every list update (see [issue 1](https://code.google.com/p/remmina-unity-launcher/issues/detail?id=1))

The update option still not works :( but all the others do.
I'm trying to fix it, see [issue 1](https://code.google.com/p/remmina-unity-launcher/issues/detail?id=1).