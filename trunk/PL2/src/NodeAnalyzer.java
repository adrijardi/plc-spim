import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;

public class NodeAnalyzer {

	private LinkedList<NodeAnalyzer> hijos;
	private LinkedList<NodeAnalyzer> hermanos;
	private String cad;
	// private String states = "";
	private NodeType nodeType;
	private HashMap<NodeKeys, String> nodeAtributes;
	private final String etiquetaSalto="J_ET_M_T_";
	private static int contadorSalto= 0;

	private boolean error;

	public NodeAnalyzer(String cad) {
		this.cad = cad;
		hijos = new LinkedList<NodeAnalyzer>();
		hermanos = new LinkedList<NodeAnalyzer>();
		nodeAtributes = new HashMap<NodeKeys, String>();
	}

	public void addLeftHermano(NodeAnalyzer hermano) {
		hermanos.addFirst(hermano);
	}

	public void addLeftHijo(NodeAnalyzer hijo) {
		hijos.addFirst(hijo);
	}

	public void addRightHermano(NodeAnalyzer hermano) {
		hermanos.addLast(hermano);
	}

	public void addRightHijo(NodeAnalyzer hijo) {
		hijos.addLast(hijo);
	}

	public void checkVariables(Syntactic syntactic) {
		boolean scope = false;
		VarTable va = VarTable.getInstance();
		FunTable fu = FunTable.getInstance();
		if (nodeType != null) {
			switch (nodeType) {
			case VARDEC:
				String varname = getStrAtr(NodeKeys.VAR_ID);
				VarTipo tipo = null;
				try {
					tipo = VarTipo.valueOf(getStrAtr(NodeKeys.TYPE).toUpperCase());
				} catch (Exception e) {
				}
				Variable var = null;
				if (tipo != null) {
					var = new Variable(varname, tipo);

					switch (tipo) {
					case INT:
						Integer i = getIntAtr(NodeKeys.CONST_INT_VALUE);
						if (i != null) {
							var = new Variable(varname, i.intValue(), tipo);
						}
						break;
					case CHAR:
						Character c = getCharAtr(NodeKeys.CONST_CHAR_VALUE);
						if (c != null) {
							var = new Variable(varname, c.charValue(), tipo);
						}
						break;
					case FLOAT:
						Float f = getFloatAtr(NodeKeys.CONST_FLOAT_VALUE);
						if (f != null) {
							var = new Variable(varname, f.floatValue(), tipo);
						}
						break;
					}
				}

				if (var != null) {
					if (!va.addVariable(var)) {
						syntactic.addError("Variable " + var + " duplicada");
					} else {
						if (!va.isGlobal()) {
							setAtribute(NodeKeys.VAR_ID, var.getName() + var.getScope());
							if (getBooleanAtr(NodeKeys.IS_PARAM))
								fu.addParameter(fu.getActualKey(), var);
						}
					}
				}
				break;

			case FUNCTION_DEC:
				va.newScope();
				String fkey = getStrAtr(NodeKeys.FUNC_ID);
				fu.addFunction(fkey);
				fu.setActualKey(fkey);
				scope = true;
				break;

			case FUNCTION_CALL:
				String ret = va.getReturnforFuction(getStrAtr(NodeKeys.FUNC_ID));
				if (ret == null) {
					// TODO Error
					System.out.println("ERROR funcion con retorno null");
				} else {
					setAtribute(NodeKeys.TYPE, ret);
				}
				break;

			case PRINTFSTRING:
				String value = getStrAtr(NodeKeys.STRING);
				if (value != null) {
					String key = va.addString(value);
					setAtribute(NodeKeys.STRING, key);
				}
				break;
			}
		}

		for (NodeAnalyzer na : hijos) {
			na.checkVariables(syntactic);
		}

		if (!va.isGlobal()) {
			String varname = getStrAtr(NodeKeys.VAR_ID);
			if (varname != null) {
				System.out.println("Buscando Variable: " + varname);
				String scp = va.buscarVariable(varname);
				System.out.println("Encontrado : " + scp);
				if (scp != null) {
					if (scp.compareTo("0") != 0) {
						setAtribute(NodeKeys.VAR_ID, varname + scp);
					}
				}
			}
		}

		if (scope)
			va.exitScope();

	}

	/*
	 * public void setStates(String nstates) { StringBuilder sb = new
	 * StringBuilder(); sb.append(nstates); if (states.length() > 0) {
	 * sb.append(" "); sb.append(states); } this.states = sb.toString(); }
	 */

