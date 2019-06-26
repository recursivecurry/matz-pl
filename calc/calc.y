/*

This file is a modified excerpt from the GNU Bison Manual examples originally found here:
http://www.gnu.org/software/bison/manual/html_node/Infix-Calc.html#Infix-Calc

The Copyright License for the GNU Bison Manual can be found in the "fdl-1.3" file.

*/

/* Infix notation calculator.  */

%{

// +build ignore

package main

import (
    "bufio"
    "fmt"
    "os"
)

%}

%union{
    value float64
}

%token	NUM ADD SUB MUL DIV

%type	<value>	NUM, exp

%% /* The grammar follows.  */

program:    /* empty */
           | program statement
;

statement:   '\n'
             | exp  { fmt.Printf("= %g\n", $1) }
;

exp:      NUM                { $$ = $1          }
        | exp ADD exp        { $$ = $1 + $3     }
        | exp SUB exp        { $$ = $1 - $3     }
        | exp MUL exp        { $$ = $1 * $3     }
        | exp DIV exp        { $$ = $1 / $3     }
;
%%

func main() {
    os.Exit(yyParse(newLexer(bufio.NewReader(os.Stdin))))
}

