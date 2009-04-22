import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Set;

public class VarTable {
	private final LinkedList<Integer> scope = new LinkedList<Integer>();
	private int nextNewScope = 1;
	// Almacenes para las tablas
	private final HashSet<String> global = new HashSet<String>();
	private final Hashtable<String, HashSet<String>> local = new Hashtable<String, HashSet<String>>();

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
			sb.append('.');
		}
		sb.append(scope.get(0));
		return sb.toString();
	}

	public void newScope() {
		scope.addFirst(new Integer(nextNewScope));
		nextNewScope = 1;
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

	public boolean addVariable(String var) {
		boolean ret = true;
		if (var != null) {
			if (scope.size() == 1) {
				if (global.contains(var)) {
					ret = false;
				} else {
					global.add(var);
				}
			} else {
				if (local.containsKey(var)) {
					HashSet<String> hs = local.get(var);
					String scope = getScope();
					if (buscarConflicto(hs, scope) != null) {
						ret = false;
					} else {
						hs.add(scope);
					}

				} else {
					HashSet<String> hs = new HashSet<String>();
					hs.add(getScope());
					local.put(var, hs);
				}
			}
		}else{
			ret = false;
		}
		return ret;
	}

	private String buscarConflicto(HashSet<String> hs, String scope) {
		boolean check = false;
		String ret = null;
		int pos = scope.indexOf('.');
		int pos2 = scope.indexOf('.', pos + 1);

		while (pos2 != -1 && !check) {
			String aux = scope.substring(0, pos2);
			check = hs.contains(aux);
			if (check)
				ret = aux;
			pos = pos2;
			pos2 = scope.indexOf('.', pos + 1);
		}

		if (!check && hs.contains(scope))
			ret = scope;

		return ret;
	}

	/**
	 * 
	 * @param var
	 *            variable a buscar
	 * @return null si no la encuentra
	 */
	private String buscarVariable(String var) {
		String ret = null;
		if (local.containsKey(var)) {
			HashSet<String> hs = local.get(var);
			ret = buscarConflicto(hs, getScope());
		} else if (global.contains(var)) {
			ret = "0";
		}

		return ret;
	}

	public void printTable() {
		HashSet<String> hsvar;
		System.out.println("\n---Globales");
		for (String s : global) {
			System.out.println(s);
		}
		System.out.println("\n---Locales");
		Set<String> ids = local.keySet();
		for (String var : ids) {
			System.out.println(var);
			hsvar = local.get(var);
			for (String scope : hsvar) {
				System.out.println("\t" + scope);
			}
		}
	}

}
