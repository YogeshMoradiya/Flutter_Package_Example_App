import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeSensorExample extends StatefulWidget {
  const GyroscopeSensorExample({super.key});

  @override
  State<GyroscopeSensorExample> createState() => _GyroscopeSensorExampleState();
}

class _GyroscopeSensorExampleState extends State<GyroscopeSensorExample> {
  // Declare variables to store gyroscope data
  double _gyroX = 0.0;
  double _gyroY = 0.0;
  double _gyroZ = 0.0;

  @override
  void initState() {
    super.initState();

    // Listen to gyroscope data stream
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroX = event.x;
        _gyroY = event.y;
        _gyroZ = event.z;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GyroscopeExample'),
        backgroundColor: Colors.grey,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Gyroscope Data:'), // Display a label
            Text('X: $_gyroX'), // Display gyroscope X data
            Text('Y: $_gyroY'), // Display gyroscope Y data
            Text('Z: $_gyroZ'), // Display gyroscope Z data
          ],
        ),
      ),
    );
  }
}
