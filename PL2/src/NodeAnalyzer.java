import java.util.LinkedList;


public class NodeAnalyzer {
	
	private LinkedList<NodeAnalyzer> hijos;
	private String cad;
	
	public NodeAnalyzer(String cad){
		this.cad = cad;
		hijos = new LinkedList<NodeAnalyzer>();
	}
	
	public boolean addHijo(NodeAnalyzer hijo){
		return hijos.add(hijo);
	}
	
	public void print(int level){
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < level; i++){
			sb.append("-");
		}
		sb.append(cad);
		System.out.println(sb);
		for (NodeAnalyzer hijo : hijos) {
			hijo.print(level++);
		}
	}

}
