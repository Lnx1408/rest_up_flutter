// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';

class UbicacionRestaurante extends StatefulWidget {
  const UbicacionRestaurante({Key? key}) : super(key: key);

  @override
  State<UbicacionRestaurante> createState() => _UbicacionRestauranteState();
}

class _UbicacionRestauranteState extends State<UbicacionRestaurante> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
  
}
