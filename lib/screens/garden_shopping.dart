import 'package:flutter/material.dart';

class GardenShoppingTab extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    // Gardening Tools
    {
      'name': 'Hand Trowel',
      'image': 'assets/hand_trowel.jpg',
      'description': 'Ergonomic handle for comfortable planting.',
      'price': '₹299',
      'category': 'Tools'
    },
    {
      'name': 'Gardening Gloves',
      'image': 'assets/gloves.jpg',
      'description': 'Durable protection for your hands.',
      'price': '₹249',
      'category': 'Tools'
    },
    {
      'name': 'Terracotta Pot',
      'image': 'assets/terracotta_pots.jpg',
      'description': 'Natural clay pot for healthy plant growth.',
      'price': '₹199',
      'category': 'Tools'
    },
    {
      'name': 'Spray Bottle',
      'image': 'assets/spray_bottle.jpg',
      'description': 'Fine mist sprayer for plant care.',
      'price': '₹149',
      'category': 'Tools'
    },
    {
      'name': 'Grow Bags',
      'image': 'assets/grow_bags.jpg',
      'description': 'Fabric pots for better root growth.',
      'price': '₹99',
      'category': 'Tools'
    },
    {
      'name': 'Pesticide Spray',
      'image': 'assets/pest_spray.jpg',
      'description': 'Chemical-Free Organic Pest Control for Safe Gardening.',
      'price': '₹399',
      'category': 'Tools'
    },
    {
      'name': 'Red Soil',
      'image': 'assets/redsoil.jpeg',
      'description': 'Nutrient-Rich Soil for Healthy Plant Growth.',
      'price': '₹199',
      'category': 'Tools'
    },
    {
      'name': 'Organic Fertilizer',
      'image': 'assets/fertilizer.jpg',
      'description': 'Chemical-free plant nourishment blend for growth.',
      'price': '₹299',
      'category': 'Tools'
    },
    {
      'name': 'Pruning Shears',
      'image': 'assets/pruning_shears.jpg',
      'description': 'Sharp and efficient for trimming plants.',
      'price': '₹499',
      'category': 'Tools'
    },
    {
      'name': 'Terracotta Pots',
      'image': 'assets/terracotta_pots.jpg',
      'description': 'Classic and breathable pots for your plants.',
      'price': '₹299',
      'category': 'Gardening'
    },

    // Herbs
    {
      'name': 'Aloe Vera',
      'image': 'assets/aloe vera.jpeg',
      'description': 'Medicinal plant known for its healing properties.',
      'price': '₹199',
      'category': 'Herbs'
    },
    {
      'name': 'Tulsi ',
      'image': 'assets/tulsi.jpg',
      'description': 'Sacred herb with numerous health benefits.',
      'price': '₹149',
      'category': 'Herbs'
    },
    {
      'name': 'Ashwagandha ',
      'image': 'assets/ashwaganda.jpg',
      'description': 'Adaptogenic herb for stress relief.',
      'price': '₹179',
      'category': 'Herbs'
    },
    {
      'name': 'Betel',
      'image': 'assets/betel.jpg',
      'description': 'Fresh leaves for traditional use.',
      'price': '₹49',
      'category': 'Herbs'
    },
    {
      'name': 'Cabbage',
      'image': 'assets/cabbage.jpg',
      'description': 'Leafy vegetable rich in nutrients.',
      'price': '₹35',
      'category': 'Herbs'
    },
    {
      'name': 'Coriander',
      'image': 'assets/coriander.jpeg',
      'description': 'Aromatic herb for garnishing and flavor.',
      'price': '₹20',
      'category': 'Herbs'
    },
    {
      'name': 'Curry Leaves',
      'image': 'assets/curryleaves.jpg',
      'description': 'Fragrant, flavorful leaves for seasoning curries and dishes.',
      'price': '₹25',
      'category': 'Herbs'
    },
    {
      'name': 'Fenugreek',
      'image': 'assets/fenugreek.jpg',
      'description': 'Nutritious greens with a bitter-sweet flavor.',
      'price': '₹30',
      'category': 'Herbs'
    },
    {
      'name': 'Hibiscus',
      'image': 'assets/hibiscus.jpg',
      'description': 'Vibrant flowers for tea and decoration.',
      'price': '₹60',
      'category': 'Herbs'
    },
    {
      'name': 'Mint',
      'image': 'assets/mint.jpeg',
      'description': 'Cooling herb for beverages and dishes.',
      'price': '₹15',
      'category': 'Herbs'
    },
    {
      'name': 'Sorrel',
      'image': 'assets/sorrel.jpeg',
      'description': 'Tangy and flavorful leaves for salads.',
      'price': '₹40',
      'category': 'Herbs'
    },
    {
      'name': 'Spinach',
      'image': 'assets/spinach.jpeg',
      'description': 'Nutrient-rich leafy green for energy and vitality.',
      'price': '₹25',
      'category': 'Herbs'
    },
    //
    {
    "name": "Garden Tools Combo",
    "image": "assets/tools_combo.jpg",
    "description": 'Pruner, trowel, rake, gloves, bucket, watering can.',
    "price": "₹2,999",
    "category": "Tools"
    },
     {
      "name": "Wheelbarrow",
      "image": "assets/wheel_barrow.jpg",
      "description": 'Wheelbarrow for soil and heavy material transport.',
      "price": "₹1,499",
      "category": "Tools"
    },
    {
      "name": "Hedge Trimmer",
      "image": "assets/hedge_trimmer.jpg",
      "description": 'Powerful trimmer for shaping and maintaining hedges.',
      "price": "₹1,999",
      "category": "Tools"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFB9E0BB),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySection('Gardening Tools & Supplies', 'Tools'),
            _buildCategorySection('Herbs', 'Herbs'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, String category) {
    List<Map<String, dynamic>> categoryItems = products
        .where((product) => product['category'] == category)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E5A35),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Wrap(
            spacing: 40.0,
            runSpacing: 20.0,
            children: categoryItems.map((product) => _buildProductCard(product)).toList(),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 200,
      child: Card(
        elevation: 8,
        color: Color.fromARGB(255, 237, 245, 162),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Color(0xFF2E5A35),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  product['image'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E5A35),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    product['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['price'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E5A35),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Button was pressed!');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2E5A35), // Corrected the button style
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
