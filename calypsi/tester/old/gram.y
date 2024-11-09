%{
#include <stdio.h>
#include <stdlib.h>
#include "test_cmds.h"

extern void set_input_string(const char * in);
extern void end_lexical_scan(void);
extern struct s_tuple * new_tuple(short x, short y);

struct s_tuple {
	short x;
	short y;
};

%}

%union {
	int d;
	struct s_tuple * t;
};

%token <d> T_NUM
%token T_SET T_BORDER T_SIZE T_COLOR
%token T_EOL

%type <t> tuple

%%

commands: commands command T_EOL
	| command T_EOL
	;

command: T_SET T_BORDER T_SIZE tuple					{ printf("set-border-size\n"); cmd_set_border_size($4->x, $4->y); free($4); }
	| T_SET T_BORDER T_COLOR T_NUM ',' T_NUM ',' T_NUM	{ cmd_set_border_color($4, $6, $8); }
	;

tuple: '(' T_NUM ',' T_NUM ')' { short x = $2; short y = $4; struct s_tuple *tt = new_tuple(x, y); printf("<%d, %d>\n", tt->x, tt->y); return tt; }

%%

/* This function parses a string */
int parse_string(const char * in) {
  set_input_string(in);
  int rv = yyparse();
  end_lexical_scan();
  return rv;
}

struct s_tuple * new_tuple(short x, short y) {
	struct s_tuple * result = malloc(sizeof(struct s_tuple));
	if (result) {
		result->x = x;
		result->y = y;
	}
	return result;
}