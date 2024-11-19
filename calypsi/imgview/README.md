# IMGVIEW -- Slideshow to display raw image files
This example illustrates how to use the Toolbox to read files off the SD card, load data into the graphics color lookup tables and into RAM, and change the display mode. The example also uses some of Calypsi's F256 board support to manage some of the I/O registers that the Toolbox does not use.

## Building

<pre>
make imgview.s37
</pre>

## Running

1. Copy the `*.raw` and `*.pal` files from the `rsrc` directory to the root directory of your SD card.
1. Make sure DIP switch #1 is on to enable running code downloaded directly into RAM
1. Use the FoenixMgr to upload the S37 file into RAM.
1. After the F256 reboots, press SPACE or F1 to start the code in RAM (or just wait)

While running, the program should load and display an image for 30 seconds and then load the next image. Note that currently the example is limited to the three included images which are all at 320x200 resolution.
