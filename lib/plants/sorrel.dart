import 'package:flutter/material.dart';

class SorrelPage extends StatelessWidget {
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
                      'assets/sorrel.jpeg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sorrel',
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
                      'Sorrel is a tangy, leafy herb commonly used in salads and soups. It has a sharp, lemony flavor and is rich in vitamin C.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Known for its detoxifying properties, sorrel aids in digestion, improves skin health, and provides an antioxidant boost.'),
                      _buildBulletPoint('Culinary', 'Used in soups, salads, and as a garnish to add a tart, lemony flavor to dishes.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Can be grown from seeds or division of established plants.'),
                      _buildBulletPoint('Soil', 'Prefers slightly acidic, well-drained soil.'),
                      _buildBulletPoint('Sunlight', 'Thrives in full sun but can tolerate some shade.'),
                      _buildBulletPoint('Watering', 'Keep the soil consistently moist.'),
                      _buildBulletPoint('Temperature', 'Prefers cooler temperatures (60–75°F).'),
                      _buildBulletPoint('Fertilizer', 'Apply compost to the soil to encourage growth.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest the leaves when they are young and tender. Sorrel leaves can be eaten raw or cooked.'
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