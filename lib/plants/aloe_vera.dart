import 'package:flutter/material.dart';

class AloeVeraPage extends StatelessWidget {
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
              // Left column with image and title
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/aloe vera.jpeg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aloe Vera',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              // Right column with content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection('Description', 
                      'Aloe vera is a resilient succulent known for its thick leaves filled with medicinal gel. It\'s popular for skincare, digestion, and overall wellness, making it a great addition to any herb garden.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Soothes burns, cuts, and sunburns; aids digestion and boosts immunity.'),
                      _buildBulletPoint('Cosmetic', 'Hydrates skin, reduces dandruff, and promotes hair growth.'),
                      _buildBulletPoint('Environmental', 'Improves indoor air by releasing oxygen at night.'),
                      _buildBulletPoint('Detoxification', 'Supports liver and kidney cleansing.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Use pups (offsets) from a mature plant.'),
                      _buildBulletPoint('Soil', 'Plant in well-draining soil, like cactus mix.'),
                      _buildBulletPoint('Sunlight', 'Place in bright, indirect light.'),
                      _buildBulletPoint('Watering', 'Water deeply but sparingly, letting soil dry out between waterings.'),
                      _buildBulletPoint('Temperature', 'Ideal range is 55–80°F; not frost-tolerant.'),
                      _buildBulletPoint('Fertilizer', 'Feed sparingly with diluted fertilizer in spring/summer.'),
                      _buildBulletPoint('Care', 'Prune damaged leaves, repot every 2–3 years, and watch for pests like mealybugs.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Cut mature leaves close to the base for gel extraction. Use the gel fresh for the best results. Store excess gel in the refrigerator for later use.'
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