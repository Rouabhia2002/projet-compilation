%{
    #include "synt.tab.h"
	#include <stdio.h>
	#include <string.h>
	#include "funct.h"
	extern nbr_ligne;     
	extern nb_colone ;
	extern YYSTYPE yylval;
%} 

lettreMaj [A-Z]
lettreMin [a-zA-Z]
chiffre [0-9]
idf {lettreMaj}({lettreMin}|{chiffre})*
constt 0|\-?([1-9]{chiffre}*)
contR \-?[0-9]+"."[0-9]+
comment #.*


%%
{idf} {if (yyleng<8)
    { inserer(yytext, "idf");
	nb_colone += strlen(yytext);
	yylval.str=strdup(yytext);
    return mc_idf;}
	else printf("\n idf trop long\n");
	}
{constt} {inserer(yytext, "constt"); yylval.entier=atoi(yytext);  return mc_const;}
{contR} {inserer(yytext, "constt"); yylval.entier=atoi(yytext);  return mc_const_float;}
{comment} {nb_colone += strlen(yytext);  return mc_comm;}
" " nb_colone++;
int { yylval.str = strdup(yytext);  nb_colone += strlen(yytext); return mc_int;}
bool {  yylval.str = strdup(yytext); return mc_bool;}
float {  yylval.str = strdup(yytext);nb_colone += strlen(yytext); return mc_float;}
char {  yylval.str = strdup(yytext);nb_colone += strlen(yytext);  return mc_char;}
if {nb_colone += strlen(yytext); return mc_if;}
else {nb_colone += strlen(yytext); return mc_else;}
for {nb_colone += strlen(yytext);return mc_for;}
range {nb_colone += strlen(yytext);  return mc_range;}
in {nb_colone += strlen(yytext);return mc_in;}
while {nb_colone += strlen(yytext);  return mc_while;}
true {nb_colone += strlen(yytext);  return mc_true;}
false {nb_colone += strlen(yytext);return mc_false;}
, {nb_colone += strlen(yytext); return vrg;}
= {inserer(yytext, "aff"); nb_colone += strlen(yytext);  return aff;}
"[" {nb_colone += strlen(yytext);  return acc_ouv;}
"]" {nb_colone += strlen(yytext); return acc_fer;}
"(" {nb_colone += strlen(yytext); return par_ouv;}
")" {nb_colone += strlen(yytext); return par_fer;}
"’" {nb_colone += strlen(yytext);return gm;}
and {nb_colone += strlen(yytext); return mc_and;}
or {nb_colone += strlen(yytext);  return mc_or;}
not {nb_colone += strlen(yytext);  return mc_not;}
"==" {nb_colone += strlen(yytext); return mc_equal;}
">" {nb_colone += strlen(yytext);  return mc_greater;}
"<" {nb_colone += strlen(yytext);return mc_less;}
"=<" {nb_colone += strlen(yytext); return mc_GE;}
"=>" {nb_colone += strlen(yytext);  return mc_LE;}
"+" {nb_colone += strlen(yytext); return mc_plus;}
"-" {nb_colone += strlen(yytext); return mc_moins;}
"*" {nb_colone += strlen(yytext); return mc_foi;}
"/" {nb_colone += strlen(yytext); return mc_div;}
":" {nb_colone += strlen(yytext);  return mc_dp;}
\t {nb_colone += strlen(yytext); return mc_tab;}
[\n] {nb_colone=1 ;nbr_ligne++; return sdl;}
. printf("erreur lexical \n Ligne :%d  et la colonne %d sur lentite %s\n", nbr_ligne,nb_colone, yytext);




