# Introduction

This fork is mainly aimed at those who want to embed wfreerdp.exe into a Winform or Formhost.
While wfreerdp.exe already supports re-parenting itself, it loses the ability to peform dynamic-resolution. Other available solutions solve this by disconnecting and reconnecting with the new parent size but that can lead to race issues where the reconnect happens too quickly and Windows complains of an existing terminal connection.

Dynamic resolution for freerdp depends on top level WM_SIZE messages. Those are no longer received when re-parented. This fork solves that issue by implementing some customer WM_USER messages that the parent and child windows can use to communicate.

# Build scripts for windows

This attempts to follow the common portion of the compilation guide: [FreeRDP wiki compilation](https://github.com/FreeRDP/FreeRDP/wiki/Compilation#compilation)
Please start there to get your window build environment set up correctly.

Note: 
- All builds should install to libs subfolder
- SDL, libusb, ffmpeg, openh264 are currently disabled in the build config for freerdp (see freerdp.cmd)
- To get the build process started, run `depsetup.cmd`