	public void copyHijos(LinkedList<NodeAnalyzer> hijos) {
		this.hijos.addAll(hijos);
	}

	public void copyLeftHijos(LinkedList<NodeAnalyzer> hijos) {
		for (int i = hijos.size() - 1; i >= 0; i--) {
			this.hijos.addFirst(hijos.get(i));
		}
	}

	public LinkedList<NodeAnalyzer> extractHermanos() {
		LinkedList<NodeAnalyzer> llna = hermanos;
		hermanos = new LinkedList<NodeAnalyzer>();
		return llna;
	}

	public String getCad() {
		return cad;
	}

	public LinkedList<NodeAnalyzer> getHijos() {
		return hijos;
	}

	public Integer getIntAtr(NodeKeys nk) {
		Integer ret = null;
		try {
			String s = nodeAtributes.get(nk);
			if (s != null)
				ret = new Integer(s);
		} catch (NumberFormatException nfe) {
			System.out.println("Error al parsear atr");
		}
		return ret;
	}

	public Character getCharAtr(NodeKeys nk) {
		Character ret = null;
		try {
			String s = nodeAtributes.get(nk);
			if (s != null && s.length() == 1)
				ret = new Character(s.charAt(0));
		} catch (NumberFormatException nfe) {
			System.out.println("Error al parsear atr");
		}
		return ret;
	}

	public Float getFloatAtr(NodeKeys nk) {
		Float ret = null;
		try {
			String s = nodeAtributes.get(nk);
			if (s != null)
				ret = new Float(s);
		} catch (NumberFormatException nfe) {
			System.out.println("Error al parsear atr");
		}
		return ret;
	}

	public boolean getBooleanAtr(NodeKeys nk) {
		Boolean ret = false;
		try {
			String s = nodeAtributes.get(nk);
			if (s != null)
				ret = new Boolean(s);
		} catch (NumberFormatException nfe) {
			System.out.println("Error al parsear atr");
		}
		return ret;
	}

	public NodeType getNodeType() {
		return nodeType;
	}

	public String getStrAtr(NodeKeys nk) {
		return nodeAtributes.get(nk);
	}

	private String getStrAttr() {
		StringBuilder sb = new StringBuilder();
		Set<NodeKeys> keys = nodeAtributes.keySet();
		for (NodeKeys key : keys) {
			sb.append(key.name());
			sb.append(":");
			sb.append(nodeAtributes.get(key));
			sb.append(" ");
		}
		return sb.toString();
	}

	public boolean isError() {
		return error;
	}

	public void print(int level) {
		StringBuilder sb = new StringBuilder();
		if (level == 1)
			sb.append('\n');
		for (int i = 0; i < level; i++) {
			if (i == level - 1)
				sb.append("\\_");
			else
				sb.append("  ");
		}
		sb.append(cad);
		/*
		 * sb.append('['); sb.append(states); sb.append(']');
		 */
		if (nodeType != null) {
			sb.append('[');
			sb.append(nodeType);
			sb.append(']');
		}
		sb.append('[');
		sb.append(getStrAttr());
		sb.append(']');
		if (error)
			sb.append("error");
		System.out.println(sb);
		for (NodeAnalyzer hijo : hijos) {
			hijo.print(level + 1);
		}
		for (NodeAnalyzer hermano : hermanos) {
			hermano.print(level);
		}
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		if (nodeType != null) {
			sb.append('[');
			sb.append(nodeType);
			sb.append(']');
		}
		sb.append('[');
		sb.append(getStrAttr());
		sb.append(']');
		return sb.toString();
	}

	public void setAtribute(NodeKeys nk, String value) {
		nodeAtributes.put(nk, value);
	}

