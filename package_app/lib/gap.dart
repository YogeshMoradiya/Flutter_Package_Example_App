import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GapExample extends StatelessWidget {
  const GapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gap Example'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            children: <Widget>[
              const Gap(20),
              Container(
                height: 20,
                color: Colors.red,
              ),
              const Gap(10),
              Container(
                height: 20,
                color: Colors.red,
              ),
              Container(
                height: 30, // Large height
                color: Colors.transparent,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 60,
                    color: Colors.green,
                  ),
                  const Gap(10),
                  Container(
                    width: 30,
                    height: 60,
                    color: Colors.green,
                  ),
                ],
              ),
              const Gap(10),
              Container(
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

