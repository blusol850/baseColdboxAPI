component {
    property name = "mockdata"        inject = "mockdata@mockdatacfc";
    property name = "wirebox"         inject = "wirebox";
    property name = "helperService"   inject = "helperService@api";
    property name = "jwt"             inject = "provider:JWTService@jwt";
    property name = "API_KEY"         inject = "coldbox:setting:API_KEY";

    function init(){
        return true;
    }

    
    
    function get(){
        var oOrders = mockdata.mock(
            'num'         = 40,
            'orderNumber' = 'id',
            'quoteNumber' = 'id',
            'item'        = 'id',
            'description' = 'lorem',
            'PONumber'    = 'id',
            'promiseDate' = 'date',
            'unitPrice'   = 'money',
            'status'      = 'oneof:New:Queued'
        );
        return oOrders;
    }



}
