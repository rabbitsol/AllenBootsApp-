import 'dart:async';
// import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> completer = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.101761, -96.670303), zoom: 14);

  Uint8List? marketimages;
  // List<String> images = [
  //   "assets/pointer.png",
  //   "assets/pointer.png",
  //   "assets/pointer.png",
  //   "assets/pointer.png",
  //   "assets/pointer.png",
  //   "assets/pointer.png"
  // ];
  String image = "assets/pointer.png";
// final Marker marker = Marker(
//       icon: await getMarkerIcon("path/to/your/image.png", Size(150.0, 150.0))
// );

  final List<Marker> _marker = [];
  // final List<Marker> _list = [
  //   const Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(33.101761, -96.670303),
  //       infoWindow: InfoWindow(title: "Allen's Boots")),
  //   const Marker(
  //       markerId: MarkerId('2'),
  //       position: LatLng(33.103185, -96.674770),
  //       infoWindow: InfoWindow(title: "Galaxy cafe")),
  //   const Marker(
  //       markerId: MarkerId('3'),
  //       position: LatLng(33.103285, -96.66090),
  //       infoWindow: InfoWindow(title: "Westgate Shopping Center")),
  //   const Marker(
  //       markerId: MarkerId('4'),
  //       position: LatLng(33.103385, -96.6761),
  //       infoWindow: InfoWindow(title: "Buckingham Ridge")),
  //   const Marker(
  //       markerId: MarkerId('5'),
  //       position: LatLng(33.1275, -96.6278),
  //       infoWindow: InfoWindow(title: "Riverside Oltorf")),
  //   const Marker(
  //       markerId: MarkerId('6'),
  //       position: LatLng(33.143347, -96.653595),
  //       infoWindow: InfoWindow(title: "Manchaca")),
  //   const Marker(
  //       markerId: MarkerId('7'),
  //       position: LatLng(33.110768, -96.654724),
  //       infoWindow: InfoWindow(title: "Del Valle")),
  // ];

  // final List<LatLng> _list = <LatLng>[
  //   const LatLng(33.101761, -96.670303),
  //   const LatLng(33.103185, -96.674770),
  //   const LatLng(33.103285, -96.66090),
  //   const LatLng(33.103385, -96.6761),
  //   const LatLng(33.1275, -96.6278),
  //   const LatLng(33.143347, -96.653595),
  //   const LatLng(33.110768, -96.654724),
  // ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    // _marker.addAll(_list);

    loadData();
  }

  loadData() async {
    // for (int i = 0; i < images.length; i++) {
    final Uint8List markIcons = await getImages(image, 65);
    // makers added according to index
    _marker.add(Marker(
      // given marker id
      markerId: MarkerId(0.toString()),
      // given marker icon
      icon: BitmapDescriptor.fromBytes(markIcons),
      // given position
      // position: _list[i],
      position: const LatLng(33.101761, -96.670303),
      infoWindow: const InfoWindow(
        // given title for marker
        title: "Allen's Boots",
      ),
    ));
    setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      compassEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        completer.complete(controller);
        controller.setMapStyle(
            '[{"elementType": "labels.icon","stylers": [{ "color": "#7b7ccf"}]},{"featureType": "road","elementType": "geometry","stylers": [{"color": "#ffffff"}]},{"featureType": "road.arterial","elementType": "labels.text.fill","stylers": [{"color": "#757575"}]},{"featureType": "road.highway","elementType": "geometry","stylers": [{"color": "#dadada"}]},{"featureType": "road.highway","elementType": "labels.text.fill","stylers": [{"color": "#616161"}]},{"featureType": "road.local","elementType": "labels.text.fill","stylers": [{"color": "#9e9e9e"}]},{"featureType": "administrative.land_parcel","elementType": "labels.text.fill","stylers": [{"color": "#7b7ccf"}]},{"featureType": "poi","elementType": "geometry","stylers": [{"color": "#eeeeee"}]},]');
      },
      markers: Set<Marker>.of(_marker),
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
    );
  }
}
