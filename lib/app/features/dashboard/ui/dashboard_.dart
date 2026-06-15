 import 'package:e_commerce_dashboard/app/core/helpers/spacing.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/appbar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_card.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_container.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/circule.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/products.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/recentsalescard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/square.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/suplier.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/systemalerts.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/dashboard_card.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/gragh.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/suplierproduct.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const DashBoard());
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
    bool isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
         backgroundColor: const Color(0xffF7F8FC),
        body:  Row(
        children: [
          AdminPanel(selectedIndex: 1,),
          Expanded(
            child: Column(
              children: [
              AppbarDashboard(),
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
                           BigCard(title: "Sales Over Time", childcard: Gragh()),
                             BigCard(title: "Orders by Status", childcard: Square(data: [10,9,4,0], labels: ["Jan", "Feb", "Mar", "Apr"])),
                             BigCard(title: "Category Distribution", childcard: PieChartScreen()),
                          /*SizedBox(height:300,
                          Products(products: 
                           [
                            {"name": "Product A", "unitsSold": 150, "profit": 3000},
                            {"name": "Product B", "unitsSold": 120, "profit": 2400},
                           ]
                           ),)*/
                 SizedBox(
                  height: 300,
                  child: RecentSalesCard()),
                SizedBox(
          height: 300,
          child: SupplierProducts(supplierProducts: [{
            "name": "Potato Chips",
              "supplier": "Lays",
              "stock": 67,
              "price": 1.75,
          },
           {"name": "Orange Juice",
    "supplier": "Fresh Drinks",
    "stock": 42,
    "price": 2.50,}]),
        ),
                       SizedBox(
          height: 300,
          child:Suplier(suppliers: [
            {
    "name": "Fresh Foods Ltd",
    "products": 120,
    "orders": 35,
    "status": "Active",
  },
  {
    "name": "Nestle",
    "products": 85,
    "orders": 22,
    "status": "Active",
  },
          ])
          
          ),
            SizedBox(
          height: 300,
          child: Systemalerts(alerts: [
            {
    "title": "Low Stock Warning",
    "message": "Coca Cola 330ml stock is below 10 units.",
    "time": "5 min ago",
    "type": "warning",
  },
  {
    "title": "New Supplier Added",
    "message": "Fresh Foods Ltd has been added successfully.",
    "time": "20 min ago",
    "type": "success",
  },
          ])
          ),
                              ],
                      ),
                    ),
                    ),
                  ),
                 
              ],
            ),
          ),
        ],),
      ));
   
  }
  Widget _menuItem({
    required IconData icon, required String title,
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

