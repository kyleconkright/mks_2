$('document').ready(function() {
	
	//submit size and quantity
	$('#quote_form').on('submit', function(evt){
		evt.preventDefault();

		var size = $('#quote_form select[name=size]').val();
		var quantity = $('#quote_form input[name=quantity]').val();

		$.post("/getquote?" + "size="+size+"&quantity="+quantity, function(data){
			// console.log(data);
			if(data.statusCode === 400)
				return data
			else
				finalPurchase(data)
		})
	});

	//get quote
	var finalPurchase = function(data){
		var orderToken = data.orderToken
		var purchase_form = $('#purchase_form');
		$('#quote_form').fadeOut(200,function(){purchase_form.fadeIn(200)});
		
		purchase_form.find('p.total').text(data.total)

		purchase_form.on('submit', function(evt){
			evt.preventDefault();
			console.log(orderToken)
			$.post("/confirm?" + "order_token="+orderToken, function(data){
				console.log(data);
				orderConfirmed(data);
			})
		})
	}


	//SUCCESS
	var orderConfirmed = function(data){
		$('#purchase_form').fadeOut(200, function(){$('#purchase_confirmed').fadeIn(200)})
	}
});


