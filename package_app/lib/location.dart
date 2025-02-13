import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String locationMessage = 'Current location of the user';
  String lat = ''; // Initialize with empty string
  String long = ''; // Initialize with empty string

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
      setState(() {
        locationMessage = 'Latitude: $lat, Longitude: $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    if (lat.isEmpty || long.isEmpty) {
      // If no location data is available, show a warning or return early.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please get the location first.')),
      );
      return;
    }

    String googleURL = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunchUrlString(googleURL)) {
      await launchUrlString(googleURL);
    } else {
      throw 'Could not launch $googleURL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locationMessage, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'Latitude : $lat , Longitude : $long';
                  });
                  _liveLocation();
                }).catchError((e) {
                  // Handle error case
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                });
              },
              child: const Text('Get Current Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: const Text('Open Google Map'),
            ),
          ],
        ),
      ),
    );
  }
}
