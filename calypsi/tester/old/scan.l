%{
#include <stdio.h>
#include <stdlib.h>
#include "gram.tab.h"

extern int hex2int(const char * hex);
%}

%option caseless
%option noyywrap
%option always-interactive

%%

[0-9]+			{ yylval.d = atoi(yytext); return T_NUM; }
"set"			{ return T_SET; }
"border"		{ return T_BORDER; }
"size"			{ return T_SIZE; }
"color"			{ return T_COLOR; }
"(" |
")" |
","				{ return yytext[0]; }
\n				{ return T_EOL; }

%%

int hex2int(const char * hex) {
	int result = 0;

	result = (int)strtol(hex, NULL, 16);

	return result;
}

void set_input_string(const char* in) {
  yy_scan_string(in);
}

void end_lexical_scan(void) {
  yy_delete_buffer(YY_CURRENT_BUFFER);
}