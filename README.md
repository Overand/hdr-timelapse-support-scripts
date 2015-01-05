Support Scripts for HDR & Timelapse fun
=============================

### Overview

These are some support scripts I started using in 2009 or earlier, to help ease the process of making time-lapse videos, and time-lapse HDR photos. These scripts are also used to help encode these videos, using ffmpeg and/or mencoder.

### Caveats

These scripts worked for me, and they may work for you, but they were written back when I knew even less than I do now.  They're ugly, the're kludgy, and they're potentiallt dangerous.  Read them carefully before running them!

### Release history

I'm going to start with a very simple upload of the scripts I've been able to track down readily, without comment or improvement.  There will certainly be some missing.

### Requirements

Based on my memory, the following are requirements for my entire stack.  Some workflows don't require all these.  (As of the first real set of commits, none of my `mencoder` or `ffmpeg` stuff seems to be present).

* `bash`
* [Luminance HDR](http://qtpfsgui.sourceforge.net/) (formerly `qtpfsgui`) - GUI toolset for making HDR images (with some CLI options).  `pfstools` below is built-in (I think).
* [pfstools](http://pfstools.sourceforge.net/) - CLI tools for generating & tonemapping HDR images, among other things
* [hugin](http://hugin.sourceforge.net/) - Panorama generating tool, with GUI.  Includes `align_image_stack` which is used in my scripts


