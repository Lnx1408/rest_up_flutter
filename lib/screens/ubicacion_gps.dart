// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';

class UbicacionRestaurante extends StatefulWidget {
  const UbicacionRestaurante({Key? key}) : super(key: key);

  @override
  State<UbicacionRestaurante> createState() => _UbicacionRestauranteState();
}

class _UbicacionRestauranteState extends State<UbicacionRestaurante> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-2.16926402720948, -79.89702526979475);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignApp.appBarBasic("¡Ven a visitarnos!"),
      body: GoogleMap(
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 75.0,
        ),
      ),
    );
  }
}
