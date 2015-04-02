%{
#include "y.tab.h"
#include <stdio.h>
void yyerror(char *);	
%}
%%
(([0-9]+)|([0-9]*\.[0-9]+)) {
yylval.dval=atof(yytext);
return NUM;
}

[+-/8\n,~()] {return (*yytext);}

sin return SIN;
cos return COS;
tan return TAN;
sqrt return SQRT;
exit exit(0);
[\t] /*ignore*/
%%

int yywrap(void)
{
	return 1;
}
