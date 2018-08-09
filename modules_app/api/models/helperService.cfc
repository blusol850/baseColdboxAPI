component singleton{
    property name="objectPopulator" inject="wirebox:Populator";
    property name="wirebox" inject="wirebox";

     
    /**
    * Validate an object or structure according to the constraints rules.
    * @target An object or structure to validate
    * @fields The fields to validate on the target. By default, it validates on all fields
    * @constraints A structure of constraint rules or the name of the shared constraint rules to use for validation
    * @locale The i18n locale to use for validation messages
    * @excludeFields The fields to exclude in the validation
    * 
    * @return cbvalidation.model.result.IValidationResult
    */
    function validateModel(
        required any target,
        string fields='*',
        any constraints,
        string locale='',
        string excludeFields=''
    ){
        return getValidationManager().validate( argumentCollection=arguments );
    }

    /**
    * Retrieve the application's configured Validation Manager
    */
    function getValidationManager( ){
        return wirebox.getInstance( 'ValidationManager@cbvalidation' );
    } 
     

    function populateModels( required model, array data ){
        var r = [ ];
        var v = [ ];
        for( i=1;i LTE arrayLen( data );i=i+1 ){
            var oModel = wirebox.getInstance( model );
            var thisRow = populateModel( model=oModel, memento=data[i] );
            //writeDump( thisRow.getmemento() ); 
            var validationResults = validateModel( oModel );
            if( validationResults.hasErrors() ){
                arrayAppend( v, validationResults.getErrors()[1].getField() );
            } else{
                arrayAppend( r, thisRow.getMemento() );
            }
        }
        if( arrayLen( v ) ){
            onNotAuthorized( argumentCollection = arguments );
            return v;
        }
        return r;
    }
    
    /**
    * Populate a model object from the request Collection or a passed in memento structure
    * @model.hint The name of the model to get and populate or the acutal model object. If you already have an instance of a model, then use the populateBean() method
    * @scope.hint Use scope injection instead of setters population. Ex: scope=variables.instance.
    * @trustedSetter.hint If set to true, the setter method will be called even if it does not exist in the object
    * @include.hint A list of keys to include in the population
    * @exclude.hint A list of keys to exclude in the population
    * @ignoreEmpty.hint Ignore empty values on populations, great for ORM population
    * @nullEmptyInclude.hint A list of keys to NULL when empty
    * @nullEmptyExclude.hint A list of keys to NOT NULL when empty
    * @composeRelationships.hint Automatically attempt to compose relationships from memento
    * @memento A structure to populate the model, if not passed it defaults to the request collection
    * @jsonstring If you pass a json string, we will populate your model with it
    * @xml If you pass an xml string, we will populate your model with it
    * @qry If you pass a query, we will populate your model with it
    * @rowNumber The row of the qry parameter to populate your model with
    */
    function populateModel(
        required model,
        scope='',
        boolean trustedSetter=false,
        include='',
        exclude='',
        boolean ignoreEmpty=false,
        nullEmptyInclude='',
        nullEmptyExclude='',
        boolean composeRelationships=false,
        struct memento=getRequestCollection(),
        string jsonstring,
        string xml,
        query qry
    ){
        // Do we have a model or name
        if( isSimpleValue( arguments.model ) ){
            arguments.target = getModel( model );
        } else{
            arguments.target = arguments.model;
        }
        
        // json?
        if( structKeyExists( arguments, 'jsonstring' ) ){
            return ObjectPopulator.populateFromJSON( argumentCollection=arguments );
        }
        // XML
        else if( structKeyExists( arguments, 'xml' ) ){
            return ObjectPopulator.populateFromXML( argumentCollection=arguments );
        } 
        // Query
        else if( structKeyExists( arguments, 'qry' ) ){
            return ObjectPopulator.populateFromQuery( argumentCollection=arguments );
        }
        // Mementos
        else{
            // populate
            return ObjectPopulator.populateFromStruct( argumentCollection=arguments );
        }
    }
}