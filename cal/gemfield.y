%{
#include <stdio.h>
#include <math.h>
void yyerror(char *);
%}

%union
{
double dval;
}

%token <dval> NUM
%token SIN COS TAN SQRT
%right '~'
%left '+' '-'
%left '*' '/'
%type <dval> expression

%%
program:program statement'\n'
      |
      ;

statement:
	 expression {printf("%lf\n",$1);}
         ;
expression: NUM
	  | expression '+' expression {$$ = $1 + $3;}
          | expression '-' expression {$$ = $1 - $3;}
          | expression '*' expression {$$ = $1 * $3;}
          | expression '/' expression {$$ = $1 / $3;}
          | '~' expression {$$ = -(1) * $2;}
          | SQRT'('expression')' {$$ = sqrt( $3 );}
          | SIN'('expression')'  {$$ = sin ($3*3.142/180);}
          | COS'('expression')'   {$$ = cos ($3*3.142/180);}
          | TAN'('expression')'   {$$ = tan ($3*3.142/180);} 
          ;
%%

main()
{
yyparse();

}
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}
