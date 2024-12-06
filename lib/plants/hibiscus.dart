import 'package:flutter/material.dart';

class HibiscusPage extends StatelessWidget {
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
                      'assets/hibiscus.jpg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hibiscus',
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
                      'Hibiscus is a beautiful flowering plant known for its large, colorful blooms. It\'s often used in herbal teas, and its leaves and flowers have numerous health benefits.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Known for its ability to lower blood pressure, reduce cholesterol levels, and support immune health. It also has anti-inflammatory and antibacterial properties.'),
                      _buildBulletPoint('Culinary', 'Hibiscus flowers are used in teas, jams, sauces, and as a garnish for salads.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Can be grown from seeds or cuttings.'),
                      _buildBulletPoint('Soil', 'Prefers well-draining, slightly acidic soil.'),
                      _buildBulletPoint('Sunlight', 'Requires full sun for best growth.'),
                      _buildBulletPoint('Watering', 'Keep the soil consistently moist, but not waterlogged.'),
                      _buildBulletPoint('Temperature', 'Thrives in warm climates, ideally between 60–90°F.'),
                      _buildBulletPoint('Fertilizer', 'Use a balanced fertilizer during the growing season.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest flowers in the morning when they are fully open. You can dry the petals to make hibiscus tea or use them fresh in cooking.'
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