#include <stdio.h>

#include "../lib/include/toolbox.h"
#include "test_cmds.h"

#define LINESIZE 128
#define PAGESIZE 25

void cmd_set_border_size(short x, short y) {
    sys_txt_set_border(0, x, y);
}

void cmd_set_border_color(short r, short g, short b) {
    sys_txt_set_border_color(0, r, g, b);
}

void cmd_more(const char * path) {
    unsigned char line[LINESIZE];
    short count = 0;

    printf("Contents of %s:\n", path);
    short fd = sys_fsys_open(path, FSYS_READ);
    if (fd >= 0) {
        while (sys_chan_readline(fd, line, LINESIZE) > 0) {
            printf("%s", line);

            // Pause if we've printed a page
            if (count++ == PAGESIZE) {
                printf("\nPress any key to continue.\n");
                while (sys_chan_read_b(0) == 0) ;
                count = 0;
            }
        }

        sys_fsys_close(fd);
    } else {
        printf("Could not open /sd0/hello.txt for reading.\n");
    }
}

/*
 * Try out the directory calls
 */
void cmd_dir(const char * path) {
    t_file_info file_info;

    printf("Contents of %s:\n", path);
    short dir = sys_fsys_opendir(path);
    if (dir >= 0) {
        while (sys_fsys_readdir(dir, &file_info) >= 0) {
            if (file_info.name[0] == 0) {
                // Empty file name means end of directory
                break;

            } else {
                if ((file_info.attributes & FSYS_AM_SYS) == 0) {
                    if (file_info.attributes & FSYS_AM_DIR) {
                        printf("%s/\n", file_info.name);
                    } else {
                        printf("%s\n", file_info.name);
                    }
                }
            }
        }
        sys_fsys_closedir(dir);

    } else {
        printf("Unable to open directory on /sd0.\n");
    }
}
