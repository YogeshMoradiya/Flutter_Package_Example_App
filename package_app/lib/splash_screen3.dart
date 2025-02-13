import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    // Delaying 4 seconds before loading the next screen
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isLoaded
            ? const HomeScreen() // Navigate to HomeScreen when loaded
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Center the animated "WELCOME" text
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'W E L C O M E',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
            ),
            const Spacer(),
            // SpinKit at the bottom
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SpinKitPouringHourGlassRefined(
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
