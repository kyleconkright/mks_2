$(document).ready(function(){

	//this is the URL that we're going to reuest the JSON from
	var API_BASE = '/api/orders';

	function addOrder(jqElem, data){
		var id = data.id;
		var status = data.status;
		var size = data.size;
		var created_at = data.created_at;
		var listItem = "<strong>Order ID: </strong>" + id +  "<br>";
		listItem += "<strong>Status: </strong>" + status +  "<br>";
		listItem += "<strong>Size: </strong>" + size + "<br>";
		listItem += "<strong>Ordered On: </strong>" + created_at + "<br>" + "<br>";
		jqElem.append("<li>" + listItem + "</li>");
		console.log(listItem);
	  };

	//The response from the server will be saved to this variable 'json'
	var json = $.ajax({
		datatype: 'json',
		type: 'GET',
		url: API_BASE,
		data: {}
	});//end json variable

	//when the response from the server is done, this is what we want to do with it
	json.done(function(data){
		var i;
		for(i=0; i < data.length; i++){
			console.log(data[i]);
			addOrder( $('#orders'), data[i] )
		}//end of for loop
	});//end json.done function

	//If the request fails, this is what we want to do with it
	json.fail(function(data){
		$('#orders').html("<h2>FAILED TO LOAD</h2>");

	});



	
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



