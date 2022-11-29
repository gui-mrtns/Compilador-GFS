%{
#include <bits/stdc++.h>
#include "gfs.tab.h"
using namespace std;
FILE *file1;
FILE *file2;
extern int yyparse (void);
 

%}
%option yylineno
%option noyywrap
digito		[0-9]
letra		[a-z]
caracter	{letra}+
inteiro		"-"?{digito}+
real		"-"?{digito}+"."{digito}+
variavel	{letra}+({digito}*{letra}*)*


%%
[ \t]+		;

"inicio"	{
	fprintf(file1, "#include<bits/stdc++.h>\nusing namespace std;\nint main(){\n");
	fprintf(file2, "%d inicio \t\t-> INICIO\n", yylineno);
	return INICIO;
}
"fim"		{
	fprintf(file1, "return 0;\n}\n");
	fprintf(file2, "%d fim \t\t-> FIM\n", yylineno);
	return FIM;
}
"pula"		{
	fprintf(file1, "<<endl");
	fprintf(file2, "%d pula \t\t-> QUEBRA\n", yylineno);
	return QUEBRA;
}
"inteiro"	{
	fprintf(file1, "int ");
	fprintf(file2, "%d tipointeiro \t-> TIPOINTEIRO\n", yylineno);
	return TIPOINTEIRO;
}
"real"	{
	fprintf(file1, "float ");
	fprintf(file2, "%d tiporeal \t\t-> TIPOREAL\n", yylineno);
	return TIPOREAL;
}
"caracter"	{
	fprintf(file1, "string ");
	fprintf(file2, "%d tipocaracter \t-> TIPOCARACTER\n", yylineno);
	return TIPOCARACTER;
}
"="			{
	fprintf(file1, "=");
	fprintf(file2, "%d = \t\t-> ATRIBUICAO\n", yylineno);
	return ATRIBUICAO;
	}
"guarde"	{
	fprintf(file1, "cin >>");
	fprintf(file2, "%d guarde \t\t-> ENTRADA\n", yylineno);
	return ENTRADA;
}
"mostre"	{
	fprintf(file1, "cout <<");
	fprintf(file2, "%d mostre \t\t-> SAIDA\n", yylineno);
	return SAIDA;
}
"se"		{
	fprintf(file1, "if");
	fprintf(file2, "%d se \t\t-> COND\n", yylineno);
	return COND;
}
"senao"		{
	fprintf(file1, "else");
	fprintf(file2, "%d senao \t\t-> DESCOND\n", yylineno);
	return DESCOND;
}
"enquanto"	{
	fprintf(file1, "while");
	fprintf(file2, "%d enquanto \t\t-> REPETICAO\n", yylineno);
	return REPETICAO;
}
"em"		{
	fprintf(file1, "for");
	fprintf(file2, "%d em \t\t-> REPETICAO\n", yylineno);
	return REPETICAO;
}
"=="		{
	fprintf(file1, "==");
	fprintf(file2, "%d == \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
">="		{
	fprintf(file1, ">=");
	fprintf(file2, "%d >= \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
"<="		{
	fprintf(file1, "<=");
	fprintf(file2, "%d = \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
">"			{
	fprintf(file1, ">");
	fprintf(file2, "%d > \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
"<"			{
	fprintf(file1, "<");
	fprintf(file2, "%d < \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
"!="		{
	fprintf(file1, "!=");
	fprintf(file2, "%d != \t\t-> RELACIONAL\n", yylineno);
	return RELACIONAL;
}
"&"			{
	fprintf(file1, "&&");
	fprintf(file2, "%d & \t\t-> LOGIC\n", yylineno);
	return LOGIC;
}
"|"			{
	fprintf(file1, "||");
	fprintf(file2, "%d || \t\t-> LOGIC\n", yylineno);
	return LOGIC;
}
"~"			{
	fprintf(file1, "!");
	fprintf(file2, "%d ~ \t\t-> LOGIC\n", yylineno);
	return LOGIC;
}
"+"			{
	fprintf(file1, "+");
	fprintf(file2, "%d + \t\t-> OP\n", yylineno);
	return SOMA;
}
"-"			{
	fprintf(file1, "-");
	fprintf(file2, "%d - \t\t-> OP\n", yylineno);
	return SUB;
}
"*"			{
	fprintf(file1, "*");
	fprintf(file2, "%d * \t\t-> OP\n", yylineno);
	return MULT;
}
"\""			{
	fprintf(file1, "\"");
	fprintf(file2, "%d aspas \t\t-> ASPAS\n", yylineno);
	return ASPAS;
}
"/"			{
	fprintf(file1, "/");
	fprintf(file2, "%d / \t\t-> OP\n", yylineno);
	return DIV;
}
"%"			{
	fprintf(file1, "%");
	fprintf(file2, "%d % \t\t-> OP\n", yylineno);
	return MOD;
}
","			{
	fprintf(file1, ",");
	fprintf(file2, "%d , \t\t-> SEPARADOR\n", yylineno);
	return SEPARADOR;
}
";"			{
	fprintf(file1, ";\n");
	fprintf(file2, "%d ; \t\t-> PONTOVIRGULA\n", yylineno);
	return PONTOVIRGULA;
}
"("			{
	fprintf(file1, "(");
	fprintf(file2, "%d ( \t\t-> ABREPARENTESES\n", yylineno);
	return ABREPARENTESES;
}
")"			{
	fprintf(file1, ")");
	fprintf(file2, "%d ) \t\t-> FECHAPARENTESES\n", yylineno);
	return FECHAPARENTESES;
}
"{"			{
	fprintf(file1, "{\n");
	fprintf(file2, "%d { \t\t-> BLOCOINICIO\n", yylineno);
	return BLOCOINICIO;
}
"}"			{
	fprintf(file1, "\n}\n");
	fprintf(file2, "%d } \t\t-> BLOCOFIM\n", yylineno);
	return BLOCOFIM;
}
{real}		{
	fprintf(file1, "%s",yytext);
	fprintf(file2, "%d real \t\t-> REAL\n", yylineno);
	return REAL;
}
{inteiro}	{
	fprintf(file1, "%s",yytext);
	fprintf(file2, "%d inteiro \t\t-> INTEIRO\n", yylineno);
	return INTEIRO;
}
{caracter}	{
	fprintf(file1, "%s",yytext);
	fprintf(file2, "%d caracter \t\t-> CARACTER\n", yylineno);
	return CARACTER;
}
{variavel}	{
	fprintf(file1, "%s", yytext);
	fprintf(file2, "%d variavel \t\t-> VARIAVEL\n", yylineno);
	return VARIAVEL;
}
.			{return yytext[0];}
%%


int main(int argc, char const *argv[]) {
	file1 = fopen("file1.txt", "w");
	file2 = fopen("file2.txt", "w");

	yyin = fopen(argv[1], "r");
 	yyparse();
	yylex();
  	
	  //fclose(yyin);
	//fclose(file1);
	//fclose(file2);
  	return 0;
}
