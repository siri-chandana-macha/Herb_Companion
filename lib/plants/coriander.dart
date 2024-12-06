import 'package:flutter/material.dart';

class CorianderPage extends StatelessWidget {
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
                      'assets/coriander.jpeg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Coriander',
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
                      'Coriander, also known as cilantro in some countries, is a popular herb used for both its leaves (cilantro) and seeds (coriander).'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Known for its detoxifying properties, it helps in digestion, lowers blood sugar, and has anti-inflammatory effects.'),
                      _buildBulletPoint('Culinary', 'The leaves are used in salsas, salads, soups, and curries, while the seeds are used as a spice in a variety of dishes.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Grown from seeds, directly sown in the soil.'),
                      _buildBulletPoint('Soil', 'Prefers well-drained, slightly acidic soil.'),
                      _buildBulletPoint('Sunlight', 'Grows best in full sun, but can tolerate partial shade.'),
                      _buildBulletPoint('Watering', 'Water regularly but avoid soggy soil.'),
                      _buildBulletPoint('Temperature', 'Prefers cooler temperatures, around 60–75°F.'),
                      _buildBulletPoint('Fertilizer', 'Fertilize lightly with organic compost.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest the leaves when the plant reaches about 6 inches tall. For seeds, allow the plant to flower and form seeds, then collect them when they ripen.'
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