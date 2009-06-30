public class Variable {

	private final String name;
	private final VarTipo vt;
	private String scope;
	private boolean value;

	public String getScope() {
		return scope;
	}

	public boolean isValue() {
		return value;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	private int ivalue;
	private char cvalue;
	private float fvalue;

	public Variable(String name, VarTipo vt) {
		this.name = name;
		this.scope = name;
		this.vt = vt;
		this.value = false;
	}

	public Variable(String name, int value, VarTipo vt) {
		this(name, vt);
		this.ivalue = value;
		this.cvalue = (char) value;
		this.fvalue = value;
		this.value = true;
	}

	public Variable(String name, char value, VarTipo vt) {
		this(name, vt);
		this.ivalue = value;
		this.cvalue = value;
		this.fvalue = value;
		this.value = true;
	}

	public Variable(String name, float value, VarTipo vt) {
		this(name, vt);
		this.ivalue = (int) value;
		this.cvalue = (char) value;
		this.fvalue = value;
		this.value = true;
	}

	public String getName() {
		return name;
	}

	public VarTipo getVt() {
		return vt;
	}

	public int getIvalue() {
		return ivalue;
	}

	public char getCvalue() {
		return cvalue;
	}

	public float getFvalue() {
		return fvalue;
	}
	
	public String getCompleteName(){
		StringBuilder sb = new StringBuilder();
		sb.append(name);
		if(name.compareTo(scope)!= 0)
			sb.append(scope);
		return sb.toString();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Variable)
			return this.scope.equals(((Variable) obj).getScope());
		else if (obj instanceof String)
			return this.scope.equals(obj);
		return super.equals(obj);
	}

	@Override
	public int hashCode() {
		return scope.hashCode();
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(vt);
		sb.append(" ");
		sb.append(name);
		if (!scope.equals(name))
			sb.append(scope);
		if (value) {
			sb.append(" ");
			switch (vt) {
			case INT:
				sb.append(ivalue);
				break;
			case CHAR:
				sb.append(cvalue);
				break;
			case FLOAT:
				sb.append(fvalue);
				break;
			}
		}

		return sb.toString();
	}

}
