import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Flame extends StatelessWidget {
  const Flame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flame Game Example'),
          backgroundColor: Colors.blueAccent,
        ),
        body: GameWidget(
          game: FlameGame(world: MyWorld()),  // Embedding the game in the Scaffold's body
        ),
      );
  }
}

/// The game world which contains the logic for adding and removing squares.
class MyWorld extends World with TapCallbacks {
  @override
  Future<void> onLoad() async {
    // Add an initial square at the center
    add(Square(Vector2.zero()));
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (!event.handled) {
      // If no square was tapped, add a new square at the tap position
      final touchPoint = event.localPosition;
      add(Square(touchPoint));
    }
  }
}

/// A square that rotates and can be tapped to remove itself.
class Square extends RectangleComponent with TapCallbacks {
  static const speed = 3.0;        // Rotation speed
  static const squareSize = 128.0; // Size of the square
  static const indicatorSize = 6.0; // Size of the small indicators

  static final Paint red = BasicPalette.red.paint();   // Paint for center marker
  static final Paint blue = BasicPalette.blue.paint(); // Paint for small indicator

  Square(Vector2 position)
      : super(
    position: position,
    size: Vector2.all(squareSize),  // Set the size
    anchor: Anchor.center,          // Anchor at the center of the square
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Add a blue small indicator at the top-left corner
    add(
      RectangleComponent(
        size: Vector2.all(indicatorSize),
        paint: blue,
      ),
    );
    // Add a red indicator at the center
    add(
      RectangleComponent(
        position: size / 2,
        size: Vector2.all(indicatorSize),
        anchor: Anchor.center,
        paint: red,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Rotate the square continuously
    angle += speed * dt;
    angle %= 2 * math.pi;
  }

  @override
  void onTapDown(TapDownEvent event) {
    // Remove the square when it is tapped
    removeFromParent();
    event.handled = true;
  }
}
