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
    
    public int getLine() {
        return yyline;
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
"/*" [^*] ~"*/"		{ System.out.println(">>comentario: "+ yytext()); /* Lineas de comentarios */}
"/*" "*"+ "/"		{ System.out.println(">>comentario: "+ yytext()); /* Lineas de comentarios */}
"//"[^\n]*			{ System.out.println(">>comentario: "+ yytext()); /* Linea de comentarios */}

/*Palabras reservadas*/
"int"			{ System.out.println(">>int"); return symbol(sym.INT, 0);}
"float"			{ System.out.println(">>float"); return symbol(sym.FLOAT, 0.0f);}
"char"			{ System.out.println(">>char"); return symbol(sym.CHAR, '0');}
"void"			{ System.out.println(">>void"); return symbol(sym.VOID);}
"if"			{ System.out.println(">>if"); return symbol(sym.IF);}
"else"			{ System.out.println(">>else"); return symbol(sym.ELSE);}
"while"			{ System.out.println(">>while"); return symbol(sym.WHILE);}
"return"		{ System.out.println(">>return"); return symbol(sym.RETURN);}
"printf"		{ System.out.println(">>printf"); return symbol(sym.PRINTF);}
"gets"			{ System.out.println(">>gets"); return symbol(sym.GETS);}


/*Operadores*/
"!="			{ System.out.println(">>NOTEQ"); return symbol(sym.NOTEQ);}
"!"				{ System.out.println(">>NOT"); return symbol(sym.NOT);}
"<="			{ System.out.println(">>LTEQ"); return symbol(sym.LTEQ);}
"<"				{ System.out.println(">>LT"); return symbol(sym.LT);}
">="			{ System.out.println(">>GTEQ"); return symbol(sym.GTEQ);}
">"				{ System.out.println(">>GT"); return symbol(sym.GT);}
"=="			{ System.out.println(">>EQEQ"); return symbol(sym.EQEQ);}
"="				{ System.out.println(">>EQ"); return symbol(sym.EQ);}
"&&"			{ System.out.println(">>ANDAND"); return symbol(sym.ANDAND);}
"||"			{ System.out.println(">>OROR"); return symbol(sym.OROR);}
"*="			{ System.out.println(">>MULTEQ"); return symbol(sym.MULTEQ);}
"*"				{ System.out.println(">>MULT"); return symbol(sym.MULT);}
"/="			{ System.out.println(">>DIVEQ"); return symbol(sym.DIVEQ);}
"/"				{ System.out.println(">>DIV"); return symbol(sym.DIV);}
"++"			{ System.out.println(">>PLUSPLUS"); return symbol(sym.PLUSPLUS);}
"+="			{ System.out.println(">>PLUSEQ"); return symbol(sym.PLUSEQ);}
"+"				{ System.out.println(">>PLUS"); return symbol(sym.PLUS);}
"--"			{ System.out.println(">>MINUSMINUS"); return symbol(sym.MINUSMINUS);}
"-="			{ System.out.println(">>MINUSEQ"); return symbol(sym.MINUSEQ);}
"-"				{ System.out.println(">>MINUS"); return symbol(sym.MINUS);}

/* Declaracion de numeros */
[0-9]+ \. [0-9]* [fF] 	{ System.out.println(">>numerof: "+ yytext()); return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1)));}
\. [0-9]+ [fF]			{ System.out.println(">>numerof: "+ yytext()); return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1)));}
[0-9][0-9]* 			{ System.out.println(">>numero: "+ yytext()); return symbol(sym.INTEGER, new Integer(yytext()));}

/* separators */
"("			{ System.out.println(">>LPAREN"); return symbol(sym.LPAREN);}
")"			{ System.out.println(">>RPAREN"); return symbol(sym.RPAREN);}
"{"			{ System.out.println(">>LBRACE"); return symbol(sym.LBRACE);}
"}"			{ System.out.println(">>RBRACE"); return symbol(sym.RBRACE);}
"["			{ System.out.println(">>LBRACK"); return symbol(sym.LBRACK);}
"]"			{ System.out.println(">>RBRACK"); return symbol(sym.RBRACK);}
";"			{ System.out.println(">>SEMICOLON"); return symbol(sym.SEMICOLON);}
","			{ System.out.println(">>COMMA"); return symbol(sym.COMMA);}

/*Identicadores*/
[:jletter:][:jletterdigit:]*	{ System.out.println(">>ID"); return symbol(sym.ID, yytext());}

/*caracteres y cadenas*/
\" [^\r\n\"\\]* \"	{ System.out.println(">>String: "+ yytext()); return symbol(sym.STRING, new String(yytext()));}
\' [^\r\n\'\\] \'	{ System.out.println(">>character: "+ yytext()); return symbol(sym.CHARACTER, new Character(yytext().charAt(0)));}

. {System.out.println("ERROR LEXICO");}

}
