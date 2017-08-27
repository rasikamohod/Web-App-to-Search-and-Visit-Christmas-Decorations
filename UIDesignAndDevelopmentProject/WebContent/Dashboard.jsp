<!DOCTYPE html>
<html lang="en">
<head>
  <title>Christmas Lights</title>
   <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/Snowflakes.js"></script>
  
  <style>
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
      position: fixed;
      left:0px;
	   bottom:0px;
	   height:30px;
	   width:100%;
    }
     /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height:;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      
body {
	/*You can use any kind of background here.*/
	background: linear-gradient(to bottom, #000000 20%, #003399 100%);
	/*background: linear-gradient(to top, #000000 20%, #003399 100%);*/
	margin: 0; height: 100%; overflow: hidden
}
canvas {
	display: block;
	position: absolute;
	margin: 0; 
}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse" style="height:15%;background-image: url('img/header-lights-image.jpg');background-repeat: no-repeat">
  <div class="container text-center">
    <div class="navbar-header">
		<h1>
			<b>Christmas Lights</b>
		</h1>
    </div>
  </div>
</nav>
 
 <canvas id="canvas"></canvas>
<div class="container text-center" style="height:500px">
  <div class="row" style="height:500px">
    <div class="col-sm-3 well" style="height:500px">
      <div class="well" style="height:50%">
        <p>Enter the address in the search box below in which vicinity you want to view Christmas Lights displays</p>
        <form class="navbar-form navbar-right" role="search">
        <div class="form-group input-group">
          <input id="search-input" autofocus="autofocus" type="text" class="form-control" style="float:left;margin-right:20px" placeholder="Search..">
        </div>
      </form>
      </div>
      <div class="well" style="height:45%">
        <p>You know an amazing new Christmas lights location? Want to share it with everyone? Do add here.</p>
        <p>
          <button type="button" class="btn btn-primary btn-med" data-toggle="modal" data-target="#AddLocationModal">Add New Location</button>
        </p>
        <!-- Modal -->
			<div id="AddLocationModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">Add New Location</h4>
			      </div>
			      <div class="modal-body">
			       	 <form class="form-horizontal">
						  <div class="form-group" >
						    <label class="control-label col-sm-2" for="address"  >Street Address:</label>
						    <div class="col-sm-10">
						      <input type="text" autofocus="autofocus" class="form-control" id="address"  placeholder="Enter Street Address" required>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="zipcode" style="text-align:left">Zip Code:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="zipcode"  placeholder="Enter Valid Zip Code" required>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="review" style="text-align:left">Write Review:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="review"  placeholder="Review">
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-info btn-med" style="float: left;">Submit</button>
						    </div>
						  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			
			  </div>
			</div>
	      </div>
	    </div>
    
    
    <div class="col-sm-9" style="height:100%">
    
      <div class="row" >
        <div class="col-sm-12" style="height:20%">
          <div class="panel panel-default text-left" style="margin-bottom:5px">
            <div class="panel-body" style="height:20%">
              <p contenteditable="true">Status: Feeling Blue</p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row" style="mrgin-top:-10px">
        <div class="col-sm-12" style="height:80%">
          <div class="well" style="height:80%">
           	<div id="map" style="height:392px; width:100%"></div>
			<script>
		      // This example adds a search box to a map, using the Google Place Autocomplete
		      // feature. People can enter geographical searches. The search box will return a
		      // pick list containing a mix of places and predicted search terms.
		
		      // This example requires the Places library. Include the libraries=places
		      // parameter when you first load the API. For example:
		      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
			
		      var position = navigator.geolocation.getCurrentPosition();
			  var latitude = position.coords.latitude;
		      var longitude = position.coords.longitude;
		          
			  function initAutocomplete() {
		    	  var map = new google.maps.Map(document.getElementById('map'), {
		          center: {lat: -33.8688, lng: 151.2195},
		          zoom: 13,
		          mapTypeId: 'roadmap'
		        });
		    	
		    	  getLocation();
		    	  function getLocation() {
		    		  if (navigator.geolocation) {
		    		    navigator.geolocation.getCurrentPosition(showPosition);
		    		  } else {
		    		    alert("Geolocation is not supported by this browser.");
		    		  }
		    		}
		    		function showPosition(position) {
		    		  var lat = position.coords.latitude;
		    		  var lng = position.coords.longitude;
		    		  map.setCenter(new google.maps.LatLng(lat, lng));
		    		  map.setZoom(13);
		    		  map.setClickableIcons(true);
		    		  marker.setVisible(true);
		    		  map.addMarker(new MarkerOptions().position(new google.maps.LatLng(lat, lng)));
		    		  marker.setPosition(new google.maps.LatLng(lat, lng));
		    		}
		    		
		    		// Create the search box and link it to the UI element.
		        var input = document.getElementById('search-input');
		        var searchBox = new google.maps.places.SearchBox(input);
		        //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		
		        // Bias the SearchBox results towards current map's viewport.
		        map.addListener('bounds_changed', function() {
		          searchBox.setBounds(map.getBounds());
		        });
		
		        var markers = [];
		        // Listen for the event fired when the user selects a prediction and retrieve
		        // more details for that place.
		        searchBox.addListener('places_changed', function() {
		          var places = searchBox.getPlaces();
		
		          if (places.length == 0) {
		            return;
		          }
		
		          // Clear out the old markers.
		          markers.forEach(function(marker) {
		            marker.setMap(null);
		          });
		          markers = [];
		
		          // For each place, get the icon, name and location.
		          var bounds = new google.maps.LatLngBounds();
		          places.forEach(function(place) {
		            if (!place.geometry) {
		              console.log("Returned place contains no geometry");
		              return;
		            }
		            var icon = {
		              url: place.icon,
		              size: new google.maps.Size(71, 71),
		              origin: new google.maps.Point(0, 0),
		              anchor: new google.maps.Point(17, 34),
		              scaledSize: new google.maps.Size(25, 25)
		            };
		
		            // Create a marker for each place.
		            markers.push(new google.maps.Marker({
		              map: map,
		              icon: icon,
		              title: place.name,
		              position: place.geometry.location
		            }));
		
		            if (place.geometry.viewport) {
		              // Only geocodes have viewport.
		              bounds.union(place.geometry.viewport);
		            } else {
		              bounds.extend(place.geometry.location);
		            }
		          });
		          map.fitBounds(bounds);
		        });
		      }
		
		    </script>
		    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYBIyIpr8G05ItRalL7B590R615jZUSI4&libraries=places&callback=initAutocomplete"
		         async defer></script>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>

