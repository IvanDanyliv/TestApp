function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 4,
    center: { lat: 35.746512, lng: -39.462891 },
  });

  const path = 'assets/cluster_images/m'

  const markers = locations.map((location) => {
    return new google.maps.Marker({
      position: location,
      map: map,
    });
  });
  new MarkerClusterer(map, markers,
    {imagePath: path});
}
const locations = gon.coordinates
console.log()
