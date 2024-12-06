import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB9E0BB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Heading
              Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              SizedBox(height: 16),

              // Main Content: Text & Image
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side: Text
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection(
                          title: 'Our Mission',
                          content:
                              "At Herb Companion, we inspire individuals to discover the art of growing and using fresh herbs. "
                              "Our mission is to make herb gardening accessible through practical tips and expert advice. We believe "
                              "that nurturing plants fosters a deep connection with nature and promotes a sustainable lifestyle.",
                        ),
                        _buildSection(
                          title: 'Benefits of Herbs',
                          content:
                              "Fresh herbs are more than just ingredients for cooking. They boost wellness, improve air quality, "
                              "and add natural beauty to your home or garden. From creating herb gardens for culinary delights to "
                              "using medicinal herbs for crafting remedies, we explore their diverse benefits. Whether you’re growing "
                              "basil, mint, or lavender, every herb has unique properties that enrich your life.",
                        ),
                        _buildSection(
                          title: 'Our Vision',
                          content:
                              "We envision a world where everyone, regardless of space or expertise, can grow and enjoy fresh herbs. "
                              "Through education and innovation, we aim to make herb gardening simple and rewarding. With tools, tips, "
                              "and a supportive community, we guide you on this fulfilling journey.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),

                  // Right Side: Image
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/about.jpg', // Replace with your image asset
                        width: 400, // Adjusted width
                        height: 400, // Adjusted height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Build a Section
  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green[900],
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Helper: Build a Highlight with Icon
  Widget _buildHighlight(String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 243, 72),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white, size: 16),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}