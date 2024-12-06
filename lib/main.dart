import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/about.dart';
import 'screens/login.dart';
import 'screens/popular_herbs.dart';
import 'screens/garden_shopping.dart';
import 'screens/faq.dart';
import 'screens/feedback.dart';

void main() {
  runApp(HerbCompanionApp());
}

class HerbCompanionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false, 
      title: 'Herb Companion',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align content to start
          children: [
            Icon(Icons.eco, color: Colors.white),
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Herb Companion',
              style: TextStyle(
                fontSize: 24, // Larger font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor:Colors.green[700], // AppBar background color
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'About Us', icon: Icon(Icons.info)),
            Tab(text: 'Login', icon: Icon(Icons.login)),
            Tab(text: 'Popular Herbs', icon: Icon(Icons.local_florist)),
            Tab(text: 'Garden Shopping', icon: Icon(Icons.shopping_cart)),
            Tab(text: 'FAQ', icon: Icon(Icons.help)),
            Tab(text: 'Feedback', icon: Icon(Icons.feedback)),
          ],
          indicatorColor: Colors.white, // Tab selection indicator color
          labelColor: Color.fromARGB(255, 218, 238, 39), // Color for selected icon and text
          unselectedLabelColor: Colors.white, // Color for unselected icon and text
          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // Tab label style
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          AboutUsPage(),
          LoginPage(),
          PopularHerbsTab(),
          GardenShoppingTab(),
          FAQPage(),
          FeedbackPage(),
        ],
      ),
    );
  }
}
