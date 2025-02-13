import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleStartScreen extends StatelessWidget {
  const ExampleStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: Image.asset(
            'assets/images/fc-logo.png'
          ),
        ),
      ),
    );
  }


}