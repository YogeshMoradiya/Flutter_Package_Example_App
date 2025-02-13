import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsPlus extends StatefulWidget {
  const SensorsPlus({super.key});

  @override
  State<SensorsPlus> createState() => _SensorsPlusState();
}

class _SensorsPlusState extends State<SensorsPlus> {

  List<AccelerometerEvent> _accelerometerValues = [];

  // StreamSubscription for accelerometer events
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();

    // Subscribe to accelerometer events
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        // Update the _accelerometerValues list with the latest event
        _accelerometerValues = [event];
      });
    });
  }

  @override
  void dispose() {
    // Cancel the accelerometer event subscription to prevent memory leaks
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('sensors plus'),
        backgroundColor: Colors.grey,
      ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Accelerometer Data:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              if (_accelerometerValues.isNotEmpty)
                Text(
                  'X: ${_accelerometerValues[0].x.toStringAsFixed(2)}, '
                      'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)}, '
                      'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                )
              else
                const Text('No data available', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
    );
  }
}
