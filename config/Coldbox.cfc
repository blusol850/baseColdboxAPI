component{

	// Configure ColdBox Application
	function configure(){
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= 'API-BASE',
			eventName 				= 'event',
			//Development Settings
			reinitPassword			= '',
			handlersIndexAutoReload = true,
			//Implicit Events
			defaultEvent			= 'Echo.index',
			requestStartHandler		= '',
			requestEndHandler		= '',
			applicationStartHandler = '',
			applicationEndHandler	= '',
			sessionStartHandler 	= '',
			sessionEndHandler		= '',
			missingTemplateHandler	= '',
			//Extension Points
			applicationHelper 			= '',
			viewsHelper					= '',
			modulesExternalLocation		= [],
			viewsExternalLocation		= '',
			layoutsExternalLocation 	= '',
			handlersExternalLocation  	= '',
			requestContextDecorator 	= '',
			controllerDecorator			= '',
			//Error/Exception Handling
			invalidHTTPMethodHandler = '',
			exceptionHandler		= '',
			invalidEventHandler			= '',
			customErrorTemplate		= '',
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			viewCaching				= false
		};

		// custom settings
		settings = { API_KEY = 'jE15H220&joMJZfaXZRPrw333!moDA71YP%S%WFJzjXP5Rr4A*nZr9ljg0*GPpv5L1gFF3&frZeUxR8aqZPvHf1Qpa8Uw6T4&MK%Dp1' };

		// module setting overrides
		moduleSettings = {
			
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = { development = 'localhost,127\.0\.0\.1' };

		// Module Directives
		modules = {
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = { coldboxTracer = { class='coldbox.system.logging.appenders.ConsoleAppender' } },
			// Root Logger
			root = {
				levelmax='INFO',
				appenders='*'
			},
			// Implicit Level Categories
			info = [ 'coldbox.system' ]
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = '',
			defaultView   = ''
		};

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			customInterceptionPoints = ''
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//SES
			{
				class='coldbox.system.interceptors.SES',
				properties={}
			}
		];

	}

	/**
	* Development environment
	*/
	function development(){
		coldbox.customErrorTemplate = '/coldbox/system/includes/BugReport.cfm';
	}

}
