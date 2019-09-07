%{
#include <stdio.h>
#include <stdlib.h>
extern yylex();
extern yytext[];
extern FILE *yyin;
%}
%start START
%token VAL COMPR BINOP ATTR REL NUMBER LP RP RB LB COM 
AS WH RNM
%%
START : EXPRESSION                                          {
                                                            };
EXPRESSION                      :   ONE_RELATION_EXPRESSION {    
                                                            };
                                |   TWO_RELATION_EXPRESSION {
                                                            };
ONE_RELATION_EXPRESSION         :   RENAMING                {
                                                            };
                                |   RESTRICTION             {
                                                            };
                                |   PROJECTION              {
                                                            };
RENAMING                        :   TERM RNM ATTR AS ATTR   {
                                                            };
TERM                            :   REL                	    {
                                                            };
                                |  LP EXPRESSION RP  	    {
                                                            };
RESTRICTION                     :   TERM WH COMPARISON      {
                                                            };
PROJECTION                      :   TERM                    {
                                                            };
                                |   TERM LB ATTRIBUTE_COMMALIST RB	 {
                                                                	 };
ATTRIBUTE_COMMALIST             :   ATTR	              	 {
                                                      		 };
                                |   ATTR COM ATTRIBUTE_COMMALIST	 {
                                                                     	 };
TWO_RELATION_EXPRESSION         :   PROJECTION BINOP EXPRESSION		       {
                                                                               };
COMPARISON                      :   ATTR COMPR NUMBER	    	    {
                                             		            };
%%
int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	if (!yyin)
	{
		printf("no file\n");
		exit(0);
	}
	yyparse();
	printf("\nACCEPT\n");
}
yyerror()
{
	printf("\nREJECT\n");
	exit(0);
}
yywrap()
{
}

