import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen5 extends StatefulWidget {
  const SplashScreen5({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen5> {
  @override
  void initState() {
    super.initState();
    // Simulate some delay for the splash screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          // Add the image in the center
          Center(
            child: Image(
              image: AssetImage('assets/images/shop.png'), // Your image path here
              width: 200, // Set desired width for the image
              height: 200, // Set desired height for the image
            ),
          ),
          Spacer(),
          // SpinKit at the bottom
          Padding(
            padding: EdgeInsets.only(bottom: 70.0), // Adjust padding to position it closer to the bottom
            child: SpinKitSpinningLines(
              color: Colors.black,
              size: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
