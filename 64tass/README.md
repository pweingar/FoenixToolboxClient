# Foenix Toolbox Client Files for 64TASS

This project contains the files needed to write programs in the 64TASS assembler to use the Foenix Toolbox

## Files in the Project

* `bindings.s`--Contains the labels defining the addresses of the Toolbox functions (_e.g._ `sys_chan_write_b`) as well as definitions of labels that can be used to reference the stack based parameters for those functions (_e.g._ `tb.chan_write_b.b`).
* `types.s`--Contains structure definitions for various complex data types used by Toolbox functions.
* `toolbox.s`--The master include file. It includes the `bindings.s` file and defines the `alloc` and `release` macros that can help with stack setup and cleanup around Toolbox calls.
* `hello.s`--A sample "Hello, world" style program that runs from RAM using a boot override header and prints a simple message on the screen.
* `build.bat`--A Windows batch file to build `hello.bin` from `hello.s`.
* `build.sh`--A Linux/MacOS X batch file to build `hello.bin` from `hello.s`.

## How To Setup Your Environment

1. Download and install the latest version of [64TASS](https://sourceforge.net/projects/tass64/).
1. Make sure 64TASS is in your executable search PATH.
1. [Optional] Download and Install the [FoenixMgr](https://github.com/pweingar/FoenixMgr) and [Python](https://www.python.org/):
	1. Download and install Python 3 (if you want to use the FoenixMgr scripts).
	1. Download the FoenixMgr script from GitHub.
1. [Optional] Download and install the Foenix IDE tool.

## How to Build the Hello World RAM Sample

This sample is a simple "Hello, world" style example program that can be run directly in RAM by downloading over the USB debug port. A similar process can be used to build a binary that can run from a flash cartridge.

1. Assemble the `hello` sample code:
	* [Windows] `build.bat`
	* [Linux or Mac OS] `./build.sh`
1. Upload to the F256 using the uploader tool of choice (FoenixMgr or Foenix IDE).

## How to Upload Using FoenixMgr

1. With your F256 turned off, examine the DIP switched on the bottom, and make sure DIP switch #1 is in the ON position.
1. Connect the F256 to your main computer using a USB C cable.
1. Turn on your F256 and wait for it to complete booting.
1. [Windows] Go into Device Manager and note the COM ports that have appeared. The port to be used by the FoenixMgr (`{port}` below) is the second one that has been added.
1. [Linux] Examine the `/dev` directory for new ttyUSB devices. The exact name and numbering will vary between the distributions, but there should be three new devices, and the second will be the one needed for the command below.
1. Execute the command: `python FoenixMgr.zip --port {port} --binary hello.bin --address 10000`
1. The F256 should reboot, and the "RAM" icon should be highlighted.
1. Wait for the boot screen to enter the RAM program by default, or press `F1` or the spacebar on your F256 keyboard.

## How to Upload Using the Foenix 

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
1. Wait for the boot screen to enter the RAM program by default, or press `F1` or the spacebar on your F256 keyboard.

# Updating the Bindings

If the Toolbox jumptable is updated (moved or functions are added), the `bindings.s` file will need to be updated.
This can be done automatically with the Python script `genbindings.py`.

1. Update the Calypsi bindings first (instructions contained there).
1. Run the command `python genbindings.py {C header path} {C bindings path}`, where `{C header path}` is the path to the `toolbox.h` in the Calpsi include directory, and `{C binding path}` is the path to the `binding.s` file in the Calpsi `lib` folder. For instance: `python genbindings.py ..\calypsi\lib\include\toolbox.h ..\calypsi\lib\bindings.s`.
1. The script will run and report on all functions recognized, and the `bindings.s` file should be updated. Scan through the file to make sure it looks reasonable.

The `genbindings.py` script gets the addresses of the functions from Calypsi's `bindings.s` file, but additional information on parameters, return results, etc. are pulled from the `toolbox.h` file. Regular expression pattern matching is used to find the functions and parameter information from the header file (including parsing the comments), so the 64TASS bindings file might have problems if there are inconsistencies of formatting or naming in the header file.
