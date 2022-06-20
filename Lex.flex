package Codigo;
import java_cup.runtime.*;
import static Codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
abstract | else| import |	show |
as 	|enum	|in	|static |
assert	|export |	interface |	super|
async |	extends|	is|	  switch|
await |	extension |	late |	sync |
break	|external |	library |	this|
case	|factory |	mixin |	throw|
catch|	false|	new|	true|
class|	final|	null|	try|
const|	finally|	on |	typedef |
continue|	for|	operator |	var|
covariant |	Function |	part |	void|
default|	get| 	required |	while|
deferred |	hide |	rethrow|	with|
do|	if|	return|	yield |
dynamic|	implements |	set | as |
while {lexeme=yytext(); return Palabra_reservada;}

{espacio} {/*Ignore*/}
"//" {return Comentario;}
"=" {return Igual;}
"==" {return Es_Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
";" {return Punto_y_coma;}
"{" {return Llaves;}
"}" {return Llaves;}
\" {return Comillas;}
\".*\" {return Cadena;}
"(" {return Parentesis;}
")" {return Parentesis;}
"." {return Punto;}
":" {return Dos_Puntos;}
">" {return Mayor_que;}
"<" {return Menor_que;}
">=" {return Mayor_igual_que;}
"<=" {return Menor_igual_que;}
"?" {return Operador;}
"%" {return Modulo;}
"!=" {return No_es_igual;}
"!expr" {return Invierte;}
"||" {return Or_logico;}
"&&" {return And_logico;}
"[" {return Corchete_lista_inicio;}
"]" {return Corchete_lista_final;}
"'" {return Comilla_simple_Cadena;}
\"\" {return Contra_Slash;}


{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}