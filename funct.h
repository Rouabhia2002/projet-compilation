#include <stdio.h>
#include <string.h>
#include <string.h>

typedef struct{
    char name[20];
	char code[20];
	char type[20];
}ts;

ts t[100];
int cpt=0;

int rechercher(char entite[]){
	int i=0;
	while(i<cpt) {
		if (strcmp(entite, t[i].name)==0) return i;
		i++;
	}
	return -1;
} 

void inserer(char entite[], char code[]){
	if ((rechercher(entite))==-1) 
	{
		strcpy(t[cpt].name, entite);
        strcpy(t[cpt].code, code);	
        cpt++;		
	}
	
}

void insererType(char entite[], char typee[]){
	int pos;
	pos=rechercher(entite);
	if (pos!=-1) 
	{strcpy(t[pos].type, typee);	
	}
	
}

int doubleDeclaration(char entite[]){
	int pos; 
	pos=rechercher(entite);
   if (strcmp(t[pos].type, "")==0) return 0 ;
	   else return -1;
}




void afficher(){
	printf("****************la table de symbole est *****************************\n");
    printf("---------------------------------------------------------------------\n");
    printf("*****|nom entite|**********|code entite|**********|type entite|******\n");
  	printf("---------------------------------------------------------------------\n");
 int i = 0;
 while (i<cpt)
    {printf("     |%12s         |%12s|   |%12s \n",    t[i].name ,  t[i].code, t[i].type);
	i++;}}
	
	
	
	
