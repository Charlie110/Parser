%{
    #include <cstdlib>
    #include <cstdio>
    #include <iostream>

    #define YYDEBUG 1

    int yylex(void);
    void yyerror(const char *);
%}

%error-verbose

/* WRITEME: List all your tokens here */
%token T_NUMBER T_PLUS T_MINUS T_MULTIPLY T_DIVIDE T_MOD T_OPENPAREN T_CLOSEPAREN T_OPENBRACKET T_CLOSEBRACKET T_EQUAL T_NOT T_AND 
%token T_FOR T_IF T_ELSE T_RETURN T_PRINT T_WHILE T_DO T_TYPE T_NEW T_NONE T_EXTENDS 
%token T_TRUE T_FALSE T_OR T_ARROW T_SEMI 
%token T_COMMA T_ID T_G T_L T_GE T_LE T_DOT 
/* WRITEME: Specify precedence here */

%precedence T_UNARYMINUS T_NOT
%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
Start :	Classes
      ;

/* WRITME: Write your Bison grammar specification here */
Classes   : T_ID Class Classes
	| %empty
	;
Class	: T_OPENBRACKET Option T_CLOSEBRACKET
      	| T_EXTENDS T_ID T_OPENBRACKET Option T_CLOSEBRACKET
	| T_OPENBRACKET T_CLOSEBRACKET
	| T_EXTENDS T_ID T_OPENBRACKET T_CLOSEBRACKET
	;
Option 	: T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Name T_OPENBRACKET MoreOption T_CLOSEBRACKET MoreOption
	| T_ID T_ID A T_SEMI MoreOption
	| T_TYPE T_ID A T_SEMI MoreOption
	| Statements MoreOption
        | T_WHILE Condition T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
        | T_IF Condition T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
        | T_IF Condition T_OPENBRACKET Option T_CLOSEBRACKET T_ELSE T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
	| T_DO T_OPENBRACKET Option T_CLOSEBRACKET T_WHILE Expr T_SEMI MoreOption	
	| T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Name T_OPENBRACKET MoreOption Return T_CLOSEBRACKET MoreOption
	;
MoreOption : Statements MoreOption
           | T_WHILE Condition T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
           | T_IF Condition T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
           | T_IF Condition T_OPENBRACKET Option T_CLOSEBRACKET T_ELSE T_OPENBRACKET Option T_CLOSEBRACKET MoreOption
           | T_DO T_OPENBRACKET Option T_CLOSEBRACKET T_WHILE Expr T_SEMI MoreOption  
	   | T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Name T_OPENBRACKET MoreOption T_CLOSEBRACKET MoreOption
           | T_ID T_ID A T_SEMI MoreOption
           | T_TYPE T_ID A T_SEMI MoreOption
	   | T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Name T_OPENBRACKET MoreOption Return T_CLOSEBRACKET MoreOption
	   | %empty 
	   ;
Parameters : T_TYPE T_ID
	   | T_ID T_ID 
	   | T_TYPE T_ID T_COMMA Parameters_Prime
	   | T_ID T_ID T_COMMA Parameters_Prime
	   | %empty
	   ;
Parameters_Prime : T_TYPE T_ID
		 | T_ID T_ID
		 | T_TYPE T_ID T_COMMA Parameters_Prime
		 | T_ID T_ID T_COMMA Parameters_Prime
		 ;

A	: T_COMMA T_ID A
  	| %empty
	;

Condition : Expr
	  ;

Statements : Assignments 
	   | Print  	
	   ;
Name : T_TYPE
     | T_NONE
     | T_ID
     ;
Assignments : T_ID T_EQUAL Expr T_SEMI
	    | T_ID T_DOT T_ID T_EQUAL Expr T_SEMI
	    ;
Print : T_PRINT Expr T_SEMI
      ; 
Return : T_RETURN Expr T_SEMI
       ;  
Expr : Expr_prime
     | Expr_prime Combine Expr
     ;
Expr_prime : Factor 
     	   | T_OPENPAREN Expr T_CLOSEPAREN 
           | T_NEW T_ID T_OPENPAREN T_CLOSEPAREN
           | T_NEW T_ID T_OPENPAREN Arguments T_CLOSEPAREN 
           | T_NEW T_ID
           | T_NOT Expr_prime 	%prec T_NOT
           | T_MINUS Expr_prime	%prec UNARY_MINUS 
           ;
Arguments : Argument
	  ;
Argument : Argument T_COMMA Expr
	 | Expr
	 ;

Factor : T_NUMBER
       | T_TRUE
       | T_FALSE
       | T_ID
       | T_ID T_DOT T_ID
       ;
Combine : Operations
	| Comparsion
	| Logic
	;
Operations : T_PLUS
	   | T_MINUS
	   | T_DIVIDE
	   | T_MULTIPLY
	   | T_MOD
	   ;

Comparsion : T_EQUAL
           | T_GE
           | T_LE
           | T_G
           | T_L
           ;
Logic : T_AND
      | T_OR
      ;

%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}
