import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Set;

public class VarTable {
	private final LinkedList<Integer> scope = new LinkedList<Integer>();
	private int nextNewScope = 1;
	// Almacenes para las tablas
	private final HashSet<Variable> global = new HashSet<Variable>();
	private final Hashtable<String, HashSet<Variable>> local = new Hashtable<String, HashSet<Variable>>();
	private final Hashtable<String, String> functions = new Hashtable<String, String>();
	private final Hashtable<String, String> strings = new Hashtable<String, String>();
	private int strid = 0;

	private VarTable() {
		scope.addFirst(new Integer(0));
	}

	/**
	 * SingletonHolder is loaded on the first execution of
	 * Singleton.getInstance() or the first access to SingletonHolder.INSTANCE,
	 * not before.
	 */
	private static class SingletonHolder {
		private final static VarTable INSTANCE = new VarTable();
	}

	/*
	 * Singleton
	 */
	public static VarTable getInstance() {
		return SingletonHolder.INSTANCE;
	}
	
	public String getScope() {
		StringBuilder sb = new StringBuilder();
		for (int i = scope.size() - 1; i > 0; i--) {
			sb.append(scope.get(i));
			sb.append('_');
		}
		sb.append(scope.get(0));
		return sb.toString();
	}

	public void newScope() {
		scope.addFirst(new Integer(nextNewScope));
		nextNewScope = 1;
	}
	
	public boolean addFunction(String id, String return_tipe){
		boolean ret = false;
		if(!functions.contains(id)){
			functions.put(id, return_tipe);
			ret = true;
		}
		return ret;	
	}
	
	public String getReturnforFuction(String id){
		return functions.get(id);
	}

	public boolean exitScope() {
		boolean ret = false;
		if (scope.size() > 1) {
			Integer i = scope.removeFirst();
			nextNewScope = i.intValue() + 1;
			ret = true;
		}
		return ret;
	}
	
	public String addString(String value){
		// TODO se puede optimizar si se dan las vuelta, y se almacena la clave en función del string
		String key = "str"+(strid++);
		strings.put(key, value);
		return key;
	}
	
	private String getStringByKey(String key){
		String s = strings.get(key);
		if(s != null){
			String s2 = s.substring(0, s.length()-1);
			s = s2+"\""; //TODO: para linux +"\\0\"";
		}
		return s;
	}


	public boolean addVariable(Variable var) {
		boolean ret = true;
		if (var != null) {
			if (scope.size() == 1) {
				if (global.contains(var)) {
					ret = false;
				} else {
					global.add(var);
				}
			} else {
				if (local.containsKey(var.getName())) {
					HashSet<Variable> hs = local.get(var.getName());
					String scope = getScope();
					if (buscarConflicto(hs, scope) != null) {
						ret = false;
					} else {
						var.setScope(scope);
						hs.add(var);
					}

				} else {
					HashSet<Variable> hs = new HashSet<Variable>();
					var.setScope(getScope());
					hs.add(var);
					local.put(var.getName(), hs);
				}
			}
		} else {
			ret = false;
		}
		return ret;
	}

	private String buscarConflicto(HashSet<Variable> hs, String scope) {
		boolean check = false;
		String ret = null;
		int pos = scope.indexOf('_');
		int pos2 = scope.indexOf('_', pos + 1);

		while (pos2 != -1 && !check) {
			String aux = scope.substring(0, pos2);
			
			//check = hs.contains(aux);
			for (Variable variable : hs) {
				if(variable.equals(aux))
					check = true;
			}
			
			if (check)
				ret = aux;
			pos = pos2;
			pos2 = scope.indexOf('_', pos + 1);
		}

		if (!check){
			//check = hs.contains(scope);
			for (Variable variable : hs) {
				if(variable.equals(scope))
					check = true;
			}
			if(check)
				ret = scope;
		}
			

		return ret;
	}

	/**
	 * 
	 * @param var
	 *            variable a buscar
	 * @return null si no la encuentra
	 */
	public String buscarVariable(String var) {
		String ret = null;		
		Set<String> ids = local.keySet();
		for (String key : ids) {
			if(key.equals(var)){
				HashSet<Variable> hs = local.get(key);
				ret = buscarConflicto(hs, getScope());
			}
		}
		
		if(ret == null){
			for (Variable variable : global) {
				if(variable.equals(var))
					ret = "0";
			}
		}


		return ret;
	}
	
