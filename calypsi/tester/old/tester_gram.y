%{
#include <stdio.h>
#include "test_cmds.h"
%}

%union {
  char str_value[128];
  int int_value;
}

%token <int_value> NUMBER
%token <str_value> STRING
%token LP RP COMMA
%token DIR MORE SET BORDER SIZE COLOR DUMP
%token DELETE RENAME FROM TO


%%

commands:
    | commands command
    ;

command:
    | DIR STRING                    { cmd_dir($2); }
    | MORE STRING                   { cmd_more($2); }
    | SET BORDER SIZE TO NUMBER     { cmd_set_border_size($5, $5); }
    | SET BORDER COLOR TO NUMBER    { cmd_set_border_color($5, $5, $5);  }
    | DUMP NUMBER COMMA NUMBER      { cmd_dump($2, $4); }
    | RENAME STRING STRING          { cmd_rename($3, $2); }   
    | DELETE STRING                 { cmd_delete($2); }
    ;


%%

/* Declarations */
extern void set_input_string(const char* in);
extern void end_lexical_scan(void);

/* This function parses a string */
void parse_string(const char* in) {
  set_input_string(in);
  int rv = yyparse();
  end_lexical_scan();
}
