/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_NUMBER = 258,
    T_PLUS = 259,
    T_MINUS = 260,
    T_MULTIPLY = 261,
    T_DIVIDE = 262,
    T_MOD = 263,
    T_OPENPAREN = 264,
    T_CLOSEPAREN = 265,
    T_OPENBRACKET = 266,
    T_CLOSEBRACKET = 267,
    T_EQUAL = 268,
    T_NOT = 269,
    T_AND = 270,
    T_FOR = 271,
    T_IF = 272,
    T_ELSE = 273,
    T_RETURN = 274,
    T_PRINT = 275,
    T_WHILE = 276,
    T_DO = 277,
    T_TYPE = 278,
    T_NEW = 279,
    T_NONE = 280,
    T_EXTENDS = 281,
    T_TRUE = 282,
    T_FALSE = 283,
    T_OR = 284,
    T_ARROW = 285,
    T_SEMI = 286,
    T_COMMA = 287,
    T_ID = 288,
    T_G = 289,
    T_L = 290,
    T_GE = 291,
    T_LE = 292,
    T_DOT = 293,
    T_UNARYMINUS = 294,
    UNARY_MINUS = 295
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
