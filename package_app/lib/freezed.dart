import 'package:flutter/material.dart';

class Freezed extends StatefulWidget {
  const Freezed({super.key});

  @override
  State<Freezed> createState() => _FreezedState();
}

class _FreezedState extends State<Freezed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed'),
        backgroundColor: Colors.grey,
      ),

    );
  }
}
