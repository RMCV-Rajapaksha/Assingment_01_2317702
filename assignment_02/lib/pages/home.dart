import 'package:assignment_02/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<String> image = [
  'assets/images/rice.jpg',
  'assets/images/head.png',
  'assets/images/lasa.jpg',
  'assets/images/potato.jpg',
  'assets/images/noodle.jpg',
];

List<String> food = [
  'Fried Rice',
  'Cheese Pasta',
  'Lasagna',
  'Burger',
  'Chicken Noodle',
];
List<String> Description = [
  'Non Veg Classic Meat',
  'Veg Classic Meat',
  'Non Veg Classic Meat',
  'Non Veg Fast Food',
  'Non Veg Classic Meat',
];

List<double> rating = [
  4,
  4.5,
  5,
  3.75,
  4.25,
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Good Afternoon! Victorya!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Color.fromRGBO(238, 81, 81, 1),
          onPressed: () {
            // Add functionality for the menu button
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/Profile.png'),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),

          _buildHorizontalListView(),

          _buildCircleAvatarRow(),
          // Vertical List View_buildVerticalListView(),
          Expanded(
            child: ListView.builder(
              itemCount: image.length,
              itemBuilder: (context, index) {
                final tile = image.length;
                return MyWidget(image[index], food[index], Description[index],
                    rating[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalListView() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildCard();
        },
      ),
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Image.network(
          // 'assets/images/Groupcard.png',

          width: 300,
          height: 150,
          'assets/images/Groupcard.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget _buildCircleAvatarRow() {
  return SizedBox(
    height: 80,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(238, 81, 81, 1),
            radius: 25,
            child: Icon(
              Icons.food_bank_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
        );
      },
    ),
  );
}

class MyWidget extends StatelessWidget {
  final String imageUrl;
  final String food;
  final String description;
  final double rating;

  MyWidget(this.imageUrl, this.food, this.description, this.rating, {Key? key})
      : super(key: key);

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
      height: 130,
      margin: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    width: 130,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: screenWidth * 0.8,
          ),
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    food, // Use the food parameter here
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Color.fromRGBO(238, 81, 81, 1),
                    ),
                    itemCount: 5,
                    itemSize: 25,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.grey, // You can customize the color
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
