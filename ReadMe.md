# instructions

## Package installation 
Follow the quickstart instructions : https://python-for-android.readthedocs.io/en/latest/quickstart/#installation

- $sudo apt-get install -y build-essential ccache git zlib1g-dev python2.7 python2.7-dev libncurses5:i386 libstdc++6:i386 zlib1g:i386 openjdk-8-jdk unzip ant ccache autoconf libtool

## System Info
- System: ubuntu 19.04 64 bit OS
- python3

### Issues faced

- did not find libtinfo.so.5 error
- apt-cache search libtinfo
    libncurses-dev - developer's libraries for ncurses
    libtinfo-dev - transitional package for libncurses-dev
    libtinfo5 - shared low-level terminfo library (legacy version)
    libtinfo6 - shared low-level terminfo library for terminal handling
    libtinfo6-dbg - debugging/profiling library for the low-level terminfo librar
- install the necessary package

### Persistent Issues

- TODO: Permissions needed for the APP is still not recognized.

## Install Android SDK, STUDIO, and NDK

- Android Studio is usefull to install the necessary emulator via Android Virtual Device Manager (AVD)
    - Go to your Android Studio -> Tools -> AVD Manager
        - Create new virtual device and then select the appropriate android device which matches your Makefile build config
        - Note: --arch MUST be set to x86 to test your application (APK) in the emulator

- Export their paths in your ~.bashrc. At the time of writing this readme, the following configurations worked.

    export ANDROIDSDK="$HOME/android-sdk-tools-linux-4333796"
    export ANDROIDNDK="/home/android-ndk-r17c"
    export ANDROIDAPI="26"  # Target API version of your application
    export NDKAPI="21"  # Minimum supported API version of your application

- $ANDROIDSDK/tools/bin/sdkmanager --list
- $ANDROIDSDK/tools/bin/sdkmanager "platforms;android-26"
- $ANDROIDSDK/tools/bin/sdkmanager "build-tools;26.0.3"

### Now build

- $cd /flask-webview-android-p4a
- make sure you have the right path to your FLASKAPP in the Makefile
- $make build

# Debugging information

If your Application is sucessfully built, but you if you want to debug, then use the following easy method:
- $ANDROIDSDK/platform-tools/adb devices
    List of devices attached
    emulator-5554	device
- $ANDROIDSDK/platform-tools/adb
- $ANDROIDSDK/platform-tools/adb logcat | grep python

```
    07-13 23:23:52.345 18333 18392 I python  : AND: Ran string
    07-13 23:23:52.345 18333 18392 I python  : Run user program, change dir and execute entrypoint
    07-13 23:23:52.616 18333 18392 I python  :  * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
    07-13 23:23:52.638 18333 18392 I python  : 127.0.0.1 - - [13/Jul/2019 23:23:52] "GET / HTTP/1.1" 200 -
    07-13 23:23:52.685 18333 18392 I python  : 127.0.0.1 - - [13/Jul/2019 23:23:52] "GET /favicon.ico HTTP/1.1" 404 -
```

## Emulating your App 

- Just drag and drop your APK file into the emulated device.
- Picture attached.

Have fun.

