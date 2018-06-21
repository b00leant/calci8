$(document).on 'turbolinks:load', ->
  numMatchItems = $('.match_item').length;
  markers = [];
  maps = [];
  initMap= ->
    $('.match_item').each(i, obj) =>

      point = {
        lat: $(obj).data("la")
        lng: $(obj).data("lo")
        zoom: 17
      }

      latlng = new google.maps.LatLng
      point.lat
      point.lng

      mapoptions = {
        zoom: point.zoom
        center: latlng
        styles: [
              {
                  "featureType": "landscape",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#FFA800"
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "landscape.man_made",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "landscape.man_made",
                  "elementType": "geometry",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "poi",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#679714"
                      },
                      {
                          "saturation": 33.4
                      },
                      {
                          "lightness": -25.4
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "poi.attraction",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.business",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.government",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.medical",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.park",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "poi.place_of_worship",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.school",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.sports_complex",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "road",
                  "elementType": "labels.text",
                  "stylers": [
                      {
                          "lightness": "65"
                      }
                  ]
              },
              {
                  "featureType": "road.highway",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#53FF00"
                      },
                      {
                          "saturation": -73
                      },
                      {
                          "lightness": 40
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "road.arterial",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#FBFF00"
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "road.local",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#00FFFD"
                      },
                      {
                          "lightness": 30
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "transit.station",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "water",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#00BFFF"
                      },
                      {
                          "saturation": 6
                      },
                      {
                          "lightness": 8
                      },
                      {
                          "gamma": 1
                      }
                  ]
              }
              ]
      }

      maps[i] = new google.maps.Map $(this).find('#map')[0],mapoptions

      markers[i] = new google.maps.Marker
        position: latlng
        map: maps[i]

    $('.free_match_item').each(i, obj) =>

      point = {
        lat: $(obj).data("la")
        lng: $(obj).data("lo")
        zoom: 17
      }

      latlng = new google.maps.LatLng point.lat, point.lng

      mapoptions = {
          zoom: point.zoom
          center: latlng
          styles: [
              {
                  "featureType": "landscape",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#FFA800"
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "landscape.man_made",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "landscape.man_made",
                  "elementType": "geometry",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "poi",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#679714"
                      },
                      {
                          "saturation": 33.4
                      },
                      {
                          "lightness": -25.4
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "poi.attraction",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.business",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.government",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.medical",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.park",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "poi.place_of_worship",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.school",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "poi.sports_complex",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "on"
                      }
                  ]
              },
              {
                  "featureType": "road",
                  "elementType": "labels.text",
                  "stylers": [
                      {
                          "lightness": "65"
                      }
                  ]
              },
              {
                  "featureType": "road.highway",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#53FF00"
                      },
                      {
                          "saturation": -73
                      },
                      {
                          "lightness": 40
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "road.arterial",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#FBFF00"
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "road.local",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#00FFFD"
                      },
                      {
                          "lightness": 30
                      },
                      {
                          "gamma": 1
                      }
                  ]
              },
              {
                  "featureType": "transit.station",
                  "elementType": "all",
                  "stylers": [
                      {
                          "visibility": "off"
                      }
                  ]
              },
              {
                  "featureType": "water",
                  "elementType": "all",
                  "stylers": [
                      {
                          "hue": "#00BFFF"
                      },
                      {
                          "saturation": 6
                      },
                      {
                          "lightness": 8
                      },
                      {
                          "gamma": 1
                      }
                  ]
              }
              ]
      }

      maps[i] = new google.maps.Map $(this).find('#map')[0], mapoptions

    markers[i] = new google.maps.Marker
      position: latlng
      map: maps[i]
