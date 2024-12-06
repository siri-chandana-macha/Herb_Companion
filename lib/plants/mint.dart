import 'package:flutter/material.dart';

class MintPage extends StatelessWidget {
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
                      'assets/mint.jpeg',
                      height: 500,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Mint',
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
                      'Mint is a fragrant herb used in both cooking and medicinal applications. It is widely grown for its fresh, aromatic leaves that are used in teas, desserts, and savory dishes.'
                    ),
                    _buildSection('Benefits', '', [
                      _buildBulletPoint('Medicinal', 'Known for its digestive benefits, often used to relieve indigestion, nausea, and headaches. It has antispasmodic and anti-inflammatory properties.'),
                      _buildBulletPoint('Culinary', 'Mint leaves are used in teas, sauces, chutneys, cocktails, and desserts, providing a refreshing and cooling flavor.'),
                    ]),
                    _buildSection('Growing Instructions', '', [
                      _buildBulletPoint('Propagation', 'Best grown from cuttings or root divisions.'),
                      _buildBulletPoint('Soil', 'Prefers moist, well-drained soil, and can tolerate a range of soil types.'),
                      _buildBulletPoint('Sunlight', 'Grows best in partial shade but can tolerate full sun if kept well-watered.'),
                      _buildBulletPoint('Watering', 'Requires frequent watering to keep the soil moist, but avoid waterlogging.'),
                      _buildBulletPoint('Temperature', 'Ideal growth temperature is between 65–70°F.'),
                      _buildBulletPoint('Fertilizer', 'Lightly fertilize with compost to keep the plant vigorous.'),
                    ]),
                    _buildSection('Harvesting Tips',
                      'Harvest mint leaves when the plant is well-established and the leaves are full-sized. Cut leaves regularly to encourage new growth and prevent flowering.'
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