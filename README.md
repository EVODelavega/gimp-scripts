## A simple gimp batch script to resize files

This script allows you to resize images in batch, with or without overwriting the existing images. It's pretty easy to use, but I've included a bash script to make it even easier, still.

### Installation

Just copy this script to your `~/.gimp/scripts` directory. Note that this directory may not exist as such, but rather be called `.gimp-[version-number]`
That's all.

### Usage

The basic command-line usage is as follows:

```
gimp -i -b '(bp-resize "*.png" "thumb_" 100 100)' -b '(gimp-quit 0)'
```

This will resize all png files in the current directory to 100px squares, and save them as `thumb_<original_name>.png`. This works equally well with other images formats. At least: it should (not tested).

### Helper script

The helper bash-script allows for shorter CLI input. The example above (creating thumbnails) would look something like this:

```
./resize-batch "*.png" thumb_ 100
```

Given that I'm far from a bash-scripting king, feel free to improve the script, or write your own


