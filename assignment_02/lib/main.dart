import 'package:assignment_02/pages/first.dart';
import 'package:assignment_02/pages/order.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Order(),
    );
  }
}
