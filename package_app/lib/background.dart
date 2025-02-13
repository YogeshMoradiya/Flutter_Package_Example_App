import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Widget child;
  const Background({super.key,
    required this.image,
    this.height =.7,
    this.width = 400,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey
                      )
                    ]
                ),
                width: width,
                height: size.height * height,
                child: child,
              ),
              // Image.asset("assets/images/login.gif")
            ],
          ),
        ),
      ),
    );
  }
}
