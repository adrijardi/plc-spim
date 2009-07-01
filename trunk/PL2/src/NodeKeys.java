public enum NodeKeys {
	VAR_ID("String"),
	CONST_INT_VALUE("int"),
	CONST_FLOAT_VALUE("float"),
	CONST_CHAR_VALUE("char"),
	TYPE("String"),
	ARRAY_DIM("int"),
	ASIGNMENT("String"),
	DEBUG("int"),
	FUNC_ID("String"),
	STRING("String"), 
	IS_PARAM("boolean"), PARAM_POS("int"), OPERATION("String");

	private final String type;

	public String getType() {
		return type;
	}

	private NodeKeys(String type) {
		this.type = type;
	}
}
