/* The following code was generated by JFlex 1.4.3 on 24/04/09 23:51 */

/*
Adri�n L�pez P�rez 100039110
Daniel Conde Garc�a 100044404

Nombre: lexico.flex
Para crear: 
> jflex lexico.flex
> javac Lexer.java

*/
import java_cup.runtime.*;

/* Nombre de la clase*/

/**
 * This class is a scanner generated by 
 * <a href="http://www.jflex.de/">JFlex</a> 1.4.3
 * on 24/04/09 23:51 from the specification file
 * <tt>lexico.flex</tt>
 */
class Lexer implements java_cup.runtime.Scanner {

  /** This character denotes the end of file */
  public static final int YYEOF = -1;

  /** initial size of the lookahead buffer */
  private static final int ZZ_BUFFERSIZE = 16384;

  /** lexical states */
  public static final int YYINITIAL = 0;

  /**
   * ZZ_LEXSTATE[l] is the state in the DFA for the lexical state l
   * ZZ_LEXSTATE[l+1] is the state in the DFA for the lexical state l
   *                  at the beginning of a line
   * l is of the form l = 2*k, k a non negative integer
   */
  private static final int ZZ_LEXSTATE[] = { 
     0, 0
  };

  /** 
   * Translates characters to character classes
   */
  private static final String ZZ_CMAP_PACKED = 
    "\10\54\1\55\1\1\1\3\1\0\2\1\16\54\4\0\1\1\1\30"+
    "\1\56\1\2\1\53\1\0\1\34\1\57\1\43\1\44\1\5\1\36"+
    "\1\52\1\37\1\41\1\4\12\40\1\0\1\51\1\32\1\31\1\33"+
    "\2\0\5\53\1\42\24\53\1\47\1\0\1\50\1\0\1\53\1\0"+
    "\1\14\1\53\1\15\1\21\1\22\1\11\1\27\1\16\1\6\2\53"+
    "\1\12\1\53\1\7\1\13\1\26\1\53\1\17\1\23\1\10\1\25"+
    "\1\20\1\24\3\53\1\45\1\35\1\46\1\0\41\54\2\0\4\53"+
    "\4\0\1\53\2\0\1\54\7\0\1\53\4\0\1\53\5\0\27\53"+
    "\1\0\37\53\1\0\u013f\53\31\0\162\53\4\0\14\53\16\0\5\53"+
    "\11\0\1\53\21\0\130\54\5\0\23\54\12\0\1\53\13\0\1\53"+
    "\1\0\3\53\1\0\1\53\1\0\24\53\1\0\54\53\1\0\46\53"+
    "\1\0\5\53\4\0\202\53\1\0\4\54\3\0\105\53\1\0\46\53"+
    "\2\0\2\53\6\0\20\53\41\0\46\53\2\0\1\53\7\0\47\53"+
    "\11\0\21\54\1\0\27\54\1\0\3\54\1\0\1\54\1\0\2\54"+
    "\1\0\1\54\13\0\33\53\5\0\3\53\15\0\4\54\14\0\6\54"+
    "\13\0\32\53\5\0\13\53\16\54\7\0\12\54\4\0\2\53\1\54"+
    "\143\53\1\0\1\53\10\54\1\0\6\54\2\53\2\54\1\0\4\54"+
    "\2\53\12\54\3\53\2\0\1\53\17\0\1\54\1\53\1\54\36\53"+
    "\33\54\2\0\3\53\60\0\46\53\13\54\1\53\u014f\0\3\54\66\53"+
    "\2\0\1\54\1\53\20\54\2\0\1\53\4\54\3\0\12\53\2\54"+
    "\2\0\12\54\21\0\3\54\1\0\10\53\2\0\2\53\2\0\26\53"+
    "\1\0\7\53\1\0\1\53\3\0\4\53\2\0\1\54\1\53\7\54"+
    "\2\0\2\54\2\0\3\54\11\0\1\54\4\0\2\53\1\0\3\53"+
    "\2\54\2\0\12\54\4\53\15\0\3\54\1\0\6\53\4\0\2\53"+
    "\2\0\26\53\1\0\7\53\1\0\2\53\1\0\2\53\1\0\2\53"+
    "\2\0\1\54\1\0\5\54\4\0\2\54\2\0\3\54\13\0\4\53"+
    "\1\0\1\53\7\0\14\54\3\53\14\0\3\54\1\0\11\53\1\0"+
    "\3\53\1\0\26\53\1\0\7\53\1\0\2\53\1\0\5\53\2\0"+
    "\1\54\1\53\10\54\1\0\3\54\1\0\3\54\2\0\1\53\17\0"+
    "\2\53\2\54\2\0\12\54\1\0\1\53\17\0\3\54\1\0\10\53"+
    "\2\0\2\53\2\0\26\53\1\0\7\53\1\0\2\53\1\0\5\53"+
    "\2\0\1\54\1\53\6\54\3\0\2\54\2\0\3\54\10\0\2\54"+
    "\4\0\2\53\1\0\3\53\4\0\12\54\1\0\1\53\20\0\1\54"+
    "\1\53\1\0\6\53\3\0\3\53\1\0\4\53\3\0\2\53\1\0"+
    "\1\53\1\0\2\53\3\0\2\53\3\0\3\53\3\0\10\53\1\0"+
    "\3\53\4\0\5\54\3\0\3\54\1\0\4\54\11\0\1\54\17\0"+
    "\11\54\11\0\1\53\7\0\3\54\1\0\10\53\1\0\3\53\1\0"+
    "\27\53\1\0\12\53\1\0\5\53\4\0\7\54\1\0\3\54\1\0"+
    "\4\54\7\0\2\54\11\0\2\53\4\0\12\54\22\0\2\54\1\0"+
    "\10\53\1\0\3\53\1\0\27\53\1\0\12\53\1\0\5\53\2\0"+
    "\1\54\1\53\7\54\1\0\3\54\1\0\4\54\7\0\2\54\7\0"+
    "\1\53\1\0\2\53\4\0\12\54\22\0\2\54\1\0\10\53\1\0"+
    "\3\53\1\0\27\53\1\0\20\53\4\0\6\54\2\0\3\54\1\0"+
    "\4\54\11\0\1\54\10\0\2\53\4\0\12\54\22\0\2\54\1\0"+
    "\22\53\3\0\30\53\1\0\11\53\1\0\1\53\2\0\7\53\3\0"+
    "\1\54\4\0\6\54\1\0\1\54\1\0\10\54\22\0\2\54\15\0"+
    "\60\53\1\54\2\53\7\54\4\0\10\53\10\54\1\0\12\54\47\0"+
    "\2\53\1\0\1\53\2\0\2\53\1\0\1\53\2\0\1\53\6\0"+
    "\4\53\1\0\7\53\1\0\3\53\1\0\1\53\1\0\1\53\2\0"+
    "\2\53\1\0\4\53\1\54\2\53\6\54\1\0\2\54\1\53\2\0"+
    "\5\53\1\0\1\53\1\0\6\54\2\0\12\54\2\0\2\53\42\0"+
    "\1\53\27\0\2\54\6\0\12\54\13\0\1\54\1\0\1\54\1\0"+
    "\1\54\4\0\2\54\10\53\1\0\42\53\6\0\24\54\1\0\2\54"+
    "\4\53\4\0\10\54\1\0\44\54\11\0\1\54\71\0\42\53\1\0"+
    "\5\53\1\0\2\53\1\0\7\54\3\0\4\54\6\0\12\54\6\0"+
    "\6\53\4\54\106\0\46\53\12\0\51\53\7\0\132\53\5\0\104\53"+
    "\5\0\122\53\6\0\7\53\1\0\77\53\1\0\1\53\1\0\4\53"+
    "\2\0\7\53\1\0\1\53\1\0\4\53\2\0\47\53\1\0\1\53"+
    "\1\0\4\53\2\0\37\53\1\0\1\53\1\0\4\53\2\0\7\53"+
    "\1\0\1\53\1\0\4\53\2\0\7\53\1\0\7\53\1\0\27\53"+
    "\1\0\37\53\1\0\1\53\1\0\4\53\2\0\7\53\1\0\47\53"+
    "\1\0\23\53\16\0\11\54\56\0\125\53\14\0\u026c\53\2\0\10\53"+
    "\12\0\32\53\5\0\113\53\3\0\3\53\17\0\15\53\1\0\4\53"+
    "\3\54\13\0\22\53\3\54\13\0\22\53\2\54\14\0\15\53\1\0"+
    "\3\53\1\0\2\54\14\0\64\53\40\54\3\0\1\53\3\0\2\53"+
    "\1\54\2\0\12\54\41\0\3\54\2\0\12\54\6\0\130\53\10\0"+
    "\51\53\1\54\126\0\35\53\3\0\14\54\4\0\14\54\12\0\12\54"+
    "\36\53\2\0\5\53\u038b\0\154\53\224\0\234\53\4\0\132\53\6\0"+
    "\26\53\2\0\6\53\2\0\46\53\2\0\6\53\2\0\10\53\1\0"+
    "\1\53\1\0\1\53\1\0\1\53\1\0\37\53\2\0\65\53\1\0"+
    "\7\53\1\0\1\53\3\0\3\53\1\0\7\53\3\0\4\53\2\0"+
    "\6\53\4\0\15\53\5\0\3\53\1\0\7\53\17\0\4\54\32\0"+
    "\5\54\20\0\2\53\23\0\1\53\13\0\4\54\6\0\6\54\1\0"+
    "\1\53\15\0\1\53\40\0\22\53\36\0\15\54\4\0\1\54\3\0"+
    "\6\54\27\0\1\53\4\0\1\53\2\0\12\53\1\0\1\53\3\0"+
    "\5\53\6\0\1\53\1\0\1\53\1\0\1\53\1\0\4\53\1\0"+
    "\3\53\1\0\7\53\3\0\3\53\5\0\5\53\26\0\44\53\u0e81\0"+
    "\3\53\31\0\11\53\6\54\1\0\5\53\2\0\5\53\4\0\126\53"+
    "\2\0\2\54\2\0\3\53\1\0\137\53\5\0\50\53\4\0\136\53"+
    "\21\0\30\53\70\0\20\53\u0200\0\u19b6\53\112\0\u51a6\53\132\0\u048d\53"+
    "\u0773\0\u2ba4\53\u215c\0\u012e\53\2\0\73\53\225\0\7\53\14\0\5\53"+
    "\5\0\1\53\1\54\12\53\1\0\15\53\1\0\5\53\1\0\1\53"+
    "\1\0\2\53\1\0\2\53\1\0\154\53\41\0\u016b\53\22\0\100\53"+
    "\2\0\66\53\50\0\15\53\3\0\20\54\20\0\4\54\17\0\2\53"+
    "\30\0\3\53\31\0\1\53\6\0\5\53\1\0\207\53\2\0\1\54"+
    "\4\0\1\53\13\0\12\54\7\0\32\53\4\0\1\53\1\0\32\53"+
    "\12\0\132\53\3\0\6\53\2\0\6\53\2\0\6\53\2\0\3\53"+
    "\3\0\2\53\3\0\2\53\22\0\3\54\4\0";

