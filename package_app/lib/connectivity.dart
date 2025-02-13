import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityScreen extends StatefulWidget {
  const ConnectivityScreen({super.key});

  @override
  State<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  String connectionStatus = "Checking connection...";
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    ConnectivityResult connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
      _updateConnectionStatus(connectivityResult);
    } catch (e) {
      setState(() {
        connectionStatus = "Failed to get connectivity status.";
      });
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        setState(() {
          connectionStatus = "Mobile data connection is being used.";
        });
        break;
      case ConnectivityResult.wifi:
        setState(() {
          connectionStatus = "Wi-Fi connection is being used.";
        });
        break;
      case ConnectivityResult.bluetooth:
        setState(() {
          connectionStatus = "Bluetooth connection is being used.";
        });
        break;
      case ConnectivityResult.ethernet:
        setState(() {
          connectionStatus = "Ethernet connection is being used.";
        });
        break;
      case ConnectivityResult.vpn:
        setState(() {
          connectionStatus = "VPN connection is being used.";
        });
        break;
      case ConnectivityResult.none:
        setState(() {
          connectionStatus = "No connection.";
        });
        break;
      default:
        setState(() {
          connectionStatus = "Unknown connection.";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Status'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Connection Status:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              connectionStatus,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
