// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/home.dart';
import '../Pages/qris.dart';
import '../Pages/report.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.brown.shade900,
                Colors.brown.shade800,
              ],
            ),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange.withOpacity(0.15),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 1
              )
            ]
          ),
          child: const Icon(
            Icons.local_cafe,
            color: Colors.orange,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Coffee Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Premium Quality',
                  style: TextStyle(
                    color: Colors.orange[200],
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.3),
                            blurRadius: 4,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
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
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Home Tab
                  const HomePage(),

                  // QRIS Tab
                  const QRISPaymentPage(amount: 25000),

                  // Report Tab
                  const ReportPage(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.brown.shade900,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1
                  )
                ]
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                labelStyle: const TextStyle(fontSize: 11),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.withOpacity(0.3),
                      Colors.orange.withOpacity(0.1),
                    ]
                  ),
                ),
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, size: 16),
                          SizedBox(width: 2),
                          Text('Home', style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code, size: 16),
                          SizedBox(width: 2),
                          Text('QRIS', style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, size: 16),
                          SizedBox(width: 2),
                          Text('Report', style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
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
