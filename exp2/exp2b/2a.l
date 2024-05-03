%option noyywrap
letter [a-zA-Z]
digit [0-9]
id [_|a-zA-Z]
AO [+|-|/|%|*]
RO [&lt;|>|&lt;=|>=|==]
pp [#]
%{
int n=0;
%}

%%
"void" printf("%s return type\n",yytext);
{letter}*[(][)] printf("%s Function\n",yytext);
"int"|"float"|"if"|"else" printf("%s keywords\n",yytext);
"printf" printf("%s keywords\n",yytext);
{id}({id}|{digit})* printf("%s Identifier\n",yytext);
{digit}{digit}* printf("%s Numbers\n",yytext);
{AO} printf("%s Arithmetic Operators\n",yytext);
{RO} printf("%s Relational Operators\n",yytext);
{pp}{letter}[&lt;]{letter}[.]{letter}[>] printf("%s processorDirective\n",yytext);

[\n] n++;
"."|","|"}"|"{"|";" printf("%s others\n",yytext);

%%
int main()
{
yyin=fopen("sample.c","r");
yylex();
printf("No of Lines %d\n",n);
}
