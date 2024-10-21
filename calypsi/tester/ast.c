/**
 * 
 */

#include <stdlib.h>

#include "ast.h"

/**
 * Create a new AST node
 * 
 * @param type the type of AST node to create
 * @returns pointer to the AST node, 0 on error
 */
struct ast_s * ast_alloc(short type) {
    struct ast_s * result = malloc(sizeof(struct ast_s));
    if (result) {
        result->type = type;
    }

    return result;
}

/**
 * Return an AST to the heap
 * 
 * @param tree the AST to return
 */
void ast_free(struct ast_s * tree) {
    switch(tree->type) {
        case ast_type_literal:
            if (tree->u.literal.type == type_string) {
                free(tree->u.literal.u.string_value);
            }
            break;

        case ast_type_unop:
            ast_free(tree->u.unop.expr);
            break;

        case ast_type_binop:
            ast_free(tree->u.binop.first_expr);
            ast_free(tree->u.binop.second_expr);
            break;
    
        default:
            break;
    }

    free(tree);
}