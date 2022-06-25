import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapsPage extends StatefulWidget {
  static const ROUTE_NAME = '/Maps';
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    GoogleMapController _controller;

    Set<Marker> markers = {
      const Marker(
        markerId: MarkerId('rumah sakit terdekat'),
        position: LatLng(-8.589816037416043, 116.09313446883692),
      ),
    };

    final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(-8.6371704, 116.3936267),
      zoom: 14.4746,
    );

    return Scaffold(
        body: GoogleMap(
      mapToolbarEnabled: false,
      initialCameraPosition: _kGooglePlex,
      markers: markers,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) async {
        _controller = controller;

        Position position = await _determinatePosition();

        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 14)));
      },
    ));
  }
}

Future<Position> _determinatePosition() async {
  bool serviceEnable;
  LocationPermission permission;

  serviceEnable = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnable) {
    return Future.error('Location service are enable');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permission denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}
