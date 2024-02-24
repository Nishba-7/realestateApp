import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants/constants.dart';

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Container(
        width: size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: darkBlue.withOpacity(0.6),
              offset: Offset(0, 10),
              blurRadius: 10,
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            // Navigate to the map screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapScreen()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map_outlined,
                color: white,
              ),
              Text(
                ' Map view',
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample coordinates (replace with your desired coordinates)
    final LatLng _center = const LatLng(37.7749, -122.4194);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('Marker'),
            position: _center,
            infoWindow: const InfoWindow(
              title: 'Your Location',
              snippet: 'This is a demo street view',
            ),
          ),
        },
      ),
    );
  }
}
