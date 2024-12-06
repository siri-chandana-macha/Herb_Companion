import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
    "question": "What is Herb Companion?",
    "answer": "Herb Companion is your go-to platform for growing fresh herbs at home. We offer expert advice on herb cultivation and highlight their culinary and health benefits."
  },
  {
    "question": "What types of products can I find on Herb Companion?",
    "answer": "We offer gardening tools, supplies, and a variety of fresh medicinal and culinary herbs."
  },
  {
    "question": "What types of herbs are available?",
    "answer": "We offer medicinal herbs like Aloe Vera, Tulsi, and Ashwagandha, culinary herbs such as Mint and Coriander, ornamental plants like Hibiscus, and leafy greens like Spinach and Fenugreek."
  },
  {
    "question": "How do I care for my herbs?",
    "answer": "Each herb in our collection comes with specific care instructions, including watering needs, sunlight requirements, and maintenance tips."
  },
  {
    "question": "Do you offer delivery services?",
    "answer": "Yes, we deliver all our products directly to your doorstep. Each product can be purchased through the 'Buy Now' option."
  }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Force background color for the entire screen
          color: Colors.green[200], // Light green background
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "FREQUENTLY ASKED QUESTIONS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Colors.green[900], // Dark green font for heading
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: faqData.map((faq) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                title: Text(
                                  faq['question']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black, // Black font for questions
                                  ),
                                ),
                                backgroundColor: Colors.grey[200], // Light grey for question items
                                collapsedBackgroundColor: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey[200]!), // Grey border
                                ),
                                collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.green[400]!),
                                ),
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                      left: 24,
                                      right: 24,
                                      top: 8,
                                      bottom: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[200], // Green box for answers
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      faq['answer']!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black, // Black font for answers
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
