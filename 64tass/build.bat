@echo off

REM Options used:
REM --nostart : Prevents 64TASS from tagging the file with a starting address
REM -o : specify the output file

echo Building raw binary hello.bin
64tass --nostart  -o hello.bin --list hello.lst hello.s
