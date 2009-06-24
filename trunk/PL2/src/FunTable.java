import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Set;

import sun.print.resources.serviceui;



public class FunTable {
	private Hashtable<String, LinkedList<Variable>> functions;
	private static FunTable INSTANCE = null;
	private String actualKey;

	public String getActualKey() {
		return actualKey;
	}

	public void setActualKey(String actualKey) {
		this.actualKey = actualKey;
	}

	// Private constructor suppresses 
	private FunTable() {
		functions = new Hashtable<String, LinkedList<Variable>>();
	}

	// creador sincronizado para protegerse de posibles problemas  multi-hilo
	// otra prueba para evitar instanciación múltiple 
	private synchronized static void createInstance() {
		if (INSTANCE == null) {
			INSTANCE = new FunTable();
		}
	}

	public static FunTable getInstance() {
		if (INSTANCE == null)
			createInstance();
		return INSTANCE;
	}
	
	public boolean addFunction(String func){
		if(functions.containsKey(func)){
			return false;
		}else{
			functions.put(func, new LinkedList<Variable>());
			return true;
		}
	}
	
	public boolean addParameter(String func, Variable param){
		if(functions.containsKey(func)){
			LinkedList<Variable> params = functions.get(func);
			params.addLast(param);
			return true;
		}else{
			return false;
		}
	}
	
	public int getParamsSize(String func){
		if(functions.containsKey(func)){
			return functions.get(func).size();
		}else{
			return -1;
		}
	}
	
	public LinkedList<Variable> getParams(String func){
		if(functions.containsKey(func)){
			return functions.get(func);
		}else{
			return null;
		}
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("---FUNTABLE\n");
		Set<String> keys = functions.keySet();
		LinkedList<Variable> p;
		for (String key : keys) {
			sb.append(key+"( ");
			p = functions.get(key);
			for (Variable param : p) {
				sb.append(param.getName()+param.getScope()+" ");
			}
			sb.append(")\n");
		}
		return sb.toString();
	}
	
	public void printTable(){
		System.out.println(toString());
	}
	
	
}