	public Variable getVariableByCompleteName(String var){
		Variable ret = null;
		for (Variable variable : global) {
			if(variable.equals(var))
				ret = variable;
		}
		
		if(ret == null){
			Set<String> ids = local.keySet();
			for (String key : ids) {
				HashSet<Variable> hs = local.get(key);
				for (Variable v : hs) {
					if((v.getName()+v.getScope()).compareTo(var)==0){
						ret = v;
					}
				}
			}
		}

		return ret;
	}

	public void printTable() {
		HashSet<Variable> hsvar;
		System.out.println("\n---Globales");
		for (Variable s : global) {
			System.out.println(s);
		}
		System.out.println("\n---Locales");
		Set<String> ids = local.keySet();
		for (String var : ids) {
			System.out.println(var);
			hsvar = local.get(var);
			for (Variable scope : hsvar) {
				System.out.println("\t" + scope);
			}
		}
	}

	public String getDataCode() {
		StringBuilder sb = new StringBuilder();
		for (Variable variable : global) {
			
				sb.append(variable.getName());
				sb.append("_var:\t\t");
				switch (variable.getVt()) {
				case INT:
					sb.append(".word ");
					if(variable.getSize() == null){
						if (variable.isValue())
							sb.append(variable.getIvalue());
						else
							sb.append(0);
					}else{
						int size[] = variable.getSize();
						int count = 1;
						for (int i = 0; i < size.length; i++) {
							count *= size[i];
						}
						for (int i = 0; i < count-1; i++) {
							sb.append(0);
							sb.append(", ");
						}
						
						sb.append(0);
					}
					break;
				case CHAR:
					sb.append(".word ");
					if (variable.isValue())
						sb.append(variable.getCvalue());
					else
						sb.append(0);
					break;
				case FLOAT:
					sb.append(".float ");
					if(variable.getSize() == null){
						if (variable.isValue()){
							float f = variable.getFvalue();
							sb.append(f);
							
						}else
							sb.append("0.0");
					}else{
						int size[] = variable.getSize();
						int count = 1;
						for (int i = 0; i < size.length; i++) {
							count *= size[i];
						}
						for (int i = 0; i < count-1; i++) {
							sb.append("0.0");
							sb.append(", ");
						}
						
						sb.append("0.0");
					}
					break;
				}
				sb.append("\n");
		}
		
		HashSet<Variable> hsvar;
		Set<String> ids = local.keySet();
		for (String var : ids) {
			//System.out.println(var);
			hsvar = local.get(var);
			for (Variable variable : hsvar) {
				sb.append(variable.getName());
				sb.append(variable.getScope());
				sb.append("_var:\t\t");
				switch (variable.getVt()) {
				case INT:
					sb.append(".word ");
					if(variable.getSize() == null){
						if (variable.isValue())
							sb.append(variable.getIvalue());
						else
							sb.append(0);
					}else{
						int size[] = variable.getSize();
						int count = 1;
						for (int i = 0; i < size.length; i++) {
							count *= size[i];
						}
						for (int i = 0; i < count-1; i++) {
							sb.append(i);
							sb.append(", ");
						}
						
						sb.append(0);
					}
					break;
				case CHAR:
					sb.append(".word ");
					if (variable.isValue())
						sb.append(variable.getCvalue());
					else
						sb.append(0);
					break;
				case FLOAT:
					sb.append(".float ");
					if(variable.getSize() == null){
						if (variable.isValue()){
							float f = variable.getFvalue();
							sb.append(f);
							
						}else
							sb.append("0.0");
					}else{
						int size[] = variable.getSize();
						int count = 1;
						for (int i = 0; i < size.length; i++) {
							count *= size[i];
						}
						for (int i = 0; i < count-1; i++) {
							sb.append("0.0");
							sb.append(", ");
						}
						
						sb.append("0.0");
					}
					break;
				}
				sb.append("\n");
			}
		}
		
		ids = strings.keySet();
		String strval;
		for (String key : ids) {
			strval = getStringByKey(key);
			sb.append(key);
			sb.append("_str");
			sb.append(":\t\t.asciiz ");
			sb.append(strval);
			sb.append("\n");
		}
		
		sb.append("ln_str");
		sb.append(":\t\t.asciiz \"\\n\"");
		sb.append("\n");

		return sb.toString();
	}

	public boolean isGlobal() {
		if(scope.size() == 1)
			return true;
		return false;
	}
}
