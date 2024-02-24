import 'package:assignment_02/pages/bottom.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      children: [
                        Container(
                          height: screenHeight * 0.28,
                          child: Image.network(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(238, 81, 81, 1),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(238, 81, 81,
                                      1)), // Color of the bottom border when focused
                            ),
                          ),
                          style: const TextStyle(
                            color: Color.fromRGBO(238, 81, 81, 1),
                          ),
                          cursorColor: Color.fromRGBO(238, 81, 81, 1),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(238, 81, 81, 1),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(238, 81, 81,
                                      1)), // Color of the bottom border when focused
                            ),
                          ),
                          style: const TextStyle(
                            color: Color.fromRGBO(238, 81, 81, 1),
                          ),
                          cursorColor: Color.fromRGBO(238, 81, 81, 1),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          height: screenHeight * 0.07,
                          width: screenWidth * 0.96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(238, 81, 81, 1),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bottom()));
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        const Text(
                          'or',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          height: screenHeight * 0.06,
                          child: Image.network(
                            'assets/images/google & signupgoogle.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Don\'t have an account? Sign Up',
                              style: TextStyle(
                                color: Color.fromRGBO(238, 81, 81, 1),
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromRGBO(238, 81, 81, 1),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
