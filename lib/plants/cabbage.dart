import 'package:flutter/material.dart';

class CabbagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Herb Companion',
          style: TextStyle(fontFamily: 'Roboto', fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 236, 132),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/cabbage.jpg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cabbage',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection('Description', 
                      'Cabbage is a leafy green or purple vegetable commonly used in salads, stews, and fermented dishes like sauerkraut. It is packed with nutrients, including vitamin C, fiber, and antioxidants.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'High in vitamins and antioxidants, particularly vitamin K for bone health. Has anti-inflammatory properties and can be used topically for skin irritations.'),
                      _buildBulletPoint('Culinary', 'Used in salads, slaws, stews, stir-fries, and soups. Can be fermented for dishes like sauerkraut.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Grown from seeds, sown directly or started indoors.'),
                      _buildBulletPoint('Soil', 'Prefers rich, well-drained, slightly acidic soil.'),
                      _buildBulletPoint('Sunlight', 'Needs full sun to grow strong and healthy.'),
                      _buildBulletPoint('Watering', 'Keep soil evenly moist during growing season.'),
                      _buildBulletPoint('Temperature', 'Best grown in cooler temperatures (55–75°F).'),
                      _buildBulletPoint('Fertilizer', 'Apply balanced fertilizer rich in nitrogen.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest when heads are firm and fully developed, typically 70-90 days after planting. Cut heads at the base when solid and heavy.'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, [List<Widget>? bulletPoints]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green[600],
          ),
        ),
        SizedBox(height: 12),
        if (content.isNotEmpty)
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        if (bulletPoints != null) ...bulletPoints,
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBulletPoint(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: '• $title: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }
}