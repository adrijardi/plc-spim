import java.util.HashMap;
import java.util.LinkedList;
import java.util.Set;

public class NodeAnalyzer {

	private LinkedList<NodeAnalyzer> hijos;
	private LinkedList<NodeAnalyzer> hermanos;
	private String cad;
	// private String states = "";
	private NodeType nodeType;
	private HashMap<NodeKeys, String> nodeAtributes;

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
		if (nodeType != null) {
			switch (nodeType) {
			case VARDEC:
				String varname = getStrAtr(NodeKeys.VAR_ID);
				VarTipo tipo = null;
				try {
					tipo = VarTipo.valueOf(getStrAtr(NodeKeys.TYPE)
							.toUpperCase());
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
							setAtribute(NodeKeys.VAR_ID, var.getName()+var.getScope());
						}
					}
				}
				break;

			case FUNCTION_DEC:
				va.newScope();
				scope = true;
				break;
			
			case PRINTFSTRING:
				String value = getStrAtr(NodeKeys.STRING);
				if(value != null){
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
				System.out.println("Buscando Variable: "+varname);
				String scp = va.buscarVariable(varname);
				System.out.println("Encontrado : "+scp);
				if (scp != null) {
					if (scp.compareTo("0") != 0) {
						setAtribute(NodeKeys.VAR_ID, varname+scp);
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
		if (nodeType != null) {
			switch (nodeType) {
			case FUNCTION_DEC:
				String fname = getStrAtr(NodeKeys.FUNC_ID);
				if (fname.equals("main")) {
					sb.append(fname);
					sb.append(":\n");
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
				sb.append(getAsignationCode(getStrAtr(NodeKeys.ASIGNMENT),
						reciver, value));
				sb.append("\n");
				break;
			case PRINTFID:
				// TODO Falta controlar el tipo de dato a imprimir
				sb.append("\t\tlw $a0, ");
				sb.append(getStrAtr(NodeKeys.VAR_ID));
				sb.append("_var\n\t\tjal printf_int");
				sb.append("\n");
				break;
			case PRINTFSTRING:
				sb.append("\t\tla $a0, ");
				sb.append(getStrAtr(NodeKeys.STRING));
				sb.append("_str\n\t\tjal printf_str");
				sb.append("\n");
				break;
			case FUNCTION_CALL:
				sb.append("\t\tjal ");
				String func_id = getStrAtr(NodeKeys.FUNC_ID);
				sb.append(func_id);
				sb.append("_ini\n");
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
	private String getAsignationCode(String strAtr, NodeAnalyzer reciver,
			NodeAnalyzer value) {
		StringBuilder sb = new StringBuilder();
		if (strAtr.compareTo("=") == 0) {
			String tipo = value.getStrAtr(NodeKeys.TYPE);
			if (tipo.compareTo("float") == 0) {
				sb.append(value.getFloatValueCode());
				sb.append("\t\tsw.s $f0, ");
			} else if (tipo.compareTo("int") == 0) {
				sb.append(value.getIntValueCode());
				sb.append("\t\tsw $t0, ");
			} else if (tipo.compareTo("char") == 0) {
				sb.append(value.getCharValueCode());
				sb.append("\t\tsw $t0, ");
			}
			sb.append(reciver.getStrAtr(NodeKeys.VAR_ID));
			sb.append("_var");
		} else if (strAtr.compareTo("*=") == 0) {
			sb.append(strAtr);
		} else if (strAtr.compareTo("/=") == 0) {
			sb.append(strAtr);
		} else if (strAtr.compareTo("+=") == 0) {
			sb.append(strAtr);
		} else if (strAtr.compareTo("-=") == 0) {
			sb.append(strAtr);
		}
		return sb.toString();
	}

	private String getIntValueCode() {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case CONSTANT:
			sb.append("\t\tli $t0, ");
			sb.append(getIntAtr(NodeKeys.CONST_INT_VALUE));
			sb.append("\n");
			break;
		default:
			break;
		}

		return sb.toString();
	}

	private String getCharValueCode() {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case CONSTANT:
			sb.append("\t\tli $t0, ");
			sb.append(getCharAtr(NodeKeys.CONST_CHAR_VALUE));
			sb.append("\n");
			break;
		default:
			break;
		}

		return sb.toString();
	}

	private String getFloatValueCode() {
		StringBuilder sb = new StringBuilder();
		switch (nodeType) {
		case CONSTANT:
			sb.append("\t\taddi.s $f0, ");
			sb.append(getFloatAtr(NodeKeys.CONST_FLOAT_VALUE));
			sb.append("\n");
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

}
