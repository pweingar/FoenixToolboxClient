%{
#include <stdlib.h>
#include <string.h>
#include "tester_gram.tab.h"

extern void strlit_copy(char * dest, char * src);

%}

%option caseless
%option noyywrap
%option nounistd
%option always-interactive

%%

[0-9]+        {
  yylval.int_value = 123;
  return NUMBER;
}

\"[^\"]*\"    { strlit_copy(yylval.str_value, yytext); return STRING; }
"("           { return LP; }
")"           { return RP; }
","           { return COMMA; }
"set"         { return SET; }
"to"          { return TO; }
"border"      { return BORDER; }
"color"       { return COLOR; }
"size"        { return SIZE; }
"more"        { return MORE; }
"dir"         { return DIR; }
"dump"        { return DUMP; }
"del"         { return DELETE; }
"ren"         { return RENAME; }
.             {}

%%

void strlit_copy(char * dest, char * src) {
  int len = strlen(src);
  if ((len > 2) && (src[0] == '\"') && (src[len - 1] == '\"')) {
    src[len - 1] = 0;
    strcpy(dest, src + 1);
  }
}

void set_input_string(const char* in) {
  yy_scan_string(in);
}

void end_lexical_scan(void) {
  yy_delete_buffer(YY_CURRENT_BUFFER);
}