  /** 
   * Translates characters to character classes
   */
  private static final char [] ZZ_CMAP = zzUnpackCMap(ZZ_CMAP_PACKED);

  /** 
   * Translates DFA states to action switch labels.
   */
  private static final int [] ZZ_ACTION = zzUnpackAction();

  private static final String ZZ_ACTION_PACKED_0 =
    "\1\0\1\1\1\2\1\3\1\4\1\5\12\6\1\7"+
    "\1\10\1\11\1\12\2\1\1\13\1\14\1\15\1\1"+
    "\1\16\1\17\1\20\1\21\1\22\1\23\1\24\1\25"+
    "\2\1\1\26\1\0\1\27\1\30\1\6\1\31\10\6"+
    "\1\32\1\33\1\34\1\35\1\36\1\37\1\40\1\41"+
    "\1\42\1\43\2\0\1\44\3\0\1\45\10\6\1\46"+
    "\1\47\1\0\1\50\1\6\1\51\1\6\1\52\1\53"+
    "\2\6\1\54\1\55\1\6\1\56\1\6\1\57\1\60";

  private static int [] zzUnpackAction() {
    int [] result = new int[93];
    int offset = 0;
    offset = zzUnpackAction(ZZ_ACTION_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAction(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /** 
   * Translates a state to a row index in the transition table
   */
  private static final int [] ZZ_ROWMAP = zzUnpackRowMap();

  private static final String ZZ_ROWMAP_PACKED_0 =
    "\0\0\0\60\0\140\0\220\0\300\0\360\0\u0120\0\u0150"+
    "\0\u0180\0\u01b0\0\u01e0\0\u0210\0\u0240\0\u0270\0\u02a0\0\u02d0"+
    "\0\u0300\0\u0330\0\u0360\0\u0390\0\u03c0\0\u03f0\0\u0420\0\u0450"+
    "\0\u0480\0\u04b0\0\60\0\60\0\60\0\60\0\60\0\60"+
    "\0\60\0\60\0\u04e0\0\u0510\0\u0540\0\u0570\0\60\0\60"+
    "\0\u05a0\0\u0150\0\u05d0\0\u0600\0\u0630\0\u0660\0\u0690\0\u06c0"+
    "\0\u06f0\0\u0720\0\60\0\60\0\60\0\60\0\60\0\60"+
    "\0\60\0\60\0\60\0\60\0\u0750\0\u04e0\0\60\0\u0780"+
    "\0\u07b0\0\u07e0\0\u0150\0\u0810\0\u0840\0\u0870\0\u08a0\0\u08d0"+
    "\0\u0900\0\u0930\0\u0960\0\60\0\60\0\u0990\0\60\0\u09c0"+
    "\0\u0150\0\u09f0\0\u0150\0\u0150\0\u0a20\0\u0a50\0\u0150\0\u0150"+
    "\0\u0a80\0\u0150\0\u0ab0\0\u0150\0\u0150";

  private static int [] zzUnpackRowMap() {
    int [] result = new int[93];
    int offset = 0;
    offset = zzUnpackRowMap(ZZ_ROWMAP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackRowMap(String packed, int offset, int [] result) {
    int i = 0;  /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int high = packed.charAt(i++) << 16;
      result[j++] = high | packed.charAt(i++);
    }
    return j;
  }

  /** 
   * The transition table of the DFA
   */
  private static final int [] ZZ_TRANS = zzUnpackTrans();

  private static final String ZZ_TRANS_PACKED_0 =
    "\1\2\1\3\1\4\1\3\1\5\1\6\1\7\2\10"+
    "\1\11\3\10\1\12\1\10\1\13\1\14\1\10\1\15"+
    "\1\10\1\16\1\10\1\17\1\20\1\21\1\22\1\23"+
    "\1\24\1\25\1\26\1\27\1\30\1\31\1\32\1\10"+
    "\1\33\1\34\1\35\1\36\1\37\1\40\1\41\1\42"+
    "\1\10\1\2\1\3\1\43\1\44\61\0\1\3\1\0"+
    "\1\3\51\0\1\3\2\0\3\4\1\0\54\4\4\0"+
    "\1\45\1\46\23\0\1\47\57\0\1\50\34\0\1\10"+
    "\1\51\1\10\1\52\16\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\22\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\4\10\1\53\15\10\10\0\1\10"+
    "\1\0\1\10\10\0\3\10\10\0\10\10\1\54\11\10"+
    "\10\0\1\10\1\0\1\10\10\0\3\10\10\0\14\10"+
    "\1\55\5\10\10\0\1\10\1\0\1\10\10\0\3\10"+
    "\10\0\5\10\1\56\14\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\4\10\1\57\15\10\10\0\1\10"+
    "\1\0\1\10\10\0\3\10\10\0\10\10\1\60\11\10"+
    "\10\0\1\10\1\0\1\10\10\0\3\10\10\0\11\10"+
    "\1\61\10\10\10\0\1\10\1\0\1\10\10\0\3\10"+
    "\10\0\14\10\1\62\5\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\33\0\1\63\57\0\1\64\57\0\1\65"+
    "\57\0\1\66\62\0\1\67\60\0\1\70\53\0\1\71"+
    "\4\0\1\72\52\0\1\73\5\0\1\74\60\0\1\31"+
    "\1\75\56\0\1\75\17\0\56\76\1\77\1\76\57\100"+
    "\1\0\3\45\1\0\54\45\5\101\1\102\52\101\6\0"+
    "\2\10\1\103\17\10\10\0\1\10\1\0\1\10\10\0"+
    "\3\10\10\0\5\10\1\104\14\10\10\0\1\10\1\0"+
    "\1\10\10\0\3\10\10\0\6\10\1\105\13\10\10\0"+
    "\1\10\1\0\1\10\10\0\3\10\10\0\2\10\1\106"+
    "\17\10\10\0\1\10\1\0\1\10\10\0\3\10\10\0"+
    "\1\107\21\10\10\0\1\10\1\0\1\10\10\0\3\10"+
    "\10\0\15\10\1\110\4\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\1\111\21\10\10\0\1\10\1\0"+
    "\1\10\10\0\3\10\10\0\1\112\21\10\10\0\1\10"+
    "\1\0\1\10\10\0\3\10\10\0\2\10\1\113\17\10"+
    "\10\0\1\10\1\0\1\10\10\0\3\10\13\0\1\114"+
    "\26\0\1\75\1\0\1\114\74\0\1\115\5\101\1\116"+
    "\52\101\4\0\1\117\1\102\60\0\6\10\1\120\13\10"+
    "\10\0\1\10\1\0\1\10\10\0\3\10\10\0\11\10"+
    "\1\121\10\10\10\0\1\10\1\0\1\10\10\0\3\10"+
    "\10\0\17\10\1\122\2\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\13\10\1\123\6\10\10\0\1\10"+
    "\1\0\1\10\10\0\3\10\10\0\14\10\1\124\5\10"+
    "\10\0\1\10\1\0\1\10\10\0\3\10\10\0\4\10"+
    "\1\125\15\10\10\0\1\10\1\0\1\10\10\0\3\10"+
    "\10\0\1\10\1\126\20\10\10\0\1\10\1\0\1\10"+
    "\10\0\3\10\10\0\15\10\1\127\4\10\10\0\1\10"+
    "\1\0\1\10\10\0\3\10\2\0\4\101\1\117\1\116"+
    "\52\101\6\0\2\10\1\130\17\10\10\0\1\10\1\0"+
    "\1\10\10\0\3\10\10\0\11\10\1\131\10\10\10\0"+
    "\1\10\1\0\1\10\10\0\3\10\10\0\14\10\1\132"+
    "\5\10\10\0\1\10\1\0\1\10\10\0\3\10\10\0"+
    "\2\10\1\133\17\10\10\0\1\10\1\0\1\10\10\0"+
    "\3\10\10\0\1\10\1\134\20\10\10\0\1\10\1\0"+
    "\1\10\10\0\3\10\10\0\3\10\1\135\16\10\10\0"+
    "\1\10\1\0\1\10\10\0\3\10\2\0";

  private static int [] zzUnpackTrans() {
    int [] result = new int[2784];
    int offset = 0;
    offset = zzUnpackTrans(ZZ_TRANS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackTrans(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      value--;
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /* error codes */
  private static final int ZZ_UNKNOWN_ERROR = 0;
  private static final int ZZ_NO_MATCH = 1;
  private static final int ZZ_PUSHBACK_2BIG = 2;

  /* error messages for the codes above */
  private static final String ZZ_ERROR_MSG[] = {
    "Unkown internal scanner error",
    "Error: could not match input",
    "Error: pushback value was too large"
  };

  /**
   * ZZ_ATTRIBUTE[aState] contains the attributes of state <code>aState</code>
   */
  private static final int [] ZZ_ATTRIBUTE = zzUnpackAttribute();

  private static final String ZZ_ATTRIBUTE_PACKED_0 =
    "\1\0\1\11\30\1\10\11\3\1\1\0\2\11\12\1"+
    "\12\11\2\0\1\11\3\0\11\1\2\11\1\0\1\11"+
    "\16\1";

  private static int [] zzUnpackAttribute() {
    int [] result = new int[93];
    int offset = 0;
    offset = zzUnpackAttribute(ZZ_ATTRIBUTE_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAttribute(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /** the input device */
  private java.io.Reader zzReader;

  /** the current state of the DFA */
  private int zzState;

  /** the current lexical state */
  private int zzLexicalState = YYINITIAL;

  /** this buffer contains the current text to be matched and is
      the source of the yytext() string */
  private char zzBuffer[] = new char[ZZ_BUFFERSIZE];

  /** the textposition at the last accepting state */
  private int zzMarkedPos;

  /** the current text position in the buffer */
  private int zzCurrentPos;

  /** startRead marks the beginning of the yytext() string in the buffer */
  private int zzStartRead;

  /** endRead marks the last character in the buffer, that has been read
      from input */
  private int zzEndRead;

  /** number of newlines encountered up to the start of the matched text */
  private int yyline;

  /** the number of characters up to the start of the matched text */
  private int yychar;

  /**
   * the number of characters from the last newline up to the start of the 
   * matched text
   */
  private int yycolumn;

  /** 
   * zzAtBOL == true <=> the scanner is currently at the beginning of a line
   */
  private boolean zzAtBOL = true;

  /** zzAtEOF == true <=> the scanner is at the EOF */
  private boolean zzAtEOF;

  /** denotes if the user-EOF-code has already been executed */
  private boolean zzEOFDone;

  /* user code: */
    /* Para crear un nuevo java_cup.runtime.Symbol con informaci�n del token sin valor. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Para crear un nuevo java_cup.runtime.Symbol con informaci�n del token con valor. */
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
			System.out.println("Error en la l�nea " + analizadorLexico.yyline
					+ " columna " + analizadorLexico.yycolumn);
		}
   }



  /**
   * Creates a new scanner
   * There is also a java.io.InputStream version of this constructor.
   *
   * @param   in  the java.io.Reader to read input from.
   */
  Lexer(java.io.Reader in) {
    this.zzReader = in;
  }

  /**
   * Creates a new scanner.
   * There is also java.io.Reader version of this constructor.
   *
   * @param   in  the java.io.Inputstream to read input from.
   */
  Lexer(java.io.InputStream in) {
    this(new java.io.InputStreamReader(in));
  }

  /** 
   * Unpacks the compressed character translation table.
   *
   * @param packed   the packed character translation table
   * @return         the unpacked character translation table
   */
  private static char [] zzUnpackCMap(String packed) {
    char [] map = new char[0x10000];
    int i = 0;  /* index in packed string  */
    int j = 0;  /* index in unpacked array */
    while (i < 1754) {
      int  count = packed.charAt(i++);
      char value = packed.charAt(i++);
      do map[j++] = value; while (--count > 0);
    }
    return map;
  }


  /**
   * Refills the input buffer.
   *
   * @return      <code>false</code>, iff there was new input.
   * 
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  private boolean zzRefill() throws java.io.IOException {

    /* first: make room (if you can) */
    if (zzStartRead > 0) {
      System.arraycopy(zzBuffer, zzStartRead,
                       zzBuffer, 0,
                       zzEndRead-zzStartRead);

      /* translate stored positions */
      zzEndRead-= zzStartRead;
      zzCurrentPos-= zzStartRead;
      zzMarkedPos-= zzStartRead;
      zzStartRead = 0;
    }

    /* is the buffer big enough? */
    if (zzCurrentPos >= zzBuffer.length) {
      /* if not: blow it up */
      char newBuffer[] = new char[zzCurrentPos*2];
      System.arraycopy(zzBuffer, 0, newBuffer, 0, zzBuffer.length);
      zzBuffer = newBuffer;
    }

    /* finally: fill the buffer with new input */
    int numRead = zzReader.read(zzBuffer, zzEndRead,
                                            zzBuffer.length-zzEndRead);

    if (numRead > 0) {
      zzEndRead+= numRead;
      return false;
    }
    // unlikely but not impossible: read 0 characters, but not at end of stream    
    if (numRead == 0) {
      int c = zzReader.read();
      if (c == -1) {
        return true;
      } else {
        zzBuffer[zzEndRead++] = (char) c;
        return false;
      }     
    }

	// numRead < 0
    return true;
  }

    
  /**
   * Closes the input stream.
   */
  public final void yyclose() throws java.io.IOException {
    zzAtEOF = true;            /* indicate end of file */
    zzEndRead = zzStartRead;  /* invalidate buffer    */

    if (zzReader != null)
      zzReader.close();
  }


  /**
   * Resets the scanner to read from a new input stream.
   * Does not close the old reader.
   *
   * All internal variables are reset, the old input stream 
   * <b>cannot</b> be reused (internal buffer is discarded and lost).
   * Lexical state is set to <tt>ZZ_INITIAL</tt>.
   *
   * @param reader   the new input stream 
   */
  public final void yyreset(java.io.Reader reader) {
    zzReader = reader;
    zzAtBOL  = true;
    zzAtEOF  = false;
    zzEOFDone = false;
    zzEndRead = zzStartRead = 0;
    zzCurrentPos = zzMarkedPos = 0;
    yyline = yychar = yycolumn = 0;
    zzLexicalState = YYINITIAL;
  }


  /**
   * Returns the current lexical state.
   */
  public final int yystate() {
    return zzLexicalState;
  }


  /**
   * Enters a new lexical state
   *
   * @param newState the new lexical state
   */
  public final void yybegin(int newState) {
    zzLexicalState = newState;
  }


  /**
   * Returns the text matched by the current regular expression.
   */
  public final String yytext() {
    return new String( zzBuffer, zzStartRead, zzMarkedPos-zzStartRead );
  }


  /**
   * Returns the character at position <tt>pos</tt> from the 
   * matched text. 
   * 
   * It is equivalent to yytext().charAt(pos), but faster
   *
   * @param pos the position of the character to fetch. 
   *            A value from 0 to yylength()-1.
   *
   * @return the character at position pos
   */
  public final char yycharat(int pos) {
    return zzBuffer[zzStartRead+pos];
  }


  /**
   * Returns the length of the matched text region.
   */
  public final int yylength() {
    return zzMarkedPos-zzStartRead;
  }


  /**
   * Reports an error that occured while scanning.
   *
   * In a wellformed scanner (no or only correct usage of 
   * yypushback(int) and a match-all fallback rule) this method 
   * will only be called with things that "Can't Possibly Happen".
   * If this method is called, something is seriously wrong
   * (e.g. a JFlex bug producing a faulty scanner etc.).
   *
   * Usual syntax/scanner level error handling should be done
   * in error fallback rules.
   *
   * @param   errorCode  the code of the errormessage to display
   */
  private void zzScanError(int errorCode) {
    String message;
    try {
      message = ZZ_ERROR_MSG[errorCode];
    }
    catch (ArrayIndexOutOfBoundsException e) {
      message = ZZ_ERROR_MSG[ZZ_UNKNOWN_ERROR];
    }

    throw new Error(message);
  } 


  /**
   * Pushes the specified amount of characters back into the input stream.
   *
   * They will be read again by then next call of the scanning method
   *
   * @param number  the number of characters to be read again.
   *                This number must not be greater than yylength()!
   */
  public void yypushback(int number)  {
    if ( number > yylength() )
      zzScanError(ZZ_PUSHBACK_2BIG);

    zzMarkedPos -= number;
  }


  /**
   * Contains user EOF-code, which will be executed exactly once,
   * when the end of file is reached
   */
  private void zzDoEOF() throws java.io.IOException {
    if (!zzEOFDone) {
      zzEOFDone = true;
      yyclose();
    }
  }


  /**
   * Resumes scanning until the next regular expression is matched,
   * the end of input is encountered or an I/O-Error occurs.
   *
   * @return      the next token
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  public java_cup.runtime.Symbol next_token() throws java.io.IOException {
    int zzInput;
    int zzAction;

    // cached fields:
    int zzCurrentPosL;
    int zzMarkedPosL;
    int zzEndReadL = zzEndRead;
    char [] zzBufferL = zzBuffer;
    char [] zzCMapL = ZZ_CMAP;

    int [] zzTransL = ZZ_TRANS;
    int [] zzRowMapL = ZZ_ROWMAP;
    int [] zzAttrL = ZZ_ATTRIBUTE;

    while (true) {
      zzMarkedPosL = zzMarkedPos;

      boolean zzR = false;
      for (zzCurrentPosL = zzStartRead; zzCurrentPosL < zzMarkedPosL;
                                                             zzCurrentPosL++) {
        switch (zzBufferL[zzCurrentPosL]) {
        case '\u000B':
        case '\u000C':
        case '\u0085':
        case '\u2028':
        case '\u2029':
          yyline++;
          yycolumn = 0;
          zzR = false;
          break;
        case '\r':
          yyline++;
          yycolumn = 0;
          zzR = true;
          break;
        case '\n':
          if (zzR)
            zzR = false;
          else {
            yyline++;
            yycolumn = 0;
          }
          break;
        default:
          zzR = false;
          yycolumn++;
        }
      }

      if (zzR) {
        // peek one character ahead if it is \n (if we have counted one line too much)
        boolean zzPeek;
        if (zzMarkedPosL < zzEndReadL)
          zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        else if (zzAtEOF)
          zzPeek = false;
        else {
          boolean eof = zzRefill();
          zzEndReadL = zzEndRead;
          zzMarkedPosL = zzMarkedPos;
          zzBufferL = zzBuffer;
          if (eof) 
            zzPeek = false;
          else 
            zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        }
        if (zzPeek) yyline--;
      }
      zzAction = -1;

      zzCurrentPosL = zzCurrentPos = zzStartRead = zzMarkedPosL;
  
      zzState = ZZ_LEXSTATE[zzLexicalState];


      zzForAction: {
        while (true) {
    
          if (zzCurrentPosL < zzEndReadL)
            zzInput = zzBufferL[zzCurrentPosL++];
          else if (zzAtEOF) {
            zzInput = YYEOF;
            break zzForAction;
          }
          else {
            // store back cached positions
            zzCurrentPos  = zzCurrentPosL;
            zzMarkedPos   = zzMarkedPosL;
            boolean eof = zzRefill();
            // get translated positions and possibly new buffer
            zzCurrentPosL  = zzCurrentPos;
            zzMarkedPosL   = zzMarkedPos;
            zzBufferL      = zzBuffer;
            zzEndReadL     = zzEndRead;
            if (eof) {
              zzInput = YYEOF;
              break zzForAction;
            }
            else {
              zzInput = zzBufferL[zzCurrentPosL++];
            }
          }
          int zzNext = zzTransL[ zzRowMapL[zzState] + zzCMapL[zzInput] ];
          if (zzNext == -1) break zzForAction;
          zzState = zzNext;

          int zzAttributes = zzAttrL[zzState];
          if ( (zzAttributes & 1) == 1 ) {
            zzAction = zzState;
            zzMarkedPosL = zzCurrentPosL;
            if ( (zzAttributes & 8) == 8 ) break zzForAction;
          }

        }
      }

      // store back cached position
      zzMarkedPos = zzMarkedPosL;

      switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
        case 6: 
          { System.out.println(">>ID"); return symbol(sym.ID, yytext());
          }
        case 49: break;
        case 9: 
          { System.out.println(">>LT"); return symbol(sym.LT);
          }
        case 50: break;
        case 27: 
          { System.out.println(">>EQEQ"); return symbol(sym.EQEQ);
          }
        case 51: break;
        case 18: 
          { System.out.println(">>LBRACK"); return symbol(sym.LBRACK);
          }
        case 52: break;
        case 29: 
          { System.out.println(">>GTEQ"); return symbol(sym.GTEQ);
          }
        case 53: break;
        case 2: 
          { /* Se borran los espacios  */
          }
        case 54: break;
        case 32: 
          { System.out.println(">>PLUSEQ"); return symbol(sym.PLUSEQ);
          }
        case 55: break;
        case 34: 
          { System.out.println(">>MINUSEQ"); return symbol(sym.MINUSEQ);
          }
        case 56: break;
        case 25: 
          { System.out.println(">>if"); return symbol(sym.IF);
          }
        case 57: break;
        case 31: 
          { System.out.println(">>OROR"); return symbol(sym.OROR);
          }
        case 58: break;
        case 33: 
          { System.out.println(">>PLUSPLUS"); return symbol(sym.PLUSPLUS);
          }
        case 59: break;
        case 35: 
          { System.out.println(">>MINUSMINUS"); return symbol(sym.MINUSMINUS);
          }
        case 60: break;
        case 42: 
          { System.out.println(">>void"); return symbol(sym.VOID);
          }
        case 61: break;
        case 36: 
          { System.out.println(">>String: "+ yytext()); return symbol(sym.STRING, new String(yytext()));
          }
        case 62: break;
        case 47: 
          { System.out.println(">>return"); return symbol(sym.RETURN);
          }
        case 63: break;
        case 16: 
          { System.out.println(">>LBRACE"); return symbol(sym.LBRACE);
          }
        case 64: break;
        case 44: 
          { System.out.println(">>gets"); return symbol(sym.GETS);
          }
        case 65: break;
        case 24: 
          { System.out.println(">>MULTEQ"); return symbol(sym.MULTEQ);
          }
        case 66: break;
        case 3: 
          { System.out.println(">>Include: "+ yytext()); /* Se eliminan los include */
          }
        case 67: break;
        case 5: 
          { System.out.println(">>MULT"); return symbol(sym.MULT);
          }
        case 68: break;
        case 20: 
          { System.out.println(">>SEMICOLON"); return symbol(sym.SEMICOLON);
          }
        case 69: break;
        case 14: 
          { System.out.println(">>LPAREN"); return symbol(sym.LPAREN);
          }
        case 70: break;
        case 43: 
          { System.out.println(">>else"); return symbol(sym.ELSE);
          }
        case 71: break;
        case 38: 
          { System.out.println(">>numerof: "+ yytext()); return symbol(sym.NUMBERF, new Float(yytext().substring(0,yylength()-1)));
          }
        case 72: break;
        case 10: 
          { System.out.println(">>GT"); return symbol(sym.GT);
          }
        case 73: break;
        case 19: 
          { System.out.println(">>RBRACK"); return symbol(sym.RBRACK);
          }
        case 74: break;
        case 28: 
          { System.out.println(">>LTEQ"); return symbol(sym.LTEQ);
          }
        case 75: break;
        case 23: 
          { System.out.println(">>DIVEQ"); return symbol(sym.DIVEQ);
          }
        case 76: break;
        case 40: 
          { System.out.println(">>comentario: "+ yytext()); /* Lineas de comentarios */
          }
        case 77: break;
        case 1: 
          { System.out.println("ERROR LEXICO");
          }
        case 78: break;
        case 4: 
          { System.out.println(">>DIV"); return symbol(sym.DIV);
          }
        case 79: break;
        case 13: 
          { System.out.println(">>numero: "+ yytext()); return symbol(sym.INTEGER, new Integer(yytext()));
          }
        case 80: break;
        case 12: 
          { System.out.println(">>MINUS"); return symbol(sym.MINUS);
          }
        case 81: break;
        case 17: 
          { System.out.println(">>RBRACE"); return symbol(sym.RBRACE);
          }
        case 82: break;
        case 7: 
          { System.out.println(">>NOT"); return symbol(sym.NOT);
          }
        case 83: break;
        case 22: 
          { System.out.println(">>comentario: "+ yytext()); /* Linea de comentarios */
          }
        case 84: break;
        case 37: 
          { System.out.println(">>int"); return symbol(sym.INT, 0);
          }
        case 85: break;
        case 15: 
          { System.out.println(">>RPAREN"); return symbol(sym.RPAREN);
          }
        case 86: break;
        case 8: 
          { System.out.println(">>EQ"); return symbol(sym.EQ);
          }
        case 87: break;
        case 11: 
          { System.out.println(">>PLUS"); return symbol(sym.PLUS);
          }
        case 88: break;
        case 48: 
          { System.out.println(">>printf"); return symbol(sym.PRINTF);
          }
        case 89: break;
        case 39: 
          { System.out.println(">>character: "+ yytext()); return symbol(sym.CHARACTER, new Character(yytext().charAt(1)));
          }
        case 90: break;
        case 26: 
          { System.out.println(">>NOTEQ"); return symbol(sym.NOTEQ);
          }
        case 91: break;
        case 21: 
          { System.out.println(">>COMMA"); return symbol(sym.COMMA);
          }
        case 92: break;
        case 30: 
          { System.out.println(">>ANDAND"); return symbol(sym.ANDAND);
          }
        case 93: break;
        case 46: 
          { System.out.println(">>while"); return symbol(sym.WHILE);
          }
        case 94: break;
        case 41: 
          { System.out.println(">>char"); return symbol(sym.CHAR, '0');
          }
        case 95: break;
        case 45: 
          { System.out.println(">>float"); return symbol(sym.FLOAT, 0.0f);
          }
        case 96: break;
        default: 
          if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
            zzAtEOF = true;
            zzDoEOF();
              { return new java_cup.runtime.Symbol(sym.EOF); }
          } 
          else {
            zzScanError(ZZ_NO_MATCH);
          }
      }
    }
  }


}
