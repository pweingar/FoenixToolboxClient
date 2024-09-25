
# Options used:
# --nostart : Prevents 64TASS from tagging the file with a starting address
# -o : specify the output file

echo Building raw binary hello.bin
64tass --nostart -o hello.bin hello.s
