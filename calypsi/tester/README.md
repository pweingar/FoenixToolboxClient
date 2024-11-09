# Tester -- A Program to test various features of the Foenix Toolbox
This project can do double duty. First, it allows the user to test out Toolbox functions.
Second, it can serve as a tutorial on how to call the various functions.
Overall, it's essentially a stripped down command line shell, but it is not a full-featured shell
and will not restart when a program that it has started exits.

## Commands

* bye -- Forces a reboot of the system
* del <path> -- Delete the file at path
* dir <path> -- Print a listing of the contents of the directory at path
* dump <start> <count> -- Display the contents of memory to the screen 
* more <path> -- Paginate and display the text file at path
* ren <old_path> <new_path> -- Rename the file at old_path to new_path
* run <file> -- Attempt to run a PGX or PGZ file (does not handle arguments)
* set-border-size <n> -- Set the horizontal and vertical border size to n
* set-border-color <r> <g> <b> -- Set the color of the border, given RGB values

