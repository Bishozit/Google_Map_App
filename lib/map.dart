import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    var marker_List = <Marker>[];

    marker_List = [
      Marker(
        point: const LatLng(23.811056, 90.407608),
        builder: (context) => const Icon(
          Icons.pin_drop,
          size: 40,
          color: Colors.red,
        ),
      ),
      Marker(
        point: const LatLng(22.50000000, 89.33333000),
        builder: (context) => const Icon(
          Icons.pin_drop,
          size: 40,
          color: Colors.amber,
        ),
      ),
      Marker(
        point: const LatLng(22.341900, 91.815536),
        builder: (context) => const Icon(
          Icons.pin_drop,
          size: 40,
          color: Colors.purple,
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Map Location Marker",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Flexible(
          child: FlutterMap(
            options:
                MapOptions(center: const LatLng(23.811056, 90.407608), zoom: 8),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                //userAgentPackageName: 'com.example.app',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: marker_List,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
