<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title><%="address"%></title>
</head>
<style>
#map-canvas {
	height: 300px;
	weight: 300px
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script src="app.js"></script>
</head>
<body>
	<%
    String address = request.getParameter("address");
	%>
	<div id="map-canvas"></div>
    <div class="container">
    <h1>What's around?</h1>
    </div>
<script>
	var map;
	var marker 
	function initialize() {
		getCoordinates("<%=address%>", function(coords) {
			var myLatlng = new google.maps.LatLng(coords[1],coords[0]);

			var mapOptions = {
				zoom : 15,
				center : myLatlng,
			};
			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions)
		
			marker = new google.maps.Marker({
			      position: myLatlng,
			      map: map,
			      title: "<%=address%>"
			});
	})
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</body>
</html>