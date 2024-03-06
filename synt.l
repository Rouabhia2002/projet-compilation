%{
int nbr_ligne = 1;
int nb_colone =1;
char sauvtype[20];
%}

%union {
int entier ;
char* str;
}

%token <str>mc_idf vrg <str>mc_bool aff <str>mc_int <entier>mc_const <str>mc_float <str>mc_char mc_if mc_else mc_for mc_range mc_while
 mc_in mc_comm mc_sep par_ouv par_fer gm mc_true mc_false acc_ouv acc_fer mc_and  mc_dp mc_tab mc_or mc_not 
 mc_equal  mc_greater mc_less mc_GE mc_LE  mc_plus mc_moins mc_foi mc_div sdl mc_const_float
;

%start S
%nonassoc mc_greater mc_less mc_equal mc_GE mc_LE
%right mc_not 
%right aff
%left mc_plus mc_moins
%left mc_foi mc_div
%%

S:LIST_DEC EXP_INST 

  {printf ("\nprogramme syntaxiquement correcte\n"); YYACCEPT;} 
;




LIST_DEC : DEC  LIST_DEC
		  |mc_comm sdl LIST_DEC
		  |
;

EXP_INST:sdl EXP_AFF EXP_INST
        |EXP_AFF EXP_INST
		|sdl LIST_INST_LOG EXP_INST
        |sdl IF_SANS EXP_INST
		|sdl IF_WITH EXP_INST
		|IF_WITH EXP_INST
		|IF_SANS EXP_INST
		|sdl FOR EXP_INST
		|sdl WHILE EXP_INST
		|sdl FOR_SEC EXP_INST
		|WHILE EXP_INST
		|FOR_SEC EXP_INST
		|FOR EXP_INST
		|sdl mc_comm EXP_INST
		|mc_comm EXP_INST
		|
; 



DEC :  DEC_VAR
       |DEC_TAB 
	   |mc_idf aff mc_const
;


DEC_VAR :  TYPE LIST_IDF 
;

LIST_IDF:  
          mc_idf vrg LIST_IDF { if ( doubleDeclaration($1)==0)
		                     insererType($1,sauvtype);
							 else printf("error semantique double declaration de %s a la ligne %d\n ",$1, nbr_ligne);}
							 
         |mc_idf sdl {if ( doubleDeclaration($1)==0)
		                     insererType($1,sauvtype);
							 else printf("error semantique double declaration de %s a la ligne %d\n ",$1, nbr_ligne);}
		 
; 



DEC_TAB:  TYPE LIST_DECT
;
LIST_DECT:mc_idf acc_ouv mc_const acc_fer sdl {
                             if($3<=0) printf ("\n erroe semantique a la ligne %d la taille du tableau doit etre strictement positive\n", nbr_ligne);
			                 else {				
							 if ( doubleDeclaration($1)==0)
		                           {insererType($1,sauvtype);}
							 else {printf("error semantique double declaration de %s a la ligne %d \n ",$1, nbr_ligne); } }}
          
;


TYPE: mc_bool  {strcpy(sauvtype, $1);}
     | mc_int  {strcpy(sauvtype, $1);}
     | mc_float {strcpy(sauvtype, $1);}
     | mc_char   {strcpy(sauvtype, $1);}
;




EXP_AFF:  mc_idf aff mc_idf 
         {  if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
			  if(doubleDeclaration($3)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$3,nbr_ligne); }
  |mc_idf aff mc_const 
        
		 {  
			 if(doubleDeclaration($1)==0) 
					printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		 }
		
	    
  |mc_idf aff EXP_ARRI 
		  
		  {  if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		}
  |mc_idf aff CAS_PAR mc_div mc_const
            {  
			if($5==0) printf("errer semantique divison sur 0 a la ligne%d\n", nbr_ligne);
			if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		}

   |mc_idf aff gm mc_idf gm

				 
;


EXP_ARRI:CAS_PAR SEP_ARITR ARR
         
;

ARR:  CAS_PAR SEP_ARITR  ARR 
	  |CAS_PAR
	  | 
	  
;



SEP_ARITR:  mc_plus
           |mc_moins
		   |mc_foi
		   |mc_div
;

CAS_PAR :mc_const
        |mc_idf		
        |par_ouv mc_const par_fer
        |par_ouv mc_idf par_fer
		
		

;





LIST_INST_LOG :INST_LOG 
              |COMPARAISON
;


INST_LOG :     mc_idf SEP_LOG1 INST_LOG
                 {  if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		         }
                |mc_idf 
	   {  if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		}
                |mc_not INST_LOG
               
;


COMPARAISON: mc_idf SEP_LOG2  mc_idf        
     {  if(doubleDeclaration($1)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
	   if(doubleDeclaration($3)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
		}
            |mc_const SEP_LOG2  mc_const   
			|mc_idf SEP_LOG2 mc_const


;

SEP_LOG2:mc_equal
        |mc_greater
        |mc_less
        |mc_GE
        |mc_LE
;
SEP_LOG1:
      mc_or
     |mc_and
;





IF_SANS : mc_if par_ouv LIST_INST_LOG par_fer mc_dp sdl  TABIF 
;


IF_WITH:  mc_if par_ouv LIST_INST_LOG par_fer mc_dp sdl TABIF mc_else mc_dp sdl  TABIF 
;

FOR:mc_for mc_idf mc_in mc_range par_ouv mc_const vrg mc_const par_fer mc_dp sdl  TABIF 
	{  if($6>$8 ) 
			  printf("\nErreur semantique: %s valeurs interchangées a la ligne %d\n",$1,nbr_ligne);	  
		}
;
WHILE:mc_while par_ouv LIST_INST_LOG par_fer mc_dp sdl  TABIF  
;
FOR_SEC:mc_for mc_idf mc_in mc_idf mc_dp sdl  TABIF 
    {  if(doubleDeclaration($2)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);
	  if(doubleDeclaration($3)==0) 
			  printf("\nErreur semantique: %s variable non declaree a la ligne %d\n",$1,nbr_ligne);	  
			  
		}
;

TABIF:  mc_tab EXP_AFF sdl TABIF 
        |
;


%%
main()
{yyparse();
 afficher();}				
 
yywrap(){}
yyerror(char* msg)
{						 
 printf("error syntaxique a la ligne%d et la colonne %d \n", nbr_ligne , nb_colone);

}




