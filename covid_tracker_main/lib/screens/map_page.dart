import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  final PageController controller;

  const MapScreen({Key key, this.controller}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _newController;
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(10.882787, 106.783930);

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  StreamSubscription

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.thoroughfare} ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.869855, 106.803717),
    zoom: 14.4746,
  );

  static final CameraPosition _kVie = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(21.0274173, 105.8332508),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _newController = controller;
          },
          markers: getmarkers(),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            right: 40.0,
            left: 40.0,
            child: Container(
                height: 40.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    (_currentPosition != null && _currentAddress != null)
                        ? Expanded(
                          child: Text(
                              _currentAddress,
                              style: TextStyle(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                        )
                        : Text('Unknown',
                            style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ))
        ),
        Positioned(
          left: 10.0,
          bottom: 20.0,
          child: FloatingActionButton.extended(
            onPressed: _getCurrentLocation,
            label: Text('Vị trí của tôi'),
            icon: Icon(Icons.location_on),
          ),
        ),

      ]),

    );
  }

  Future<void> _myLocation() async {
    _newController = await _controller.future;
    _newController.animateCamera(CameraUpdate.newCameraPosition(_kVie));
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(10.875946, 106.806532), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Khu vục lây nhiễm',
          snippet: '12 ca lây nhiễm',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange), //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(10.869674, 106.803764), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Khu vực lây nhiễm',
          snippet: '3 ca lây nhiễm',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(10.872127, 106.802046), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Khu vực lây nhiễm',
          snippet: '8 ca lây nhiễm',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange), //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
