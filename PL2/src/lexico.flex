/*
Adrián López Pérez 100039110
Daniel Conde García 100044404

Nombre: lexico.flex
Para crear: 
> jflex lexico.flex
> javac Lexer.java

*/
import JFlex.sym;
import java_cup.runtime.*;

/* Nombre de la clase*/
%%
%class Lexer

/* 
 * El número de línea se accede con la variable yyline
 * El número de la columna se accede con la variable yycolumn 
 * Compatibilidad con el cup
 */
%line
%column
%cup

/* Declaración de funciones que se utilizarán */
%{   
    /* Para crear un nuevo java_cup.runtime.Symbol con información del token sin valor. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Para crear un nuevo java_cup.runtime.Symbol con información del token con valor. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

   public static void main(String[] args){
        Lexer analizadorLexico = new Lexer(new java.io.InputStreamReader(System.in));
        try {
			Symbol s = analizadorLexico.next_token();
			Symbol eof = new Symbol(sym.EOF);
			while (s != null && s.equals(eof))
				analizadorLexico.next_token();
		} catch (java.io.IOException x) {
			System.out.println("Error en la línea " + analizadorLexico.yyline
					+ " columna " + analizadorLexico.yycolumn);
		}
   }

%}
%%

/* Reglas léxicas de YYINITIAL*/
<YYINITIAL> {

/*Comentarios y espacios {se ignoran}*/
[\ \t\b\f\r\n]+		{ /* Se borran los espacios  */}
"/*" [^*] ~"*/"		{ System.out.println("comentario: "+ yytext()); /* Lineas de comentarios */}
"/*" "*"+ "/"		{ System.out.println("comentario: "+ yytext()); /* Lineas de comentarios */}
"//"[^\n]*		{ System.out.println("comentario: "+ yytext()); /* Linea de comentarios */}

/*Palabras reservadas*/
"int"			{ System.out.println("int"); /**/ System.out.println("/*/ return symbol(sym.INT, 0/**/ "/**/);}
"float"			{ System.out.println("float"); /**/ System.out.println("/*/ return symbol(sym.FLOAT, 0.0f/**/ "/**/);}
"char"			{ System.out.println("char"); /**/ System.out.println("/*/ return symbol(sym.CHAR, 0/**/ "/**/);}
"void"			{ System.out.println("void"); /**/ System.out.println("/*/ return symbol(sym.VOID/**/ "/**/);}
"if"			{ System.out.println("if"); /**/ System.out.println("/*/ return symbol(sym.IF/**/ "/**/);}
"else"			{ System.out.println("else"); /**/ System.out.println("/*/ return symbol(sym.ELSE/**/ "/**/);}
"while"			{ System.out.println("while"); /**/ System.out.println("/*/ return symbol(sym.WHILE/**/ "/**/);}
"return"		{ System.out.println("return"); /**/ System.out.println("/*/ return symbol(sym.RETURN/**/ "/**/);}
"printf"		{ System.out.println("printf"); /**/ System.out.println("/*/ return symbol(sym.PRINTF/**/ "/**/);}
"gets"			{ System.out.println("gets"); /**/ System.out.println("/*/ return symbol(sym.GETS/**/ "/**/);}

/* null literal */
"null"			{ /**/ System.out.println("/*/ return symbol(sym.NULL/**/ "/**/);}

/*Operadores*/
"!="			{ /**/ System.out.println("/*/ return symbol(sym.NOTEQ/**/ "/**/);}
"!"			{ /**/ System.out.println("/*/ return symbol(sym.NOT/**/ "/**/);}
"<="			{ /**/ System.out.println("/*/ return symbol(sym.LTEQ/**/ "/**/);}
"<"			{ /**/ System.out.println("/*/ return symbol(sym.LT/**/ "/**/);}
">="			{ /**/ System.out.println("/*/ return symbol(sym.GTEQ/**/ "/**/);}
">"			{ /**/ System.out.println("/*/ return symbol(sym.GT/**/ "/**/);}
"=="			{ /**/ System.out.println("/*/ return symbol(sym.EQEQ/**/ "/**/);}
"="			{ /**/ System.out.println("/*/ return symbol(sym.EQ/**/ "/**/);}
"&&"			{ /**/ System.out.println("/*/ return symbol(sym.ANDAND/**/ "/**/);}
"||"			{ /**/ System.out.println("/*/ return symbol(sym.OROR/**/ "/**/);}
"*="			{ /**/ System.out.println("/*/ return symbol(sym.MULTEQ/**/ "/**/);}
"*"			{ /**/ System.out.println("/*/ return symbol(sym.MULT/**/ "/**/);}
"/="			{ /**/ System.out.println("/*/ return symbol(sym.DIVEQ/**/ "/**/);}
"/"			{ /**/ System.out.println("/*/ return symbol(sym.DIV/**/ "/**/);}
"++"			{ /**/ System.out.println("/*/ return symbol(sym.PLUSPLUS/**/ "/**/);}
"+="			{ /**/ System.out.println("/*/ return symbol(sym.PLUSEQ/**/ "/**/);}
"+"			{ /**/ System.out.println("/*/ return symbol(sym.PLUS/**/ "/**/);}
"--"			{ /**/ System.out.println("/*/ return symbol(sym.MINUSMINUS/**/ "/**/);}
"-="			{ /**/ System.out.println("/*/ return symbol(sym.MINUSEQ/**/ "/**/);}
"-"			{ /**/ System.out.println("/*/ return symbol(sym.MINUS/**/ "/**/);}

/* Declaracion de numeros */
[0-9]+ \. [0-9]* [fF] 	{ System.out.println("numerof: "+ yytext()); /**/ System.out.println("/*/ return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1))/**/ "/**/);}
\. [0-9]+ [fF]		{ System.out.println("numerof: "+ yytext()); /**/ System.out.println("/*/ return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1))/**/ "/**/);}
[0-9][0-9]* 		{ System.out.println("numero: "+ yytext()); /**/ System.out.println("/*/ return symbol(sym.INTEGER, new Integer(yytext())/**/ "/**/);}

/* separators */
"("			{ /**/ System.out.println("/*/ return symbol(sym.LPAREN/**/ "/**/);}
")"			{ /**/ System.out.println("/*/ return symbol(sym.RPAREN/**/ "/**/);}
"{"			{ /**/ System.out.println("/*/ return symbol(sym.LBRACE/**/ "/**/);}
"}"			{ /**/ System.out.println("/*/ return symbol(sym.RBRACE/**/ "/**/);}
"["			{ /**/ System.out.println("/*/ return symbol(sym.LBRACK/**/ "/**/);}
"]"			{ /**/ System.out.println("/*/ return symbol(sym.RBRACK/**/ "/**/);}
";"			{ /**/ System.out.println("/*/ return symbol(sym.SEMICOLON/**/ "/**/);}
","			{ /**/ System.out.println("/*/ return symbol(sym.COMMA/**/ "/**/);}

/*Identicadores*/
[:jletter:][:jletterdigit:]*	{ /**/ System.out.println("/*/ return symbol(sym.ID, yytext()/**/ "/**/);}

/*caracteres y cadenas*/
\" [^\r\n\"\\]* \"	{ System.out.println("String: "+ yytext()); /**/ System.out.println("/*/ return symbol(sym.STRING, new String(yytext())/**/ "/**/);}
\' [^\r\n\'\\] \'	{ System.out.println("character: "+ yytext()); /**/ System.out.println("/*/ return symbol(sym.CHARACTER, new Character(yytext().charAt(0))/**/ "/**/);}

}
