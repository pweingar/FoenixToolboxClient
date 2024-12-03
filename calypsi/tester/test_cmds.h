/**
 * 
 */

#ifndef __test_cmds_h__
#define __test_cmds_h__

#include <stdint.h>

extern void cmd_set_border_size(short x, short y);

extern void cmd_set_border_color(short r, short g, short b);

extern void cmd_more(const char * path);

/*
 * Try out the directory calls
 */
extern void cmd_dir(const char * path);

/**
 * Dump memory to the screen
 */
extern void cmd_dump(uint32_t start, uint16_t count);

/**
 * Delete a file
 * 
 * @param path the path to the file to delete
 */
extern void cmd_delete(char * path);

/**
 * Rename a file
 * 
 * @param new_path the new name the file should have
 * @param old_path the old name the file has
 */
extern void cmd_rename(char * new_path, char * old_path);

/**
 * Run a file
 * 
 * NOTE: this RUN command does not support command line arguments... it's just a launcher
 * 
 * @param path the path to the file to run
 */
extern void cmd_run(char * path);

/**
 * @brief For a quit of the program back to the Toolbox and whatever shell is registerd
 * 
 */
extern void cmd_bye();

/**
 * @brief Read the directory listing from the IEC drive #8
 * 
 */
extern void cmd_cbm_dir();

/**
 * @brief Load a font file as the current font
 * 
 * @param path the path to the FON file
 */
extern void cmd_set_font(const char * path);

#endif