
import 'package:e_commerce_dashboard/app/core/helpers/spacing.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_card.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_container.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/circule.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/square.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/dashboard_card.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/gragh.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  bool isCollapsed = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      
      body: 
      Row(
        children: [
          AdminPanel(),
         //
          Expanded(
            child: Column(
              children: [

                // Header
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xffE5E7EB)),
                    ),
                  ),
                  child: Row(children: [
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "B2B Smart Ordering Platform",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Welcome, SuperMart Downtown",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone_android),
                        label: const Text("Store App"),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.monitor),
                        label: const Text("Admin"),
                      ),
                    ],
                  ),
                ),

                // Dashboard Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child:SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 3,
                              children: const [
                                DashboardCard(
                                  title: "Total Products",
                                  value: "248",
                                  percentage: "5.2%",
                                  icon: Icons.inventory_2,
                                  color: Colors.indigo,
                                ),
                                DashboardCard(
                                  title: "Supplier Offers",
                                  value: "412",
                                  percentage: "8.1%",
                                  icon: Icons.shopping_cart,
                                  color: Colors.blue,
                                ),
                                DashboardCard(
                                  title: "Total Suppliers",
                                  value: "18",
                                  percentage: "2.4%",
                                  icon: Icons.people,
                                  color: Colors.lightBlue,
                                ),
                                DashboardCard(
                                  title: "Total Orders",
                                  value: "134",
                                  percentage: "15.3%",
                                  icon: Icons.shopping_basket,
                                  color: Colors.orange,
                                ),
                                DashboardCard(
                                  title: "Total Sales",
                                  value: "89",
                                  percentage: "12.8%",
                                  icon: Icons.trending_up,
                                  color: Colors.green,
                                ),
                                DashboardCard(
                                  title: "Total Revenue",
                                  value: "\$28,440.50",
                                  percentage: "18.5%",
                                  icon: Icons.attach_money,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 300,
                            child: New(n: Gragh(),)),
                              SizedBox(
                            height: 300,
                            child: New(n: Square(data: [10,9,4,0], labels: ["Jan", "Feb", "Mar", "Apr"]),)),
                             SizedBox(
                            height: 300,
                            child: New(n:Circule(
                              size: 120,
                              colors: [
                                Colors.red,
                                Colors.orange,
                                Colors.yellow,
                                Colors.green
                              ],
                              stops: [0.25, 0.5, 0.75, 1.0],
                            )),)
                              ],
                      ),
                    ),
                    ),
                  ),
                      
                
              ],
            ),
          ),
        ],),
      );
   
  }
  Widget _menuItem({
    required IconData icon,
    required String title,
    bool selected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? const Color(0xff1E1B4B) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? Colors.white : Colors.black87,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

