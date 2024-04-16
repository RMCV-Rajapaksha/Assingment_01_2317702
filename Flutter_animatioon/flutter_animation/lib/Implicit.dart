import 'package:flutter/material.dart';

const owlUrl =
    'https://images.pexels.com/photos/226737/pexels-photo-226737.jpeg?auto=compress&cs=tinysrgb&w=800';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Image.network(owlUrl, height: height * 0.8),
        TextButton(
          child: const Text(
            'Show Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () {
            setState(() {
              _showDetails = !_showDetails;
            });
          },
        ),
        AnimatedOpacity(
          opacity: _showDetails ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Column(
            children: const [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        ),
      ],
    );
  }
}
