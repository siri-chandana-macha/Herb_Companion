import 'package:flutter/material.dart';

class TulsiPage extends StatelessWidget {
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
                      'assets/tulsi.jpg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tulsi',
                    style: TextStyle(
                      fontSize: 24,
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
                      'Tulsi is a highly valued plant known for its medicinal and culinary applications. It is easy to grow and offers numerous benefits, making it a great addition to any space.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Known for boosting immunity, reducing stress, treating colds and coughs, aiding digestion, and possessing anti-inflammatory properties.'),
                      _buildBulletPoint('Culinary', 'Adds a distinct peppery flavor to teas, soups, and herbal infusions.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Can be grown from seeds or cuttings.'),
                      _buildBulletPoint('Soil', 'Requires rich, well-draining soil enriched with compost.'),
                      _buildBulletPoint('Sunlight', 'Thrives in full sunlight but can tolerate partial shade.'),
                      _buildBulletPoint('Watering', 'Keep soil consistently moist but avoid waterlogging.'),
                      _buildBulletPoint('Temperature', 'Prefers warm conditions (70–95°F); needs frost protection.'),
                      _buildBulletPoint('Fertilizer', 'Use organic compost or balanced fertilizer once a month.'),
                      _buildBulletPoint('Care', 'Prune frequently for bushy growth and remove flower buds to extend its productive life.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest mature leaves early in the day for maximum potency and flavor. The leaves can be dried and stored for future use in teas or home remedies.'
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