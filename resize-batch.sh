#!/usr/bin/env bash
if [[ "$#" -lt "2" ]]; then
    echo "Not enough arguments: saw $#, expects at least 2"
    exit 1
fi
nre='^[0-9]+$'
if [[ $1 =~ $nre ]] ; then
    echo "First argument should not be numeric" >&2; exit 1
fi
pattern=$1
prefix=""
width=0
height=0
case "$#" in
    2)
        if ! [[ $2 =~ $nre ]] ; then
            echo "No resize-size provided!" >&2; exit 1
        fi
        width=$2
        height=$2
        ;;
    3)
        if [[ $2 =~ $nre ]] ; then
            width=$2
            if [[ $3 =~ $nre ]] ; then
                height=$3
            else
                prefix=$3
                height=$2
            fi
        else
            prefix=$2
            if ! [[ $3 =~ $nre ]] ; then
                echo "Error: Invalid arguments, read the README" >&2; exit 1
            fi
            width=$3
            height=$3
        fi
        ;;
    4)
        if [[ $2 =~ $nre ]] ; then
            width=$2
            if [[ $3 =~ $nre ]] ; then
                height=$3
            else
                if ! [[ $4 =~ $nre ]] ; then
                    echo "Not enough numeric arguments" >&2; exit 1
                fi
                height=$4
                prefix=$3
            fi
        else
            prefix=$2
            if ! [[ $3 =~ $nre &&  $4 =~ $nre ]] ; then
                echo "Not enough numeric arguments" >&2; exit 1
            fi
            width=$3
            height=$4
        fi
        ;;
    *)
        echo "Usage $0 pattern [prefix] dimension1 [dimension2]"
        exit 1
esac
if [[ ${#prefix} -gt 0 ]] ; then
    echo "Resinging all $pattern files to $width x $height with prefix $prefix"
else
    echo "Overwriting all $pattern files, resized to $width by $height"
fi
runcmd="gimp -i -b '(bp-resize \""$pattern"\" \""$prefix"\" $width $height)' -b '(gimp-quit 0)'"
eval $runcmd
exit $?
