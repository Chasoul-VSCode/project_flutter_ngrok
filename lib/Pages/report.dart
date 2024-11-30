import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  // ignore: use_super_parameters
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for sales report
    final List<Map<String, dynamic>> salesData = [
      {
        'name': 'Cappuccino',
        'quantity': 12,
        'total': 300000,
        'date': '2024-01-15'
      },
      {
        'name': 'Cafe Latte', 
        'quantity': 8,
        'total': 240000,
        'date': '2024-01-15'
      },
      {
        'name': 'Espresso',
        'quantity': 5,
        'total': 125000,
        'date': '2024-01-15'
      },
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.brown.shade800,
            Colors.brown.shade600,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.brown.shade900, Colors.brown.shade800],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Today\'s Sales',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '15 January 2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange[200],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.trending_up,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Revenue',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Rp 665.000',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                '+12.5%',
                                style: TextStyle(
                                  color: Colors.green[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Sales Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: salesData.length,
                    itemBuilder: (context, index) {
                      final item = salesData[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.orange, Colors.orange.shade700],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.coffee,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          title: Text(
                            item['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.brown.shade900,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(Icons.shopping_bag_outlined, 
                                size: 12, 
                                color: Colors.brown.shade400
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${item['quantity']} items',
                                style: TextStyle(
                                  color: Colors.brown.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            'Rp ${item['total']}',
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
