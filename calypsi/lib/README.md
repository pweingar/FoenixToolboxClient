# Calypsi Library
This directory contains a sample client library for Calypsi programs to access the Foenix Toolbox.
The library consists of three pieces: include files under `include`, Calypsi I/O stubs in `stubs.c`, and a small Calypsi 65816 assembly file to define the entry points to all the Toolbox functions in `bindings.s`.
The makefile generates a `toolbox.a` archive which contains the library built for large code and large data models, although the archive could be generated for any of the code and data models.
If a program does not need to use the C library and just wants access to the Toolbox functions, it can use the `bindings.s` or `bindings.o` files directly.

# Build

```
make toolbox.a
```

# Updating the Bindings

If the Toolbox jumptable has changed (moved or has functions added), it is necessary to update the `bindings.s` file.
This can be done automatically with the Python script `genbindings.py`.
In the Toolbox project itself, the `addresses.csv` file for the F256 bindings should have been updated.
Copy that file to this directory and then issue the command:

```
python genbindings.py
```

The `bindings.s` file should be updated with the new functions.
The library can then be built using the Makefile.
