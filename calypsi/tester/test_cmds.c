#include <stdio.h>
#include <ctype.h>

#include "../lib/include/toolbox.h"
#include "test_cmds.h"

#define LINESIZE 128
#define PAGESIZE 25

void cmd_set_border_size(short x, short y) {
    sys_txt_set_border(0, x, y);
}

void cmd_set_border_color(short r, short g, short b) {
    printf("<%d, %d, %d>\n", r, g, b);
    sys_txt_set_border_color(0, r, g, b);
}

void cmd_more(const char * path) {
    unsigned char line[LINESIZE];
    short count = 0;

    short fd = sys_fsys_open(path, FSYS_READ);
    if (fd >= 0) {
        printf("\nContents of %s:\n", path);
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
        printf("\nCould not open %s for reading: %s\n", path, sys_err_message(fd));
    }
}

/*
 * Try out the directory calls
 */
void cmd_dir(const char * path) {
    t_file_info file_info;

    short dir = sys_fsys_opendir(path);
    if (dir >= 0) {
        printf("\nContents of %s:\n", path);

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
        printf("\nUnable to open directory on %s: %s\n", path, sys_err_message(dir));
    }
}

/**
 * Dump memory to the screen
 */
void cmd_dump(uint32_t start, uint16_t size) {
    const char * hex_digits = "0123456789ABCDEF";

    char hex_data[40];
    char ascii_data[20];

    printf("\nContents of 0x%06lX\n", start);

    uint16_t count = 0;
    uint8_t * data = (uint8_t *)start;
    for (int i = 0; i < size; i++) {
        uint8_t value = data[i];
        char digit_high = hex_digits[(value >> 4) & 0x0f];
        char digit_low = hex_digits[value & 0x0f];
        hex_data[count * 2] = digit_high;
        hex_data[count * 2 + 1] = digit_low;

        if (isprint(value)) {
            ascii_data[count] = value;
        } else {
            ascii_data[count] = '.';
        }

        count++;
        if (count > 16) {
            hex_data[count] = 0;
            ascii_data[count] = 0;
            count = 0;

            printf("%s |%s|\n", hex_data, ascii_data);
        }
    }

    printf("%s |%s|\n", hex_data, ascii_data);
}

/**
 * Delete a file
 * 
 * @param path the path to the file to delete
 */
void cmd_delete(char * path) {
    short result = sys_fsys_delete(path);
    if (result < 0) {
        printf("Could not delete file: %s\n", sys_err_message(result));
    }
}

/**
 * Rename a file
 * 
 * @param new_path the new name the file should have
 * @param old_path the old name the file has
 */
void cmd_rename(char * new_path, char * old_path) {
    short result = sys_fsys_rename(old_path, new_path);
    if (result < 0) {
        printf("Could not rename file: %s\n", sys_err_message(result));
    }
}