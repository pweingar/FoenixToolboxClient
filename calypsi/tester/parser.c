/**
 * 
 */

#include <ctype.h>
#include <stdio.h>
#include <string.h>

#include "../lib/include/toolbox.h"
#include "test_cmds.h"
#include "parser.h"

#define LINESIZE 80

static char line[LINESIZE];

/**
 * Commands
 * DIR path
 * MORE path
 */

void readline() {
    short n = sys_chan_readline(0, (unsigned char *)line, LINESIZE);
}

void parse(char * line) {
    char * token = strtok(line, " ");
    while(token) {
        if (strcmp(token, "dir") == 0) {
            cmd_dir("/sd0");
            return;

        } else if (strcmp(token, "more") == 0) {
            cmd_more("/sd0/hello.txt");
            return;
        }

        token = strtok(NULL, " ");
    }
}

void repl() {
    do {
        printf("\n> ");
        readline();
        printf("\n");

        parse(line);
    } while(1);
}