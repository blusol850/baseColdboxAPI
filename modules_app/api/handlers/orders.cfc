component extends="api.handlers.BaseHandler"{
	property name 	= "orderService" 				inject = "orderService@api";

    function  index( event, rc, prc )  secured="admin"{		
		var r = {};
		r['orders'] = orderService.get();
		prc.response.setData( r );
	};



}
