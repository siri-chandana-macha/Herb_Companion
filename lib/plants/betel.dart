import 'package:flutter/material.dart';

class BetelPage extends StatelessWidget {
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
                      'assets/betel.jpg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Betel',
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
                      'Betel leaves come from the betel vine, commonly used in many cultures for chewing, often in combination with areca nut (betel nut). They are known for their distinct peppery flavor.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Betel leaves have been used in traditional medicine to improve digestion, treat bad breath, and alleviate mouth ulcers. They also possess antimicrobial properties.'),
                      _buildBulletPoint('Other Benefits', 'Betel leaves are often used in rituals and cultural ceremonies in Asia and are known for their energizing properties when chewed.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Grown from cuttings or vine propagation.'),
                      _buildBulletPoint('Soil', 'Prefers rich, loamy, and well-drained soil.'),
                      _buildBulletPoint('Sunlight', 'Requires partial to full shade for optimal growth.'),
                      _buildBulletPoint('Watering', 'Needs consistent moisture but well-draining soil.'),
                      _buildBulletPoint('Temperature', 'Thrives in tropical and subtropical climates.'),
                      _buildBulletPoint('Fertilizer', 'Fertilize regularly with compost or organic fertilizers.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest leaves when they are mature but still tender, typically once the plant has reached about 6 inches in height.'
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