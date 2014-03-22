component hint="fusion reactor API interaction" extends="coldbox.system.plugin" output="false" singleton {

	function init(required controller) {
		super.init(argumentCollection=arguments);
		setpluginName("FusionReactor Plugin");
		setpluginVersion("1.1");
		setpluginDescription("This is a plugin for interacting with FusionReactor API.");

		try {
			variables.fr = createObject("java", "com.intergral.fusionreactor.api.FRAPI").getInstance(); 
			variables.frEnabled = true;
		} catch (any e) { 
			// Fusion Reactor is not installed...
			variables.frEnabled = false;
		}

		return this;
	}

	string function setMarker(required string out){
		if (isFrapiEnabled())
			getFrapi().trace(arguments.out);
			
		return arguments.out;
	}

	private function getFrapi(){
		return variables.fr;
	}

	private boolean function isFrapiEnabled(){
		return variables.frEnabled;
	}

}