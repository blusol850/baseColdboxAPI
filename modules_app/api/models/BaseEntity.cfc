component accessors="true"  {

    function init( ){
        return this;
    }

    /**
    * Build out property mementos
    * Date/Time objects are produced as UTC milliseconds since January 1, 1970 (Epoch)
    */
    private struct function getBaseMemento( required properties, excludes='' ){
        var result = {};

        // add in base properties
        arguments.properties.addAll( [ ] );

        // properties
        for( var thisProp in arguments.properties ){
            if( structKeyExists( variables, thisProp ) && !listFindNoCase( arguments.excludes, thisProp ) ){
                if( isDate( variables[ thisProp ] ) ){
                    //ISO 8601 time
                    //result[ thisProp ] = dateFormat( variables[ thisProp ], "yyyy-MM-dd" ) & "T" & timeFormat( variables[ thisProp ], "HH:mm:ss" );    
                    //result[ thisProp ] = variables[ thisProp ].getTime();
                    result[ thisProp ] = variables[ thisProp ];
                } else{
                    result[ thisProp ] = variables[ thisProp ];
                }
            } else if( !listFindNoCase( arguments.excludes, thisProp ) ){
                result[ thisProp ] = '';
            }
        }

        return result;
    }

}