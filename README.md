[![Latest Release](http://tvlinker.ozmartians.com/images/button-latest-release.png)](https://ci.appveyor.com/project/Tydus/vidcutter/build/artifacts)
 

![VidCutter](http://vidcutter.ozmartians.com/vidcutter-banner.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://vidcutter.software.informer.com/" target="_blank"><img border="0" src="http://img.informer.com/awards/si-award-clean.png" alt="Software Informer Virus Free award" height="120" width="120" /></a>

<!---[![Build Status](https://travis-ci.org/ozmartian/vidcutter.svg)](https://travis-ci.org/ozmartian/vidcutter)--->
[![Build Status](https://ci.appveyor.com/api/projects/status/p4ralebu096lkft1?svg=true)](https://ci.appveyor.com/project/Tydus/vidcutter)
<!---[![Codacy Badge](https://api.codacy.com/project/badge/Grade/425a00c7c6af446ba87c6152567d9f7e)](https://www.codacy.com/app/ozmartian/vidcutter)--->

# Special HD Version
For making "gif" animations for Twitter, Telegram, etc.

### Windows Users

Native installers for Windows is available on the <a href="https://ci.appveyor.com/project/Tydus/vidcutter/build/artifacts">Appveyor</a>.

### Linux Users

If you're familiar with Python and PyPi then you can always try that option too but avoid installing PyQt5 from through pip and instead run with your distributions own PyQt5 offering. PyQt5 is known as some of the following names under various distros: python-pyqt5, python3-pyqt5, python3-qt5 etc. Using your distro's version ensures a more seamless look & feel with the app integrating with your distro's look & feel + widget sets. Installing all via PyPi will still work, but won't look as nice..

If installing via PyPi, be aware to also ensure you have the following tools also installed via your package manager or any other means it doesn't matter so long as they are installed:

    - libmpv (Arch: mpv, Ubuntu: libmpv1, Fedora: mpv-libs via RPMFusion, openSUSE: libmpv1)
    - FFmpeg (ffmpeg in all places, if on older Linux then you may have libav-tools instead which will also work)
    - mediainfo (mediainfo in all/most places. mainly needs to be the CLI version)

Fedora and RedHat users need to enable the RPMFusion repository in order to access mpv packages and just about anything multimedia-wise. Chances are you know what I'm talking about here but if not here are some simple steps to get VidCutter working in Fedora 25, the same should apply for any other RPM based distro... until I get off my lazy butt and try to learn RPM packaging (oh how horrible it looks though).... if anyone wants to help in this area by all means do!

***

## Fedora Installation Walkthrough

NOTE: a Fedora25 RPM package is now included in release builds so use that. The following remains for reference or troubleshooting.

1. Enable RPMFusion Free repository on your system if not already added. Follow the instructions here for your distro/version

    https://rpmfusion.org/Configuration
    
2. Run 'dnf update' to ensure your system is all up to date.  

3. Install the following packages, PyQt5 is from Fedora base repo and the rest should all come from RPMFusion (Fedora doesn't allow mpv/ffmpeg in their repos due to the free as in beer philosophy. if you dont know what i am talking about, head to www.fsf.org to read up on this stuff if interested)

4. Package list is:

    - python3-qt5
    - mpv-libs
    - ffmpeg
    - mediainfo
    - python3-setuptools

5. Download VidCutter3 source code to temp folder location and install via python setuptools as follows:
    ```
    $ wget https://github.com/Tydus/vidcutter/archive/master.tar.gz
    
    $ tar zxf master.tar.gz
    
    $ rm master.tar.gz
    
    $ cd vidcutter-master
    
    $ sed -i "s/pypi/rpm/" "vidcutter/__init__.py"
    
    $ sudo python3 setup.py install
    ```
6. That's all folks!

***

## Command-line for debugging (Linux/macOS only)
  ```
  $ vidcutter --help

Usage: vidcutter [options] [video] [project]

VidCutter - the simplest + fastest video cutter & joiner

Options:
  --debug        debug mode; verbose console output & logging. This will
                 basically output what is being logged to file to the console
                 stdout. Mainly useful for debugging problems with your system
                 video and/or audio stack and codec configuration.
  --dev          developer mode; disables the use of compiled resource files so
                 that all app resources & assets are accessed directly from the
                 file system allowing you to see UI changes immediately. this
                 typically relates to changes made to Qt stylesheets (.qss),
                 layout/templates, content includes and images. basically all
                 assets defined in .qrc files throughout the codebase.
  -v, --version  Displays version information.
  -h, --help     Displays this help.

Arguments:
  video          Preload video file
  project        Open VidCutter project file (.vcp)
  ```
