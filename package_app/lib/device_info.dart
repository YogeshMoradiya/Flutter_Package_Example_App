import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

item(String name, String value) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  final deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('device_info'),
        backgroundColor: Colors.grey,
      ),
      body: FutureBuilder(
        future: deviceInfoPlugin.androidInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            AndroidDeviceInfo info = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  item('Android Model', info.model),
                  item('Android Brand', info.brand),
                  item('Android Device', info.device),
                  item('Android Hardware', info.hardware),
                  item('Android Host', info.host),
                  item('Android ID', info.id),
                  item(
                    'Android SDK int',
                    info.version.sdkInt.toString(),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
