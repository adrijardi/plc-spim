/*
Adrián López Pérez 100039110
Daniel Conde García 100044404

Nombre: lexico.flex
Para crear: 
> jflex lexico.flex
> javac Lexer.java

*/
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
"int"			{ System.out.println("int"); return symbol(sym.INT, 0);}
"float"			{ System.out.println("float"); return symbol(sym.FLOAT, 0.0f);}
"char"			{ System.out.println("char"); return symbol(sym.CHAR, 0);}
"void"			{ System.out.println("void"); return symbol(sym.VOID);}
"if"			{ System.out.println("if"); return symbol(sym.IF);}
"else"			{ System.out.println("else"); return symbol(sym.ELSE);}
"while"			{ System.out.println("while"); return symbol(sym.WHILE);}
"return"		{ System.out.println("return"); return symbol(sym.RETURN);}
"printf"		{ System.out.println("printf"); return symbol(sym.PRINTF);}
"gets"			{ System.out.println("gets"); return symbol(sym.GETS);}

/* null literal */
//"null"			{ return symbol(sym.NULL);}

/*Operadores*/
"!="			{ return symbol(sym.NOTEQ);}
"!"			{ return symbol(sym.NOT);}
"<="			{ return symbol(sym.LTEQ);}
"<"			{ return symbol(sym.LT);}
">="			{ return symbol(sym.GTEQ);}
">"			{ return symbol(sym.GT);}
"=="			{ return symbol(sym.EQEQ);}
"="			{ return symbol(sym.EQ);}
"&&"			{ return symbol(sym.ANDAND);}
"||"			{ return symbol(sym.OROR);}
"*="			{ return symbol(sym.MULTEQ);}
"*"			{ return symbol(sym.MULT);}
"/="			{ return symbol(sym.DIVEQ);}
"/"			{ return symbol(sym.DIV);}
"++"			{ return symbol(sym.PLUSPLUS);}
"+="			{ return symbol(sym.PLUSEQ);}
"+"			{ return symbol(sym.PLUS);}
"--"			{ return symbol(sym.MINUSMINUS);}
"-="			{ return symbol(sym.MINUSEQ);}
"-"			{ return symbol(sym.MINUS);}

/* Declaracion de numeros */
[0-9]+ \. [0-9]* [fF] 	{ System.out.println("numerof: "+ yytext()); return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1)));}
\. [0-9]+ [fF]		{ System.out.println("numerof: "+ yytext()); return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1)));}
[0-9][0-9]* 		{ System.out.println("numero: "+ yytext()); return symbol(sym.INTEGER, new Integer(yytext()));}

/* separators */
"("			{ return symbol(sym.LPAREN);}
")"			{ return symbol(sym.RPAREN);}
"{"			{ return symbol(sym.LBRACE);}
"}"			{ return symbol(sym.RBRACE);}
"["			{ return symbol(sym.LBRACK);}
"]"			{ return symbol(sym.RBRACK);}
";"			{ return symbol(sym.SEMICOLON);}
","			{ return symbol(sym.COMMA);}

/*Identicadores*/
[:jletter:][:jletterdigit:]*	{ return symbol(sym.ID, yytext());}

/*caracteres y cadenas*/
\" [^\r\n\"\\]* \"	{ System.out.println("String: "+ yytext()); return symbol(sym.STRING, new String(yytext()));}
\' [^\r\n\'\\] \'	{ System.out.println("character: "+ yytext()); return symbol(sym.CHARACTER, new Character(yytext().charAt(0)));}

}
