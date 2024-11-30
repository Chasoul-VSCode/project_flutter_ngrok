import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> menuItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMenuItems();
  }

  Future<void> fetchMenuItems() async {
    try {
      final response = await http.get(
        Uri.parse('https://3d2b-114-10-77-11.ngrok-free.app/api/foods'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // Add CORS headers
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      
      if (response.statusCode == 200) {
        setState(() {
          menuItems = json.decode(response.body);
          isLoading = false;
        });
      } else {
        print('Failed to load menu items. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load menu items');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching menu items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'What would you like to drink?',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 12),
                  prefixIcon: Icon(Icons.search, color: Colors.orange, size: 18),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
          ),

          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                _buildCategoryChip('All', true),
                _buildCategoryChip('Coffee', false),
                _buildCategoryChip('Non-Coffee', false),
                _buildCategoryChip('Food', false),
                _buildCategoryChip('Snacks', false),
              ],
            ),
          ),

          // Menu Grid
          Padding(
            padding: const EdgeInsets.all(8),
            child: isLoading 
              ? const Center(child: CircularProgressIndicator(color: Colors.orange))
              : menuItems.isEmpty
                ? const Center(child: Text('No menu items available', style: TextStyle(color: Colors.white70)))
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return _buildMenuItem(
                        name: item['name'] ?? '',
                        description: item['description'] ?? '',
                        price: item['price']?.toString() ?? '',
                        category: item['category'] ?? '',
                        imageUrl: item['imageUrl'] ?? 'https://via.placeholder.com/150',
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected ? LinearGradient(
            colors: [Colors.orange, Colors.orange.shade700],
          ) : null,
          color: isSelected ? null : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String name,
    required String description,
    required String price,
    required String category,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image from network
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Details
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp $price',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.orange.shade700],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
