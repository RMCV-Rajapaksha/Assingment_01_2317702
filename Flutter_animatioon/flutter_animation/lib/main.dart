import 'package:flutter/material.dart';
import 'package:flutter_animation/Implicit.dart';
import 'package:flutter_animation/PhysicsBasedAnimation.dart';
import 'package:flutter_animation/explicit.dart';
import 'package:flutter_animation/hero.dart';
import 'package:flutter_animation/tween.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Screen1(),
        ),
      ),
    );
  }
}
