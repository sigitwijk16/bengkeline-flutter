import 'package:bengkeline/custom_resources/text_primary.dart';
import 'package:bengkeline/pages/splash_screen.dart';
import 'package:flutter/material.dart';

Color pureWhite = Color(0xFFFFFFFF);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> imageList = [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
    'assets/images/slide3.png',
    // Add more image paths as needed.
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0, // Set an arbitrary large number.
      viewportFraction: 0.85,
    );
    _pageController.addListener(() {
      final currentPage = _pageController.page?.round() ?? 0;
      setState(() {
        _currentPage = currentPage.round() % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenHeight * 0.28;

    return Scaffold(
      backgroundColor: pureWhite,
      body: Column(
        children: [
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      16, 40, 16, 0), // Set X and Y margins here.
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Hi, Febrianto',
                        style: TextPrimary.heading,
                      ),
                      Image.asset(
                        'assets/icons/customer_service.png', // Path to your custom icon asset.
                        width: 48.0, // Set the width of the custom icon.
                        height: 48.0, // Set the height of the custom icon.
                      ),
                    ],
                  )),
              SizedBox(height: 16.0), // Add vertical gap between rows.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: containerWidth, // Width of the rectangle.
                      height:
                          containerHeight, // Height of the rectangle. // Container color.// Center the child and decoration.
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Rectangle color.
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.2), // Shadow color with transparency
                                offset:
                                    Offset(3, 5), // Center shadow (no offset)
                                blurRadius: 50.0, // Spread of the shadow
                                spreadRadius:
                                    1.0, // Negative value for an outline-like effect
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                                14.0), // Border radius for rounded corners.
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      width: containerWidth *
                                          0.85, // Set the width as a fraction (50%) of the parent container.
                                      height: containerHeight *
                                          0.8, // Set the width as a fraction (50%) of the parent container.
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Image.asset(
                                          'assets/images/google_map.png', // Replace with your image path.// Set image height as needed.
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFF6154),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Bahan Bakar Terdekat',
                                      style: TextPrimary.body,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF61D05E),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text('Bengkel Terdekat',
                                        style: TextPrimary.body),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Promo Terbaru',
                      style: TextPrimary.heading2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 200, // Set the height of the carousel.
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imageList[index % imageList.length],
                                    fit: BoxFit.contain,
                                    width: 1000,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            imageList.length,
                            (index) => buildPageIndicator(index),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Apa yang Anda butuhkan?',
                      style: TextPrimary.heading2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {}, // Handle your callback.
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Ink(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/menu_button1.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {}, // Handle your callback.
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Ink(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/menu_button2.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {}, // Handle your callback.
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Ink(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/menu_button3.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {}, // Handle your callback.
                      splashColor: Colors.black.withOpacity(0.3),
                      child: Ink(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/menu_button4.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 64,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    // Add your navigation logic here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen()), // Replace NextScreen with your destination screen.
                    );
                  },
                  child: Ink(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon_home.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    // Add your navigation logic here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen()), // Replace NextScreen with your destination screen.
                    );
                  },
                  child: Ink(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon_history.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    // Add your navigation logic here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen()), // Replace NextScreen with your destination screen.
                    );
                  },
                  child: Ink(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon_cart.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    // Add your navigation logic here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SplashScreen()), // Replace NextScreen with your destination screen.
                    );
                  },
                  child: Ink(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon_user.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
