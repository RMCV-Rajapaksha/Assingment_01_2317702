import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen2()),
          );
        },
        child: Hero(
          tag: 'imageHero',
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
