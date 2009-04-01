public enum NodeKeys {
	VAR_ID("String"),
	CONST_INT_VALUE("int"),
	CONST_FLOAT_VALUE("float"),
	CONST_CHAR_VALUE("char"),
	TYPE("String"),
	ARRAY_DIM("int");

	private final String type;

	public String getType() {
		return type;
	}

	private NodeKeys(String type) {
		this.type = type;
	}
}
