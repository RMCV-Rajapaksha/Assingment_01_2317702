import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<String> image = [
  'assets/images/rice.png',
  'assets/images/head.png',
  'assets/images/lasa.png',
];

class Order extends StatefulWidget {
  @override
  State<Order> createState() => _HomepageState();
}

class _HomepageState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            decoration: const BoxDecoration(),
            height: screenHeight,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: image.length,
                      itemBuilder: (context, index) {
                        final tile = image.length;
                        return MyWidget(image[index]);
                      },
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 81, 81, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                        onPressed: () {
                          showCustomBottomSheet(context);
                        },
                        child: const Text(
                          'Ckeckout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final String image;
  const MyWidget(this.image, {Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  void _decrementCount() {
    setState(() {
      _counter--;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      width: screenWidth * 0.1,
      height: screenWidth * 0.3,
      margin: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://media.cnn.com/api/v1/images/stellar/prod/180926182353-06-valentinas-tex-mex-barbecue-092618.jpg?q=w_1600,h_900,x_0,y_0,c_fill',
                  width: 130,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Text(
                'Tex Mex BBQ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color.fromRGBO(238, 81, 81, 1),
                ),
                itemCount: 5,
                itemSize: 25,
                direction: Axis.horizontal,
              ),
              const Text(
                '2400 LKR',
                style: TextStyle(
                  color: Color.fromRGBO(238, 81, 81, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color.fromRGBO(238, 81, 81, 1),
                      ),
                    ),
                    child: IconButton(
                      onPressed: _decrementCount,

                      icon: const Icon(
                        Icons.minimize,
                        size: 14,
                      ),
                      color: const Color.fromRGBO(238, 81, 81, 1),
                      iconSize: 20, // Increase the size to make it more visible
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color.fromRGBO(238, 81, 81, 1),
                      ),
                    ),
                    child: IconButton(
                      onPressed: _incrementCounter,
                      icon: const Center(
                        child: Icon(
                          Icons.add,
                          size: 14,
                        ),
                      ),
                      color: const Color.fromRGBO(238, 81, 81, 1),
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  int price = 9400;
  int delivery = 300;
  int total = price + delivery;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 375,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Order                                                                                        ',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '$price LKR',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Delivery                                                                                     ',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' $delivery LKR',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Total                                                              ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 127, 125, 125),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' $total LKR',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 127, 125, 125),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 45),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Apply Coupon Code',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: const Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Victoria Higgins \n 34 D4,Rose Ave \n Texas',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(
                        238,
                        81,
                        81,
                        1,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: const Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                          text: 'VISA',
                          style: TextStyle(
                            fontSize: 10,

                            color: Colors.red, // Highlight color
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' **** **** **** 3947',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(
                        238,
                        81,
                        81,
                        1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
