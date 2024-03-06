
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     mc_idf = 258,
     vrg = 259,
     mc_bool = 260,
     aff = 261,
     mc_int = 262,
     mc_const = 263,
     mc_float = 264,
     mc_char = 265,
     mc_if = 266,
     mc_else = 267,
     mc_for = 268,
     mc_range = 269,
     mc_while = 270,
     mc_in = 271,
     mc_comm = 272,
     mc_sep = 273,
     par_ouv = 274,
     par_fer = 275,
     gm = 276,
     mc_true = 277,
     mc_false = 278,
     acc_ouv = 279,
     acc_fer = 280,
     mc_and = 281,
     mc_dp = 282,
     mc_tab = 283,
     mc_or = 284,
     mc_not = 285,
     mc_equal = 286,
     mc_greater = 287,
     mc_less = 288,
     mc_GE = 289,
     mc_LE = 290,
     mc_plus = 291,
     mc_moins = 292,
     mc_foi = 293,
     mc_div = 294,
     sdl = 295,
     mc_const_float = 296
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 7 "synt.y"

int entier ;
char* str;



/* Line 1676 of yacc.c  */
#line 100 "synt.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


