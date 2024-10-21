/**
 * 
 */

#include <stdio.h>
#include "../lib/include/toolbox.h"
#include "test_cmds.h"
#include "tester_gram.tab.h"

#define LINESIZE 128

char line[LINESIZE];

void yyerror(char * s) {
    printf("\n\nError: %s\n", s);
}

void readline(char * l) {
    sys_chan_readline(0, l, LINESIZE);
}

void repl() {
    do {
        printf("\n> ");
        readline(line);
        printf("\n");
        parse_string(line);
    } while(1);
}

int main(int argc, char * argv[]) {
    printf("Welcome to the Foenix Toolbox Tester\n\n");
    int x = 23;
    int y = 54;
    printf("%d\n", x * y);
    repl();
    return 0;
}