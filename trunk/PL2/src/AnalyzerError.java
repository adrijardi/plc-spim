
public class AnalyzerError {
	private int line;
	private String msg; 
	
	AnalyzerError(int line, String msg){
		this.line = line;
		this.msg = msg;
	}

	public int getLine() {
		return line;
	}

	public String getMsg() {
		return msg;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Error en linea: ");
		sb.append(line);
		if(msg != null && msg.length()>0){
			sb.append(System.getProperty("line.separator"));
			sb.append("\t");
			sb.append(msg);
		}
		return sb.toString();
	}

}
