import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/appbar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/header.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/sales_card.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/sales_list.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/search_and_filters.dart';
import 'package:flutter/material.dart';

class SalesManagement extends StatefulWidget {
   SalesManagement({super.key});

  @override
  State<SalesManagement> createState() => _SalesManagementState();
}

class _SalesManagementState extends State<SalesManagement> {
   final TextEditingController searchController =
      TextEditingController();
       String selectedFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AdminPanel(selectedIndex: 6,),
          Expanded(
            child: Column(
              children: [
                AppbarDashboard(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: const Color(0xffF8FAFC),
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(title: "Sales Management",
                          subtitle: "Monitor and analyze sales transactions",
                          showAddButton: false,),
                          const SizedBox(height: 28),
                          Row(
                            children: const [
                              Expanded(
                                child: SalesCard(
                                  title: "Total Revenue",
                                  value: "\$60.89",
                                  icon: Icons.trending_up_rounded,
                                  iconColor: Color(0xFF10B981),
                                ),
                              ),
                              SizedBox(width: 18),
                              Expanded(
                                child: SalesCard(
                                  title: "Total Sales",
                                  value: "3",
                                  icon: Icons.inventory_2_outlined,
                                  iconColor: Color(0xFF6366F1),
                                ),
                              ),
                              SizedBox(width: 18),
                              Expanded(
                                child: SalesCard(
                                  title: "Total Profit",
                                  value: "\$22.92",
                                  icon: Icons.show_chart_rounded,
                                  iconColor: Color(0xFFF59E0B),
                                ),
                              ),
                            ],
                          ),
                    
                          const SizedBox(height: 28),
                           SearchAndFilters(
                                 searchController: searchController,
                                 selectedFilter: null,
                                 showFilters: false,
                                 onSearchChanged: (value) {
                                   setState(() {});
                                 },
                                 onFilterChanged: (value) {
                                   setState(() {
                                     selectedFilter ="";
                                   });
                                },
                               ),
                               const SizedBox(height: 28),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: const Color(0xffE5E7EB),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Recent Sales",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      FilledButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.download_rounded),
                                        label: const Text("Export"),
                                      )
                                    ],
                                  ),
                                ),
                    
                                const Divider(height: 1),
                             SalesList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class StatusChip extends StatelessWidget {
  final String text;
  final Color color;

  const StatusChip({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}