	public void setCad(String cad) {
		this.cad = cad;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public void setNodeType(NodeType nodeType) {
		this.nodeType = nodeType;
	}

	/**
	 * Obtien el codigo de generacion
	 * 
	 * @return codigo generado
	 */
	public String getGloblCode() {
		StringBuilder sb = new StringBuilder();
		String aux;
		if (nodeType != null) {
			switch (nodeType) {
			case IF:
				sb.append(getIFCode());
				break;
			case IFELSE:
				sb.append(getIFELSECode());
				break;
			case OPERATION:
				sb.append(getOperationCode());
				break;
			case FUNCTION_DEC:
				String fname = getStrAtr(NodeKeys.FUNC_ID);
				if (fname.equals("main")) {
					sb.append(" __start:\n");
					sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
					sb.append("\t\tsw $ra,  ($sp) #Salvado de $ra\n");
					sb.append(getChildernGlobCode());
					sb.append("\t\t#--Fin de programa--#\n");
					sb.append("\t\tlw $ra,  ($sp) #Restauracion de $ra\n");
					sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
					sb.append("\t\tli $v0, 10\n\t\tsyscall\n\n");
				} else {
					sb.append(fname);
					sb.append("_ini:\n");
					sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
					sb.append("\t\tsw $ra,  ($sp) #Salvado de $ra\n");
					sb.append(getChildernGlobCode());
					sb.append(fname);
					sb.append("_ret:\n");
					sb.append("\t\tlw $ra,  ($sp) #Restauracion de $ra\n");
					sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
					sb.append("\t\tjr $ra\t# retorna al invocador\n\n");
				}
				break;
			case ASIGNATION:
				NodeAnalyzer reciver = hijos.get(0);
				NodeAnalyzer value = hijos.get(1);
				sb.append(getAsignationCode(OperationKey.getOperationKey(this), reciver, value));
				sb.append("\n\n");
				break;
			case PRINTFID:
				String varid = getStrAtr(NodeKeys.VAR_ID);
				Variable variable = VarTable.getInstance().getVariableByCompleteName(varid);
				if (variable != null) {
					switch (variable.getVt()) {
					case INT:
						sb.append("\t\tlw $a0, ");
						sb.append(getStrAtr(NodeKeys.VAR_ID));
						sb.append("_var\n\t\tjal printf_int");
						sb.append("\n\n");
						break;
					case CHAR:
						sb.append("\t\tlw $a0, ");
						sb.append(getStrAtr(NodeKeys.VAR_ID));
						sb.append("_var\n\t\tjal printf_int");
						sb.append("\n\n");
						break;
					case FLOAT:
						sb.append("\t\tl.s $f12, ");
						sb.append(getStrAtr(NodeKeys.VAR_ID));
						sb.append("_var\n\t\tjal printf_float");
						sb.append("\n\n");
						break;
					}
				}
				break;
			case PRINTFSTRING:
				sb.append("\t\tla $a0, ");
				sb.append(getStrAtr(NodeKeys.STRING));
				sb.append("_str\n\t\tjal printf_str");
				sb.append("\n\n");
				break;
			case FUNCTION_CALL:
				FunTable.getInstance().setActualKey(getStrAtr(NodeKeys.FUNC_ID));
				sb.append(getFunctionCall());
				break;
			case RETURN:
				NodeAnalyzer return_value = hijos.get(0);
				sb.append(getReturnValue(return_value));
				break;
			default:
				sb.append(getChildernGlobCode());
				break;
			}

		} else {
			sb.append(getChildernGlobCode());
		}

		return sb.toString();
	}

	private String getIFELSECode() {
		StringBuilder sb = new StringBuilder();
		
		NodeAnalyzer ifstament = hijos.get(0);
		NodeAnalyzer elsestament = hijos.get(1);
		NodeAnalyzer condicion = hijos.get(2);
		
		return sb.toString();
	}

	private String getIFCode() {
		StringBuilder sb = new StringBuilder();
		
		NodeAnalyzer ifstament = hijos.get(0);
		NodeAnalyzer condicion = hijos.get(1);
		
		return sb.toString();
	}

	private String getFunctionCall() {
		StringBuilder sb = new StringBuilder();
		sb.append("\t## FUNCTION CALL ##\n");
		FunTable fu = FunTable.getInstance();
		LinkedList<Variable> paramNames = fu.getParams(fu.getActualKey());
		if (hijos != null && hijos.size() == paramNames.size()) {
			if (hijos.size() > 0) {
				Iterator<Variable> iv = paramNames.iterator();
				Variable defParam;
				Variable auxvar;
				String aux;
				for (NodeAnalyzer hijo : hijos) {
					defParam = iv.next();
					switch (hijo.getNodeType()) {
					case CONSTANT:
						// primero miramos el tipo del hijo y luego el tipo de
						// donde lo queremos meter
						aux = hijo.getStrAtr(NodeKeys.TYPE);
						if (aux.compareTo("float") == 0) {
							switch (defParam.getVt()) {
							case FLOAT:
								sb.append("\t\tli.s $f0, " + hijo.getFloatAtr(NodeKeys.CONST_FLOAT_VALUE) + "\n");
								sb.append("\t\ts.s $f0, " + defParam.getCompleteName() + "_var\n");
								break;
							case INT:
								sb.append("\t\tli.s $f4, " + hijo.getFloatAtr(NodeKeys.CONST_FLOAT_VALUE) + "\n");
								sb.append(conversionFloatInt("$f4", "$t0"));
								sb.append("\t\tsw $t0 " + defParam.getCompleteName() + "_var\n");
								break;
							default:
								// TODO error no se puede pasar de float a char
								Generator.ERROR = true;
								break;
							}
						} else if (aux.compareTo("int") == 0) {
							switch (defParam.getVt()) {
							case FLOAT:
								// Se convierten los enteros a float
								sb.append("\t\tli $t0 " + hijo.getIntAtr(NodeKeys.CONST_INT_VALUE) + "\n");
								sb.append(conversionIntFloat("$t0", "$f0"));
								sb.append("\t\ts.s $f0, " + defParam.getCompleteName() + "_var\n");
								break;
							case INT:
								sb.append("\t\tli $t0 " + hijo.getIntAtr(NodeKeys.CONST_INT_VALUE) + "\n");
								sb.append("\t\tsw $t0 " + defParam.getCompleteName() + "_var\n");
								break;
							case CHAR:
								sb.append("\t\tli $t0 " + ((int) hijo.getCharAtr(NodeKeys.CONST_CHAR_VALUE).charValue()) + "\n");
								sb.append("\t\tsw $t0 " + defParam.getCompleteName() + "_var\n");
								break;
							}
						} else if (aux.compareTo("char") == 0) {
							// TODO faltaaaaaaaaaa conversion de tipos
						} else {
							Generator.ERROR = true;
							System.out.println("ERROR NO SE ACEPTAN OTROS TIPOS");// TODO
							// comprobar
							// y
							// quitar?
						}
						break;
					case VAR:
						// primero miramos el tipo del hijo y luego el tipo de
						// donde lo queremos meter
						aux = hijo.getStrAtr(NodeKeys.VAR_ID);
						auxvar = VarTable.getInstance().getVariableByCompleteName(aux);
						switch (auxvar.getVt()) {
						case FLOAT:
							switch (defParam.getVt()) {
							case FLOAT:
								sb.append("\t\tl.s $f0, " + auxvar.getCompleteName() + "_var\n");
								sb.append("\t\ts.s $f0, " + defParam.getCompleteName() + "_var\n");
								break;
							case INT:

								sb.append("\t\tl.s $f4, " + auxvar.getCompleteName() + "_var\n");
								sb.append(conversionFloatInt("$f4", "$t0"));
								sb.append("\t\tsw $t0 " + defParam.getCompleteName() + "_var\n");
								break;
							default:
								// TODO error no se puede pasar de float a char
								Generator.ERROR = true;
								break;
							}
							break;
						case INT:
							switch (defParam.getVt()) {
							case FLOAT:
								// Se pasa de int a float
								sb.append("\t\tlw $t0 " + auxvar.getCompleteName() + "_var\n");
								sb.append(conversionIntFloat("$t0", "$f0"));
								sb.append("\t\ts.s $f0, " + defParam.getCompleteName() + "_var\n");
								break;
							default:
								sb.append("\t\tlw $t0 " + auxvar.getCompleteName() + "_var\n");
								sb.append("\t\tsw $t0 " + defParam.getCompleteName() + "_var\n");
								break;
							}
							break;
						case CHAR:
							// TODO faltaaaaaaaaaa conversion de tipos
							break;

						default:
							System.out.println("ERROR NO SE ACEPTAN OTROS TIPOS");// TODO
							// comprobar
							// y
							// quitar?
							break;
						}
						break;
					default:
						System.out.println("ERROR");// TODO comprobar y quitar
						break;
					}

				}

			}
			sb.append("\t\tjal ");
			String func_id = getStrAtr(NodeKeys.FUNC_ID);
			sb.append(func_id);
			sb.append("_ini\n\n");
		} else {
			System.out.println("ERROR");
		}
		return sb.toString();
	}

	private String getReturnValue(NodeAnalyzer return_value) {
		StringBuilder sb = new StringBuilder();
		String tipo;
		switch (return_value.getNodeType()) {
		case CONSTANT:
			tipo = return_value.getStrAtr(NodeKeys.TYPE);
			if ("int".compareTo(tipo) == 0) {
				sb.append("\t\tli $v0, ");
				sb.append(return_value.getIntAtr(NodeKeys.CONST_INT_VALUE));
				sb.append("\n");
			} else if ("char".compareTo(tipo) == 0) {
				sb.append("\t\tli $v0, ");
				sb.append((int) return_value.getCharAtr(NodeKeys.CONST_CHAR_VALUE));
				sb.append("\n");
			} else if ("float".compareTo(tipo) == 0) {
				sb.append("\t\tli.s $f0, ");
				sb.append(return_value.getFloatAtr(NodeKeys.CONST_FLOAT_VALUE));
				sb.append("\n");
			}

			break;
		case VAR:
			tipo = getStrAtr(NodeKeys.TYPE);
			if ("int".compareTo(tipo) == 0) {
				sb.append("\t\tlw $v0, ");
				sb.append(return_value.getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
			} else if ("char".compareTo(tipo) == 0) {
				sb.append("\t\tlw $v0, ");
				sb.append(return_value.getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
			} else if ("float".compareTo(tipo) == 0) {
				sb.append("\t\tl.s $f0, ");
				sb.append(return_value.getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
			}
			break;

		default:
			break;
		}
		return sb.toString();
	}

	/**
	 * Se obtiene el codigo para las asignaciones
	 * 
	 * @param strAtr
	 *            tipo de asignacion
	 * @param reciver
	 *            el nodo receptor
	 * @param value
	 *            el nodo que contiene el valor
	 * @return el codigo de la asignacion
	 */
	private String getAsignationCode(OperationKey ok, NodeAnalyzer reciver, NodeAnalyzer value) {
		StringBuilder sb = new StringBuilder();
		String varid = reciver.getStrAtr(NodeKeys.VAR_ID);
		VarTipo vtid = VarTable.getInstance().getVariableByCompleteName(varid).getVt();
		switch (ok) {
		case EQ:
			switch (vtid) {
			case FLOAT:
				sb.append(value.getFloatValueCode("$f0"));
				sb.append("\t\ts.s $f0, ");
				break;
			case INT:
				sb.append(value.getIntValueCode("$t0"));
				sb.append("\t\tsw $t0, ");
				break;
			case CHAR:
				sb.append(value.getCharValueCode());
				sb.append("\t\tsw $t0, ");
				break;
			}
			sb.append(varid);
			sb.append("_var");
			break;
		default:
			boolean f1 = (vtid == VarTipo.FLOAT);
			boolean f2 = (value.getVarTipoDelNodo() == VarTipo.FLOAT);
			// Se genera el codigo de la operacion
			sb.append(getOperationCode(f1, reciver, f2, value, ok));

			boolean ifFloat = f1 | f2;
			switch (vtid) {
			case FLOAT:
				if (!ifFloat) {
					sb.append(conversionIntFloat("$t0", "$f0"));
				}
				sb.append("\t\ts.s $f0, ");
				break;
			default:
				if (ifFloat) {
					sb.append(conversionFloatInt("$f0", "$t0"));
				}
				sb.append("\t\tsw $t0, ");
				break;
			}
			sb.append(varid);
			sb.append("_var");
			break;
		}
		return sb.toString();
	}

	private enum OperationKey {
		PLUS, MINUS, MULT, DIV, EQ, EQEQ, NOTEQ, GD, LD, GDEQ, LDEQ, ANDAND, OROR;

		private static OperationKey getOperationKey(NodeAnalyzer na) {
			String strAtr = na.getStrAtr(NodeKeys.ASIGNMENT);
			OperationKey ret = null;
			if(strAtr != null){
				if (strAtr.compareTo("=") == 0) {
					ret = OperationKey.EQ;
				} else if (strAtr.compareTo("*=") == 0) {
					ret = OperationKey.MULT;
				} else if (strAtr.compareTo("/=") == 0) {
					ret = OperationKey.DIV;
				} else if (strAtr.compareTo("+=") == 0) {
					ret = OperationKey.PLUS;
				} else if (strAtr.compareTo("-=") == 0) {
					ret = OperationKey.MINUS;
				} 
			}else{
				strAtr = na.getStrAtr(NodeKeys.OPERATION);
				if(strAtr != null){
					if (strAtr.compareTo("*") == 0) {
						ret = OperationKey.MULT;
					} else if (strAtr.compareTo("/") == 0) {
						ret = OperationKey.DIV;
					} else if (strAtr.compareTo("+") == 0) {
						ret = OperationKey.PLUS;
					} else if (strAtr.compareTo("-") == 0) {
						ret = OperationKey.MINUS;
					} else if (strAtr.compareTo("==") == 0) {
						ret = OperationKey.EQEQ;
					} else if (strAtr.compareTo("!=") == 0) {
						ret = OperationKey.NOTEQ;
					} else if (strAtr.compareTo(">") == 0) {
						ret = OperationKey.GD;
					} else if (strAtr.compareTo("<") == 0) {
						ret = OperationKey.LD;
					} else if (strAtr.compareTo(">=") == 0) {
						ret = OperationKey.GDEQ;
					} else if (strAtr.compareTo("<=") == 0) {
						ret = OperationKey.LDEQ;
					} else if (strAtr.compareTo("&&") == 0) {
						ret = OperationKey.ANDAND;
					} else if (strAtr.compareTo("||") == 0) {
						ret = OperationKey.OROR;
					} 
				}
			}
			return ret;
		}
	}
	
	private String getOperationCode(){
		NodeAnalyzer p1 = hijos.get(0);
		boolean f1 = (p1.getVarTipoDelNodo() == VarTipo.FLOAT);
		NodeAnalyzer p2 = hijos.get(1);
		boolean f2 = (p2.getVarTipoDelNodo() == VarTipo.FLOAT);
		return getOperationCode(f1, p1, f2, p2, OperationKey.getOperationKey(this));
	}

	private String getOperationCode(boolean f1, NodeAnalyzer p1, boolean f2, NodeAnalyzer p2, OperationKey op) {
		StringBuilder sb = new StringBuilder();
		sb.append("\t## OPERATION " + op + " ##\n");
		if (f1 || f2) {
			// Se obtiene el valor del primer parametro
			sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
			sb.append("\t\ts.s $f2,  ($sp) #Salvado de $ra\n");
			if (f2) {
				sb.append(p2.getFloatValueCode("$f2"));
			} else {
				sb.append(p2.getIntValueCode("$t0"));
				sb.append(conversionIntFloat("$t0", "$f2"));
			}
			
			// Se obtiene el valor del segundo parametro
			sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
			sb.append("\t\ts.s $f1,  ($sp) #Salvado de $ra\n");
			if (f1) {
				sb.append(p1.getFloatValueCode("$f1"));
			} else {
				sb.append(p1.getIntValueCode("$t0"));
				sb.append(conversionIntFloat("$t0", "$f1"));
			}

			switch (op) {
			case PLUS:
				sb.append("\t\tadd.s $f0, $f1, $f2\n");
				break;
			case MINUS:
				sb.append("\t\tsub.s $f0, $f1, $f2\n");
				break;
			case MULT:
				sb.append("\t\tmul.s $f0, $f1, $f2\n");
				break;
			case DIV:
				sb.append("\t\tdiv.s $f0, $f1, $f2\n");
				break;
			case EQEQ:
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t\tc.eq.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case NOTEQ:
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t\tc.eq.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case GD:
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t\tc.le.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case LD:
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t\tc.lt.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case GDEQ:
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t\tc.lt.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case LDEQ:
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t\tc.le.s $f1, $f2\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case ANDAND:
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t\tc.eq.s $f1, $f0\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tc.eq.s $f2, $f0\n");
				sb.append("\t\tbc1t "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case OROR:
				sb.append("\t\tli.s $f0, 1.0\n");
				sb.append("\t\tli.s $f5, 0.0\n");
				sb.append("\t\tc.eq.s $f1, $f5\n");
				sb.append("\t\tbc1f "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tc.eq.s $f2, $f5\n");
				sb.append("\t\tbc1f "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli.s $f0, 0.0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			}
			
			sb.append("\t\tl.s $f1,  ($sp) #Restauracion de $ra\n");
			sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
			sb.append("\t\tl.s $f2,  ($sp) #Restauracion de $ra\n");
			sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
		} else {
			sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
			sb.append("\t\tsw $t2,  ($sp) #Salvado de $ra\n");
			sb.append(p2.getIntValueCode("$t0"));
			sb.append("\t\tmove $t2, $t0\n");
			
			sb.append("\t\tsub $sp,$sp,4 #Reserva de la pila\n");
			sb.append("\t\tsw $t1,  ($sp) #Salvado de $ra\n");
			sb.append(p1.getIntValueCode("$t0"));
			sb.append("\t\tmove $t1, $t0\n");
			
			switch (op) {
			case PLUS:
				sb.append("\t\tadd $t0, $t1, $t2\n");
				break;
			case MINUS:
				sb.append("\t\tsub $t0, $t1, $t2\n");
				break;
			case MULT:
				sb.append("\t\tmult $t1, $t2\n");
				sb.append("\t\tmflo $t0\n");
				break;
			case DIV:
				sb.append("\t\tdiv $t1, $t2\n");
				sb.append("\t\tmflo $t0\n");
				break;
			case EQEQ:
				sb.append("\t\tseq $t0, $t1, $t2\n");
				break;
			case NOTEQ:
				sb.append("\t\tsne $t0, $t1, $t2\n");
				break;
			case GD:
				sb.append("\t\tsgt $t0, $t1, $t2\n");
				break;
			case LD:
				sb.append("\t\tslt $t0, $t1, $t2\n");
				break;
			case GDEQ:
				sb.append("\t\tsge $t0, $t1, $t2\n");
				break;
			case LDEQ:
				sb.append("\t\tsle $t0, $t1, $t2\n");
				break;
			case ANDAND:
				sb.append("\t\tli $t0, 0\n");
				sb.append("\t\tbeqz $t1, "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tbeqz $t2, "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli $t0, 1\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				break;
			case OROR:
				sb.append("\t\tli $t0, 1\n");
				sb.append("\t\tbnez $t1, "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tbnez $t2, "+etiquetaSalto+contadorSalto+"\n");
				sb.append("\t\tli $t0, 0\n");
				sb.append("\t"+etiquetaSalto+contadorSalto+":\n");
				contadorSalto++;
				sb.append("\t\tsle $t0, $t1, $t2\n");
				break;
			}
			
			sb.append("\t\tlw $t1,  ($sp) #Restauracion de $ra\n");
			sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
			sb.append("\t\tlw $t2,  ($sp) #Restauracion de $ra\n");
			sb.append("\t\tadd $sp,$sp,4 #liberacion de la pila\n");
		}
		return sb.toString();
	}

	/**
	 * Obtiene el valor numerico del nodo en el registro especifico para el tipo
	 * concreto del nodo
	 * 
	 * @return Codigo para obtener el valor numerico del nodo
	 */
	private String getValueCode(String registro) {
		switch (getVarTipoDelNodo()) {
		case FLOAT:
			return getFloatValueCode(registro);
		case INT:
			return getIntValueCode(registro);
		case CHAR:
			return getCharValueCode();

		default:
			return null;
		}
	}

	private String getIntValueCode(String registro) {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case VAR:
			switch (getVarTipoDelNodo()) {
			case FLOAT:
				sb.append("\t\tl.s $f0, ");
				sb.append(getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
				sb.append(conversionFloatInt("$f0", registro));
				break;
			default:
				sb.append("\t\tlw " + registro + ", ");
				sb.append(getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
				break;
			}
			break;
		case OPERATION:
			sb.append(getOperationCode());
			switch (getVarTipoDelNodo()) {
			case FLOAT:
				sb.append(conversionFloatInt("$f0", registro));
				break;
			default:
				sb.append("\t\tmove " + registro + ", $t0\n");
				break;
			}
			break;
		case CONSTANT:
			sb.append("\t\tli " + registro + ", ");
			sb.append(getIntAtr(NodeKeys.CONST_INT_VALUE));
			sb.append("\n");
			break;
		case FUNCTION_CALL:
			sb.append(getGloblCode());
			String tipo = getStrAtr(NodeKeys.TYPE);
			if ("float".compareTo(tipo) == 0) {
				sb.append(conversionFloatInt("$f0", registro));
			} else if ("void".compareTo(tipo) == 0) {
				Generator.ERROR = true;
			} else {
				sb.append("\t\tmove " + registro + ", $v0\n");
			}
			break;
		default:
			break;
		}

		return sb.toString();
	}

	private String getCharValueCode() {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case OPERATION:
			sb.append(getOperationCode());
			//TODO FALTA todo lo del registro que hay en int y en float
			break;
		case CONSTANT:
			sb.append("\t\tli $t0, ");
			sb.append(getCharAtr(NodeKeys.CONST_CHAR_VALUE));
			sb.append("\n");
			break;
		case FUNCTION_CALL:
			sb.append(getGloblCode());
			String tipo = getStrAtr(NodeKeys.TYPE);
			if ("float".compareTo(tipo) == 0) {
				Generator.ERROR = true;
			} else if ("void".compareTo(tipo) == 0) {
				Generator.ERROR = true;
			} else {
				sb.append("\t\tmove $t0, $v0\n");
			}
			break;
		default:
			break;
		}

		return sb.toString();
	}

	private String getFloatValueCode(String registro) {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case VAR:
			switch (getVarTipoDelNodo()) {
			case FLOAT:
				sb.append("\t\tl.s " + registro + ", ");
				sb.append(getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
				break;
			default:
				sb.append("\t\tlw $t0, ");
				sb.append(getStrAtr(NodeKeys.VAR_ID) + "_var");
				sb.append("\n");
				sb.append(conversionIntFloat("$t0", registro));
				break;
			}
			break;
		case OPERATION:
			sb.append(getOperationCode());
			switch (getVarTipoDelNodo()) {
			case FLOAT:
				sb.append("\t\tmov.s " + registro + ", $f0\n");
				break;
			default:
				sb.append(conversionIntFloat("$t0", registro));
				break;
			}
			break;
		case CONSTANT:
			sb.append("\t\tli.s " + registro + ", ");
			sb.append(getFloatAtr(NodeKeys.CONST_FLOAT_VALUE));
			sb.append("\n");
			break;
		case FUNCTION_CALL:
			sb.append(getGloblCode());
			String tipo = getStrAtr(NodeKeys.TYPE);
			if ("int".compareTo(tipo) == 0) {
				sb.append(conversionIntFloat("$v0", registro));
			} else if ("void".compareTo(tipo) == 0) {
				Generator.ERROR = true;
			} else {
				sb.append("\t\tmov.s " + registro + ", $f0\n");
			}
			break;
		default:
			break;
		}

		return sb.toString();
	}

	/**
	 * Se obtiene el codigo de generación de los hijos.
	 * 
	 * @return el codigo de generacion
	 */
	private String getChildernGlobCode() {
		StringBuilder sb = new StringBuilder();
		for (NodeAnalyzer hijo : hijos) {
			sb.append(hijo.getGloblCode());
		}
		return sb.toString();
	}

	/**
	 * Realiza una conversion de un registro float a entero TODO falta incluir
	 * un warning por la perdida de precision
	 * 
	 * @param f
	 *            registro float en el que se desea almacenar, ejm. $f0
	 * @param i
	 *            registro entero que contiene el dato, ejm. $t0
	 * @return Se retorna la cadena con el codigo
	 */
	private String conversionFloatInt(String f, String i) {
		StringBuilder sb = new StringBuilder();
		sb.append("\t\tcvt.w.s " + f + ", " + f + "\n");
		sb.append("\t\tmfc1 " + i + ", " + f + "\n");
		return sb.toString();
	}

	/**
	 * Realiza una conversion de un registro entero a float, no hay perdida de
	 * precision
	 * 
	 * @param i
	 *            registro entero que contiene el dato, ejm. $t0
	 * @param f
	 *            registro float en el que se desea almacenar, ejm. $f0
	 * @return Se retorna la cadena con el codigo
	 */
	private String conversionIntFloat(String i, String f) {
		StringBuilder sb = new StringBuilder();
		sb.append("\t\tmtc1 " + i + ", " + f + "\n");
		sb.append("\t\tcvt.s.w " + f + ", " + f + "\n");
		return sb.toString();
	}

	/**
	 * Obtiene el tipo de variable que almacena el nodo
	 * 
	 * @return Devuelve el tipo de variable (FLOAT, INT, CHAR), no incluye el
	 *         tipo VOID de las funciones
	 */
	private VarTipo getVarTipoDelNodo() {
		VarTipo ret = null;
		String aux;
		switch (nodeType) {
		case VARDEC:
		case FUNCTION_CALL:
		case CONSTANT:
			aux = getStrAtr(NodeKeys.TYPE);
			if ("int".compareTo(aux) == 0) {
				ret = VarTipo.INT;
			} else if ("char".compareTo(aux) == 0) {
				ret = VarTipo.CHAR;
			} else if ("float".compareTo(aux) == 0) {
				ret = VarTipo.FLOAT;
			}
			break;
		case VAR:
			aux = getStrAtr(NodeKeys.VAR_ID);
			ret = VarTable.getInstance().getVariableByCompleteName(aux).getVt();
			break;
		case OPERATION:
			VarTipo h1 = hijos.get(0).getVarTipoDelNodo();
			VarTipo h2 = hijos.get(1).getVarTipoDelNodo();
			if(h1 == VarTipo.FLOAT || h2 == VarTipo.FLOAT)
				ret = VarTipo.FLOAT;
			else if(h1 == VarTipo.INT || h2 == VarTipo.INT)
				ret = VarTipo.INT;
			else
				ret = VarTipo.CHAR;
			break;
		}
		return ret;
	}

	public NodeAnalyzer getLastChildren() {
		return hijos.getLast();
	}

}
