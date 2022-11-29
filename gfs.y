%{
#include<bits/stdc++.h>

using namespace std;
extern int yylex(void);
extern int yyparse(void);
extern void yyerror(const char *);


%}

%token INTEIRO
%token REAL
%token CARACTER
%token VARIAVEL
%token ATRIBUICAO
%token ENTRADA
%token SAIDA
%token COND
%token DESCOND
%token RELACIONAL
%token LOGIC
%token REPETICAO
%token PONTOVIRGULA
%token ABREPARENTESES
%token FECHAPARENTESES
%token BLOCOINICIO
%token BLOCOFIM
%token TIPOINTEIRO
%token TIPOREAL
%token TIPOCARACTER
%token INICIO
%token FIM 
%token SOMA 
%token SUB 
%token DIV 
%token MULT 
%token MOD 
%token SEPARADOR 
%token ASPAS
%token QUEBRA

%%

inicio:     INICIO start FIM
            | INICIO FIM 
;
start:      result 
            | inout 
            | nvar 
            | atrib 
            | rela 
            | condicional 
            | repet 
            | descondicional 
            | logico 
;
result: 	exp PONTOVIRGULA start 
            | exp PONTOVIRGULA 
;
exp: 	    ABREPARENTESES exp FECHAPARENTESES
            | exp op exp
            | INTEIRO
            | REAL
            | VARIAVEL
;
op: 	    SOMA 
            | SUB 
            | MULT 
            | DIV 
            | MOD 
;
nvar:    	reservada VARIAVEL PONTOVIRGULA 
            |reservada VARIAVEL PONTOVIRGULA start
;
reservada:  TIPOINTEIRO
            |TIPOREAL
            |TIPOCARACTER
;
info: 	    ASPAS CARACTER ASPAS
            | ASPAS CARACTER ASPAS SOMA info 
            | INTEIRO 
            | INTEIRO SOMA info 
            | REAL 
            | REAL SOMA info
            | VARIAVEL
            | VARIAVEL SOMA info
;
atrib:  	VARIAVEL ATRIBUICAO info PONTOVIRGULA 
            | VARIAVEL ATRIBUICAO info PONTOVIRGULA start
            | reservada VARIAVEL ATRIBUICAO info PONTOVIRGULA
            | reservada VARIAVEL ATRIBUICAO info PONTOVIRGULA start
;
out:         SAIDA ABREPARENTESES info FECHAPARENTESES PONTOVIRGULA 
            |SAIDA ABREPARENTESES info FECHAPARENTESES QUEBRA PONTOVIRGULA 
;
in:          ENTRADA ABREPARENTESES VARIAVEL FECHAPARENTESES PONTOVIRGULA 
;
inout:     	in start 
            | in 
            | out start 
            | out 
;
rela: 	    VARIAVEL RELACIONAL VARIAVEL 
            | VARIAVEL RELACIONAL VARIAVEL start 
            | INTEIRO RELACIONAL VARIAVEL 
            | REAL RELACIONAL VARIAVEL 
            | ASPAS CARACTER ASPAS RELACIONAL VARIAVEL 
            | INTEIRO RELACIONAL VARIAVEL start 
            | REAL RELACIONAL VARIAVEL start 
            | ASPAS CARACTER ASPAS RELACIONAL VARIAVEL start 
            | VARIAVEL RELACIONAL INTEIRO 
            | VARIAVEL RELACIONAL REAL 
            | VARIAVEL RELACIONAL ASPAS CARACTER ASPAS 
            | VARIAVEL RELACIONAL INTEIRO start 
            | VARIAVEL RELACIONAL REAL start 
            | VARIAVEL RELACIONAL ASPAS CARACTER ASPAS start
;
condicional:    COND ABREPARENTESES rela FECHAPARENTESES BLOCOINICIO start BLOCOFIM start 
                | COND ABREPARENTESES rela FECHAPARENTESES BLOCOINICIO start BLOCOFIM 
                | COND ABREPARENTESES LOGIC FECHAPARENTESES BLOCOINICIO start BLOCOFIM 
                | COND ABREPARENTESES LOGIC FECHAPARENTESES BLOCOINICIO start BLOCOFIM start 
;
descondicional: DESCOND BLOCOINICIO start BLOCOFIM 
                | DESCOND BLOCOINICIO start BLOCOFIM start 
                | DESCOND condicional 
;
repet:   	REPETICAO ABREPARENTESES rela FECHAPARENTESES BLOCOINICIO start BLOCOFIM start 
            | REPETICAO ABREPARENTESES rela FECHAPARENTESES BLOCOINICIO start BLOCOFIM  
;
logico:   	INTEIRO LOGIC INTEIRO 
            | INTEIRO LOGIC INTEIRO start 
            | REAL LOGIC REAL 
            | REAL LOGIC REAL start 
            | INTEIRO LOGIC VARIAVEL 
            | INTEIRO LOGIC VARIAVEL start 
            | REAL LOGIC VARIAVEL 
            | REAL LOGIC VARIAVEL start 
            | VARIAVEL LOGIC INTEIRO 
            | VARIAVEL LOGIC INTEIRO start 
            | VARIAVEL LOGIC REAL 
            | VARIAVEL LOGIC REAL start 
            | VARIAVEL LOGIC VARIAVEL start 
            | VARIAVEL LOGIC VARIAVEL
;
%%
void yyerror(const char * s)
{
	/* variáveis definidas no analisador léxico */
	extern int yylineno;    
	extern char * yytext;   
	/* mensagem de erro exibe o símbolo que causou erro e o número da linha */
    cout << "Erro (" << s << "): simbolo \"" << yytext << "\" (linha " << yylineno << ")\n";
}