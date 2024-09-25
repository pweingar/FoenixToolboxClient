# Foenix Toolbox Client Files for Calypsi

This project contains a small library and associated header files that can be used to build Foenix Toolbox programs under Calypsi. It also contains a simple "Hello, world" style sample program.

## Files in the Project

* `lib/include/toolbox.h` -- The main include file for connecting to the Toolbox functions
* `lib/include/sys_types.h` -- The include file defining the various types used by Toolbox functions
* `lib/include/constants.h` -- Various useful constants for the Toolbox
* `lib/include/errors.h` -- Error codes returned by Toolbox functions
* `lib/bindings.s` -- Assembly file defining the locations of the function (used to build the library file)
* `lib/stubs.c` -- Various Calypsi I/O stubs needed to connect the Toolbox to the standard C library (used to build the library file)
* `hello/f256-plain.scm` -- Simple Calypsi linker script for the example
* `hello/header.s` -- Assembly code to build the boot-override header so the program can run from RAM
* `hello/hello.c` -- The hello world example program

## How To Setup Your Environment

To build this library and example, you will need to download and install:
1. The [Calypsi C compiler for 65816](https://www.calypsi.cc/).
1. A suitable implementation of the `make` utility for your operating system. Linux and Mac OS X should already have one installed.

## How to Build the Hello World RAM Sample

1. Open a command line tool and enter the `lib` directory.
1. Enter the command `make`. Calypsi should run and build the `toolbox.a` library file.
1. Go to the `hello` directory.
1. Enter the command `make`. Calypsi should run and build the `hello.bin` file (linking the `toolbox.a` file)

## How to Upload Using FoenixMgr

1. With your F256 turned off, examine the DIP switched on the bottom, and make sure DIP switch #1 is in the ON position.
1. Connect the F256 to your main computer using a USB C cable.
1. Turn on your F256 and wait for it to complete booting.
1. [Windows] Go into Device Manager and note the COM ports that have appeared. The port to be used by the FoenixMgr (`{port}` below) is the second one that has been added.
1. [Linux] Examine the `/dev` directory for new ttyUSB devices. The exact name and numbering will vary between the distributions, but there should be three new devices, and the second will be the one needed for the command below.
1. Execute the command: `python FoenixMgr.zip --port {port} --binary hello.bin --address 10000`
1. The F256 should reboot, and the "RAM" icon should be highlighted.
1. Wait for the boot screen to enter the RAM program by default, or press `F1` or the spacebar on your F256 keyboard.

## How to Upload Using the Foenix IDE

NOTE: the Foenix IDE was compiled to run under .Net on Windows. It can be run under Linux using Wine. This document will not cover how to do that.

1. With your F256 turned off, examine the DIP switched on the bottom, and make sure DIP switch #1 is in the ON position.
1. Connect the F256 to your main computer using a USB C cable.
1. Turn on your F256 and wait for it to complete booting.
1. [Windows] Go into Device Manager and note the COM ports that have appeared. The port to be used by the FoenixMgr (`{port}` below) is the second one that has been added.
1. Open the Foenix IDE application.
1. Select the "Tools > Uploader" option. An "Uploader" dialog window will open.
1. Select your COM port in the drop down list.
1. Click "Connect".
1. Click the "Send File" radio button.
1. Click the button labelled "...".
1. Select the `hello.bin` file.
1. Enter "01:0000" in the "C256 Dest Address" text box.
1. Click the "Send Binary" button.
1. The F256 should reboot, and the "RAM" icon should be highlighted.