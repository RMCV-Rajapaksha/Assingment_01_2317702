import 'package:assignment_02/pages/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<String> image = [
  'assets/images/rice.jpg',
  'assets/images/head.png',
  'assets/images/lasa.jpg',
  'assets/images/potato.jpg',
  'assets/images/noodle.jpg',
];

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_head(screenWidth, screenHeight)],
          // Assuming box is a ValueListenable declared somewhere in your code
        ),
      ),
    );
  }

  Widget _head(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Image.network(
                'assets/images/head.png',
                fit: BoxFit.fill,
              ),
            ),
            ...List.generate(1, (index) {
              const tile = 1;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  height: screenHeight * 0.1,
                  child: ListTile(
                    title: const Text(
                      'Pasta Mozzarella',
                      style: TextStyle(
                          color: Color.fromRGBO(238, 81, 81, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Non Veg Classic Meat',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    trailing: const Icon(Icons.favorite),
                    onTap: () {},
                  ),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color.fromRGBO(238, 81, 81, 1),
                      ),
                      itemCount: 5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '                                              1850 LKR',
                      style: TextStyle(
                        color: Color.fromRGBO(238, 81, 81, 1),
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(238, 81, 81, 1),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Order()));
                },
                child: const Text(
                  'Add to Bag',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                child: const Text(
                  'Pasta Mozzarella is a unique blend of cheesy goodness'
                  'and fluffy flaky pasta richness. Pasta Mozzarella is served '
                  'with your choice of protein or vegetable and any  '
                  'topping of the selected classic and spicy ranges* '
                  '\n '
                  '\n'
                  'Portion serves two*',
                  style: TextStyle(
                    fontSize: 10,
                    // You can customize other text properties here
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.003,
            ),
            const Divider(
              color: Colors.grey,
              indent: 25.0,
              endIndent: 25.0,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('You might also like',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: _buildHorizontalListView(),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildHorizontalListView() {
  return Container(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: image.length,
      itemBuilder: (context, index) {
        return MyWidget(image[index]);
      },
    ),
  );
}

class MyWidget extends StatelessWidget {
  final String imageUrl;

  MyWidget(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
