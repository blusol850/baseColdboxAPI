/**
* My RESTFul Event Handler
*/
component {
	property name="jwt" 	inject="provider:JWTService@jwt";
	property name="API_KEY" inject="coldbox:setting:API_KEY";

	/**
	* Index
	*/
	any function index( event, rc, prc ){
		var payload= {
			'Name' :'Andrew Davis',
			'eMail':'andrew@bluewatersolutions.com',
			'ID'   : 100,
		};
		var token= jwt.encode( payload, API_KEY ) ;

		writeOutput( '<h3>Sample Bearer Token:</h3>' );
		writeDump( token );

		writeOutput( '<h3>jwt.decode( token, API_KEY )</h3>' );
		writeDump( jwt.decode( token, API_KEY ) );

		writeOutput( '<h3>jwt.verify( token, API_KEY)</h3>' );
		writeDump( jwt.verify( token, API_KEY ) );

		abort;
	}
	
}
