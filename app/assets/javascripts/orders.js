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

})

});//END DOCUMENT READY FUNCTION
