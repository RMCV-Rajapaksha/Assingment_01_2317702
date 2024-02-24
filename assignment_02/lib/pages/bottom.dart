import 'package:assignment_02/pages/home.dart';
import 'package:assignment_02/pages/product.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List<Widget> screen = [HomePage(), Home(), Home(), Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index_color],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0
                      ? Color.fromRGBO(238, 81, 81, 1)
                      : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.location_pin,
                  size: 30,
                  color: index_color == 1
                      ? Color.fromRGBO(238, 81, 81, 1)
                      : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.shopping_bag,
                  size: 30,
                  color: index_color == 2
                      ? Color.fromRGBO(238, 81, 81, 1)
                      : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: index_color == 3
                      ? Color.fromRGBO(238, 81, 81, 1)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
