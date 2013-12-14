var geocoder;

// initialise the jqueryUI autocomplete element
function autocomplete_init() {
  $("#gmaps-input-address").autocomplete({

    // source is the list of input options shown in the autocomplete dropdown.
    // see documentation: http://jqueryui.com/demos/autocomplete/
    source: function(request,response) {

      // the geocode method takes an address or LatLng to search for
      // and a callback function which should process the results into
      // a format accepted by jqueryUI autocomplete
      geocoder = new google.maps.Geocoder();
      geocoder.geocode( {'address': request.term }, function(results, status) {
        response($.map(results, function(item) {
          return {
            label: item.formatted_address, // appears in dropdown box
            value: item.formatted_address, // inserted into input element when selected
            geocode: item                  // all geocode data: used in select callback event
          }
        }));
      })
    },

    // event triggered when drop-down option selected
    select: function(event,ui){
    }
  });

  // triggered when user presses a key in the address box
  $("#gmaps-input-address").bind('keydown', function(event) {
    if(event.keyCode == 13) {
      geocode_lookup( 'address', $('#gmaps-input-address').val(), true );

      // ensures dropdown disappears when enter is pressed
      $('#gmaps-input-address').autocomplete("disable")
    } else {
      // re-enable if previously disabled above
      $('#gmaps-input-address').autocomplete("enable")
    }
  });
}; // autocomplete_init

$(document).ready(function() { 
    autocomplete_init();
});
