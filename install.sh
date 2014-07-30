#!/usr/bin/env bash
dpat='^\.gimp'
path=$HOME"/.gimp/scripts/"
for FILE in `ls -a $HOME`
do
    if [ -d "$HOME/$FILE" ] ; then
        if [[ $FILE =~ $dpat ]] ; then
            path=$HOME"/$FILE/scripts/"
            break
        fi
    fi
done
echo "Attempting to install in $path..."
cp resizer.scm $path
cp spritegen.scm $path
