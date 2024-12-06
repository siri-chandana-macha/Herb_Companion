import 'package:flutter/material.dart';
import '../plants/aloe_vera.dart';
import '../plants/tulsi.dart';
import '../plants/ashwaganda.dart';
import '../plants/hibiscus.dart';
import '../plants/coriander.dart';
import '../plants/betel.dart';
import '../plants/cabbage.dart';
import '../plants/curryleaves.dart';
import '../plants/fenugreek.dart';
import '../plants/mint.dart';
import '../plants/sorrel.dart';
import '../plants/spinach.dart';


class PopularHerbsTab extends StatelessWidget {
  final List<Map<String, dynamic>> herbs = [
    {
      'name': 'Aloe Vera',
      'image': 'assets/aloe vera.jpeg',
      'page': AloeVeraPage(),
    },
    {
      'name': 'Tulsi',
      'image': 'assets/tulsi.jpg',
      'page': TulsiPage(),
    },
    {
      'name': 'Hibiscus',
      'image': 'assets/hibiscus.jpg',
      'page': HibiscusPage(), 
    },
    {
      'name': 'Ashwaganda',
      'image': 'assets/ashwaganda.jpg',
      'page': AshwagandhaPage(), 
    },
    {
      'name': 'Coriander',
      'image': 'assets/coriander.jpeg',
      'page': CorianderPage(), 
    },
    {
      'name': 'Spinach',
      'image': 'assets/spinach.jpeg',
      'page': SpinachPage(), 
    },
    {
      'name': 'Sorrel',
      'image': 'assets/sorrel.jpeg',
      'page': SorrelPage(), // Replace with SorrelPage when created
    },
    {
      'name': 'Fenugreek',
      'image': 'assets/fenugreek.jpg',
      'page': FenugreekPage(), // Replace with FenugreekPage when created
    },
    {
      'name': 'Curry Leaves',
      'image': 'assets/curryleaves.jpg',
      'page': CurryLeavesPage(), // Replace with CurryLeavesPage when created
    },
     {
      'name': 'Mint',
      'image': 'assets/mint.jpeg',
      'page': MintPage(), // Replace with CurryLeavesPage when created
    },
     {
      'name': 'Cabbage',
      'image': 'assets/cabbage.jpg',
      'page': CabbagePage(), // Replace with CurryLeavesPage when created
    },
     {
      'name': 'Betel',
      'image': 'assets/betel.jpg',
      'page': BetelPage(), // Replace with CurryLeavesPage when created
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFB9E0BB),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 40,
            runSpacing: 20,
            alignment: WrapAlignment.start,
            children: herbs.map((herb) => _buildHerbCard(context, herb)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildHerbCard(BuildContext context, Map<String, dynamic> herb) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => herb['page']),
        );
      },
      child: Card(
        elevation: 8,
        color: Color.fromARGB(255, 237, 245, 162),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color(0xFF2E5A35),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  herb['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                herb['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E5A35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}