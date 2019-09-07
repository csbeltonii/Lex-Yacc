%{
#include "p5.tab.h"
extern int yylval;
%}
Delimiter   [ \t\n]
WhiteSpace  {Delimiter}+
Digit   [0-9]
Number {Digit}+
BINARY_OPERATION UNION|INTERSECT|MINUS|TIMES|JOIN|DIVIDEBY
ATTRIBUTE CNO|CITY|CNAME|SNO|PNO|TQTY|SNAME|QUOTA|PNAME|COST|AVQTY|S#|STATUS|P#|COLOR|WEIGHT|QTY
RELATION S|P|SP|PRDCT|CUST|ORDERS
COMPARE =<|>=|<|>|=|<>
%%
{WhiteSpace}                    ;
{Number}                        return VAL;
{COMPARE}                       return COMPR;
{BINARY_OPERATION}              return BINOP;
{ATTRIBUTE}                     return ATTR;
{RELATION}			return REL;
"["                             return LB;
"]"                             return RB;
"("                             return LP;
")"                             return RP;
","                             return COM;
"WHERE"                         return WH;
"AS"                            return AS;
"RENAME"                       	return RNM;
%%
