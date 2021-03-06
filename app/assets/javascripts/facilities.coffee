@initMap = ->
  center = 
    lat: 0
    lng: 0

  map = new (google.maps.Map) $('#map')[0],
    zoom: 2
    center: center

  infowindow = new (google.maps.InfoWindow)

  $.getJSON '/facilities.json', (jsonData) ->
    $.each jsonData, (key, data) ->
      latLng = new (google.maps.LatLng)(data.lat, data.lng)
      marker = new (google.maps.Marker)
        position: latLng
        map: map
        title: data.name
      google.maps.event.addListener marker, 'click', ->
        infowindow.setOptions
          content: data.content
          maxWidth: 300
        infowindow.open map, marker
