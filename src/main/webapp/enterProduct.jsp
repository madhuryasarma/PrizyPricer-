<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Product and its Price</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<script type="text/javascript">
	function sendData() {
		var name = $('#name').val();
		var description = $('#description').val();
		var price = $('#price').val();
		var store = $('#store').val();
		var notes = $('#notes').val();

		var jsonDataObject = new Object();
		jsonDataObject.name = name;
		jsonDataObject.description = description;
		jsonDataObject.price = price;
		jsonDataObject.store = store;
		jsonDataObject.notes = notes;

		var jsonString = JSON.stringify(jsonDataObject);

		$.ajax({
			type : "POST",
			url : "product",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			data : jsonString,
			success : function(result) {
				$('#name').val('');
				$('#description').val('');
				$('#price').val('');
				$('#store').val('');
				$('#notes').val('');
				$('#output').html("<strong>Product Added!</strong>");
			}
		});
	}
</script>
</head>
<body>
		<div
			style="margin-left: 300px; margin-top: 110px; background-color: #5FB404; padding: 20px; width: 650px; height: 450px">
			<a href = "index.jsp">Home</a>
			<h1>
				<center>Product Entry Form</center>
			</h1>
			<pre>
<p style="font-size: 20px">
NAME          :<input type="text" name="name" id="name">
DESCRIPTION   :<input type="text" name="description" id="description">
PRICE         :<input type="text" name="price" id="price">
STORE         :<input type="text" name="store" id="store">
NOTES         :<input type="text" name="notes" id="notes">

				<center>
					<button onclick="sendData()" style="padding: 7px">Add Product</button> 
				</center>
<div id = "output"></div>
</p>
			</pre>

		</div>
</body>
</html>