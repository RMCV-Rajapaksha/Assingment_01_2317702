import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
            padding: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(),
            height: screenHeight,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Text(
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final tile = 3;
                        return MyWidget();
                      },
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 81, 81, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                        onPressed: () {
                          showCustomBottomSheet(context);
                        },
                        child: Text(
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
  const MyWidget({Key? key}) : super(key: key);

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
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      width: screenWidth * 0.1,
      height: screenWidth * 0.3,
      margin: EdgeInsets.all(5.0),
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
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tex Mex BBQ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color.fromRGBO(238, 81, 81, 1),
                  size: 20, // Adjust the size of the stars as needed
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
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
                        color: Color.fromRGBO(238, 81, 81, 1),
                      ),
                    ),
                    child: IconButton(
                      onPressed: _decrementCount,

                      icon: Icon(
                        Icons.minimize,
                        size: 14,
                      ),
                      color: Color.fromRGBO(238, 81, 81, 1),
                      iconSize: 20, // Increase the size to make it more visible
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '$_counter',
                      style: TextStyle(
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
                      icon: Center(
                        child: const Icon(
                          Icons.add,
                          size: 14,
                        ),
                      ),
                      color: Color.fromRGBO(238, 81, 81, 1),
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
  int devivery = 300;
  int total = price + devivery;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Order                                                                                        ',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '$price LKR',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
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
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' $devivery LKR',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
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
                        'Total                                                            ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 127, 125, 125),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' $total LKR',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 127, 125, 125),
                            fontSize: 16,
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
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Apply Coupon Code',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
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
