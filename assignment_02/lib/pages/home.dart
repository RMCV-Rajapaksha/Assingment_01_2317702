import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<String> image = [
  'assets/images/rice.png',
  'assets/images/head.png',
  'assets/images/lasa.png',
  'assets/images/potato.png',
  'assets/images/noodle.png',
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
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add functionality for the menu button
          },
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_image.jpg'),
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
                return MyWidget(image[index]);
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
            child: TextField(
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(238, 81, 81, 1),
            child: Icon(
              Icons.food_bank_rounded,
              color: Colors.white,
              size: 35,
            ),
            radius: 25,
          ),
        );
      },
    ),
  );
}

class MyWidget extends StatelessWidget {
  final String imageUrl;

  MyWidget(this.imageUrl, {Key? key}) : super(key: key);

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
                  imageUrl,
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
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color.fromRGBO(238, 81, 81, 1),
                  size: 2, // Adjust the size of the stars as needed
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                'Non Veg Classic Meat',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.shopping_bag,
                size: 50,
                color: Colors.blue, // You can customize the color
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   final String imageUrl;

//   MyWidget(this.imageUrl, {Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQueryData = MediaQuery.of(context);
//     double screenWidth = mediaQueryData.size.width;
//     double screenHeight = mediaQueryData.size.height;
//     return
//   }
// }

// List<String> image = [
//   'assets/images/rice.png',
//   'assets/images/head.png',
//   'assets/images/lasa.png',
//   'assets/images/potato.png',
//   'assets/images/noodle.png',
// ];

// final List<Function()> onTapFunctions = [
//   () => print('Profile'),
//   () => print('Settings'),
//   () => print('Settings'),
//   () => print('Settings'),
//   () => print('login'),
// ];
