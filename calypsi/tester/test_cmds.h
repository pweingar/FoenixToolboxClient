/**
 * 
 */

#ifndef __test_cmds_h__
#define __test_cmds_h__

extern void cmd_set_border_size(short x, short y);

extern void cmd_set_border_color(short r, short g, short b);

extern void cmd_more(const char * path);

/*
 * Try out the directory calls
 */
extern void cmd_dir(const char * path);

#endif