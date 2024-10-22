/**
 * 
 */

#ifndef __ast_h__
#define __ast_h__

const short type_integer = 0;
const short type_real = 1;
const short type_string = 2;

const short ast_type_literal = 0;
const short ast_type_binop = 1;
const short ast_type_unop = 2;

struct ast_s;

struct ast_literal_s {
    short type;
    union {
        int int_value;

        float real_value;

        char * string_value;
    } u;
};

struct ast_binop_s {
    short op;
    struct ast_s * first_expr;
    struct ast_s * second_expr;
};

struct ast_unop_s {
    short op;
    struct ast_s * expr;
};

struct ast_s {
    short type;
    union {
        struct ast_literal_s literal;
        struct ast_binop_s binop;
        struct ast_unop_s unop;
    } u;
};

/**
 * Create a new AST node
 * 
 * @param type the type of AST node to create
 * @returns pointer to the AST node, 0 on error
 */
extern struct ast_s * ast_alloc(short type);

/**
 * Return an AST to the heap
 * 
 * @param tree the AST to return
 */
extern void ast_free(struct ast_s * tree);

#endif