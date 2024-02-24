import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  State<First> createState() => _HomepageState();
}

class _HomepageState extends State<First> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(),
        height: screenHeight,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.37,
                        child: Image.network(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.3,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Color.fromRGBO(238, 81, 81, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
