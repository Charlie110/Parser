%option yylineno
%pointer

%{
    #include <cstdlib>
    #include <cerrno>
    #include <climits>
    #include <limits>
    #include "parser.hpp"
    
	void yyerror(const char *);
%}

/* WRITEME: Write any definitions here. You can find information on
            definitions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC10 */

/* WRITEME: If you are going to use start conditions, write them here.
            You can find more information on start conditions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC11
            You will probably want to use exclusive conditions rather
            than inclusive conditions (use the %x instead of the %s). */

%x COMMENT
%%


"/*"	{BEGIN(COMMENT);}
<COMMENT>(.|\n) ;
<COMMENT><<EOF>> {yyerror("reach end of file before end of comment");}
<COMMENT>"*/" {BEGIN(INITIAL);}

  /* WRITEME: Write your Flex token rules here */

[0-9]|[1-9][0-9]*	{return T_NUMBER;}
"+"	{return T_PLUS;}
"-"	{return T_MINUS;}
"*"	{return T_MULTIPLY;}
"/"	{return T_DIVIDE;}
"%"	{return T_MOD;}
"."	{return T_DOT;}
"(" 	{return T_OPENPAREN;}
")"	{return T_CLOSEPAREN;}
"{"	{return T_OPENBRACKET;}
"}"	{return T_CLOSEBRACKET;}
"="	{return T_EQUAL;}
"=="	{return T_EQUAL;}
"<"	{return T_L;}
">"	{return T_G;}
"<="	{return T_LE;}
">="	{return T_GE;}
"!"	{return T_NOT;}
";"	{return T_SEMI;}
"&"|"&&"|"and"	{return T_AND;}
"not"	{return T_NOT;}
"||"	{return T_OR;}
"or"	{return T_OR;}
"|"	{return T_OR;}
","	{return T_COMMA;}
"true"	{return T_TRUE;}
"false"	{return T_FALSE;}
"->"	{return T_ARROW;}

"none"	{return T_NONE;}
"extends"	{return T_EXTENDS;}
"equals"	{return T_EQUAL;}
"new"	{return T_NEW;}
"for"   {return T_FOR;}
"if"    {return T_IF;}
"else"  {return T_ELSE;}
"return"        {return T_RETURN;};
"print"	{return T_PRINT;}
"while" {return T_WHILE;}
"do"	{return T_DO;}

"integer"	{return T_TYPE;}
"double"	{return T_TYPE;}
"boolean"	{return T_TYPE;}
[a-zA-Z][a-zA-Z0-9]*	{return T_ID;}
[ \t\n]	;
.                 { yyerror("invalid character"); }

%%

int yywrap(void) {
  return 1;
}
