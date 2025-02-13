import 'package:flutter/material.dart';
import 'animation_screen.dart';
import 'example_start_screen.dart';
import 'hole_painter.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
            children: <Widget>[
              Scaffold(
                  appBar: AppBar(
                    title: const Text('Raindrop'),
                  ),
                  body: const ExampleStartScreen()
              ),
              IgnorePointer(
                  child: AnimationScreen(
                      color: Theme.of(context).colorScheme.secondary
                  )
              )
            ]
        )
    );
  }
}