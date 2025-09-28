# Calypsi Library
This directory contains a sample client library for Calypsi programs to access the Foenix Toolbox.
The library consists of three pieces: include files under `include`, Calypsi I/O stubs in `stubs.c`, and a small Calypsi 65816 assembly file to define the entry points to all the Toolbox functions in `bindings.s`.

# Building the Library Files

A `build.py` Python script is present to build all the libraries for the different combinations of supported architecture, code model, and data model. The files produced will have names of the format:

<pre>
tb_{arch}_{code model}_{data model}.a
</pre>

where `{arch}` is the name of the CPU architecture (_e.g._ 65816, 68k), `{code model}` is the code model specifier (_e.g._ `sc` for small code, `lc` for large code), and `{data model}` is the data model specifier (_e.g._ `sd` for small data, `ld` for large data).

For instance, the file `tb_65816_sc_ld.a` will contain the Toolbox bindings for 65816 projects built using the small code and large data models.

To build all the library files, run the command:

<pre>
python build.py
</pre>

# Updating the Bindings

If the Toolbox jumptable has changed (moved or has functions added), it is necessary to update the architecture-specific bindings file. This can be done automatically with the Python script `genbindings.py`.

The `genbindings.py` script uses an architecture-specific addresses CSV file (`addresses_65816.csv` and `addresses_68k.csv`) to provide the source data in creating the correct bindings files. The CSV files should be present in the Toolbox source project with the current information but will need to be renamed in the client project (they will be in the same architecture-specific directory where the jumptable is created). Once those CSV files have been copied over and re-named, the bindings files can be generated with the command:

<pre>
python genbindings.py
</pre>

The result will be new architecture-specific bindings files: `bindings_65816.s` and `bindings_68k.s`. Once these files have been updated, the `build.py` script can be executed to generate the new library files.
