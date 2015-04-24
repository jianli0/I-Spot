<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Spots</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style>
      html, body, #map-canvas {
        height: 410px
        }
    </style>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places,weather&signed_in=true"></script>
<script>
  // List the search result
var map;
var service



function initialize() {

	
  var markers = [];
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
 
  function handleSearchResults(results, status)
  {
  	console.log(results);
  	 for(var i=0; i< results.length; i++)
  	{    console.log(results[i].vicinity);	
  		  var adr = JSON.stringify(results[i].vicinity); 
  	      var marker = new google.maps.Marker({
  	    	    position: results[i].geometry.location,
  	    	    map: map
  		 }); 
  		 var content = "<a href=Map.jsp?address="+adr+" class=list-group-item active>"+results[i].name+"</a>";
 
  		 $("#around").append(content);
  	
  	
  	} 
  }

  // Search
  function performSearch()
  {
  	var request = {
  			bounds: map.getBounds(),
  			type: ["establishment","history"]
  	}
  	service.nearbySearch(request, handleSearchResults);
  }
  


  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-33.8902, 151.1759),
      new google.maps.LatLng(-33.8474, 151.2631));
  map.fitBounds(defaultBounds);

  // Create the search box and link it to the UI element.
  var input = (
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
      
      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });
  // [END region_getplaces]

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
//define geolocation
  if(navigator.geolocation) 
  {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'My Spot'
      });
      
       var marker = new google.maps.Marker({
    	    position: pos,
    	    map: map
    	}); 
      
      service = new google.maps.places.PlacesService(map);
      
      google.maps.event.addListenerOnce(map, 'bounds_changed', performSearch);

      $('#refresh').click(performSearch);
            
      //traffic
      var trafficLayer = new google.maps.TrafficLayer();
      $('#toggle_traffic').click(function(){
    	  if(trafficLayer.getMap()){
    		  trafficLayer.setMap(null);
    	  }
    	  else{
    		  trafficLayer.setMap(map);
    	  }
    	  
      });
      
      //weather
  var weatherLayer = new google.maps.weather.WeatherLayer({
     temperatureUnits: google.maps.weather.TemperatureUnit.FAHRENHEIT
  	});
      var cloudLayer = new google.maps.weather.CloudLayer();
      $('#toggle_weather').click(function(){
    	  if(weatherLayer.getMap()||cloudLayer.getMap()){
    		  weatherLayer.setMap(null);
    		  cloudLayer.setMap(null);
    	  }
    	  else{
    		  weatherLayer.setMap(map);
    		  cloudLayer.setMap(map);
    	  }
    	  
      });  
      
       
      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
    
  } 
  
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <style>
      #target {
        width: 345px;
      }
    </style>
  </head>
  <body>
    <h1>Spots</h1>
                <div class="well">
                    <h4>Spot Search</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchtext" name="q">
                        <span class="input-group-btn">
                            <button  class="btn btn-primary" onclick="myFunction()" type="submit" value="Search It">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                    </div>	
	
	</form>
	<script>
		function myFunction() {
			var search = document.getElementById("searchtext").value;
			window.location = 'SpotSearchResult.jsp?q=' + search;
			;
		}
	</script>
</div>
    <input id="pac-input" class="controls" type="text" size="100" placeholder="Search Spot">
    <div id="map-canvas"></div>
    <button id="refresh">Refresh</button>
<button id="toggle_traffic">Traffic</button>
<button id="toggle_weather">Weather</button>
		<%
		UserDAO user_dao = new UserDAO();
 		SpotDAO spot_dao = new SpotDAO();
		Integer user_id = (Integer)session.getAttribute("user_id");
		String action = request.getParameter("action");	
		User user = user_dao.readUserById(user_id);  

		if("subscribe".equals(action))
			{	 		
			  String idStr1 = request.getParameter("spotid");
			  Integer spot_id = Integer.parseInt(idStr1);	
			  Spot spot = spot_dao.readSpotById(spot_id);
			  user_dao.subscribeSpot(user_id, spot);
			} 
		
		else if("unsubscribe".equals(action))
		{	 		
		  	String idStr1 = request.getParameter("spotid");
		  	Integer spot_id = Integer.parseInt(idStr1);	
		 	Spot spot = spot_dao.readSpotById(spot_id);
			user_dao.unsubscribeSpot(user_id, spot);
		} 
		 
		else if("upload".equals(action))
		{
		  	String idStr1 = request.getParameter("spotid");
		  	%>
				<script>window.location= "Upload.jsp?spot_id=<%=idStr1 %>";</script>
			<% 
		  }
		else if("create".equals(action))
		{
			String locationname= request.getParameter("locationname");
			String address = request.getParameter("address");
			
			Spot spot = new Spot(null,locationname,address);
			spot_dao.createSpot(spot);
		}

		List<Spot> spots = spot_dao.readAllSpots();
		%>	
		 
		 
		 <form action="All_Spots.jsp">
		 <table class="table table-striped"> 
		 <tr>
				<td><input name="locationname" class="form-control" placeholder="LocationName"/></td>
				<td><input name="address" class="form-control" placeholder="Address"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create">Create</button>
				</td>
			</tr>	
		   <tr>
		     			<th>locationName</th>
						<th>address</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
		   </tr>				
	<%  
		for (Spot spot : spots)
		{  
	%>
   <tr>
	<td> 
		<a href="Map.jsp?address=<%=spot.getAdress()%>"><%=spot.getLocationname()%></a>
	</td>
	<td><%=spot.getAdress()%></td>
	<td>
	<% if (user.IsSubed(spot)){
	%><a href="All_Spots.jsp?&action=unsubscribe&spotid=<%=spot.getId()%>"class="btn btn-danger">UnSubscribe</a>
	<% } 
	else{ 
		%><a href="All_Spots.jsp?id=<%=user.getId()%>&action=subscribe&spotid=<%=spot.getId()%>"class="btn btn-success">Subscribe</a>
		<% 
	}%>
	</td>
  	<td>
  	<a href="All_Spots.jsp?action=upload&spotid=<%=spot.getId()%>" class="btn btn-primary">UpLoad</a>
  	</td>

  </tr>	
<% } 

%>
	</table>
	</form>
	 <h1>Your Around Spots</h1>
	 <div class="list-group" id="around"></div>
  </body>
</html>