
public class StateAnalyzer {
	public enum DeclarationStates{
		FUNCTIONS, GLOBAL;
	}
	
	private DeclarationStates decStates = DeclarationStates.GLOBAL;
	
	public void changeDecStates(){
		decStates = DeclarationStates.FUNCTIONS;
	}
	
	public boolean isDecStates(DeclarationStates ds){
		return decStates.equals(ds);
	}

	public DeclarationStates getDecStates() {
		return decStates;
	}

}
