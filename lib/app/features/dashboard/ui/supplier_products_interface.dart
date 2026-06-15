 import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/appbar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/header.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/search_and_filters.dart';
import 'package:flutter/material.dart';
class Supplier_Products {
  final int ide;
  final String productName;
  final String supplierName;
  final double buyPrice;
  final int stock;
  final bool available;
  final DateTime lastUpdated;

  Supplier_Products({
    required this.ide,
    required this.productName,
    required this.supplierName,
    required this.buyPrice,
    required this.stock,
    required this.available,
    required this.lastUpdated,
  });}
class SupplierProductsInterface extends StatefulWidget {
  const SupplierProductsInterface({super.key});

  @override
  State<SupplierProductsInterface> createState() =>
      _SupplierProductsPageState();
}

class _SupplierProductsPageState
    extends State<SupplierProductsInterface> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedFilter = "All";

  final List<Supplier_Products> products = [
    Supplier_Products(
      ide: 1,
      productName: "Organic Milk 1L",
      supplierName: "FreshDairy Co.",
      buyPrice: 2.50,
      stock: 150,
      available: true,
      lastUpdated: DateTime.now(),
    ),
    Supplier_Products(
      ide: 2,
      productName: "Organic Milk 1L",
      supplierName: "GreenFarm Suppliers",
      buyPrice: 2.35,
      stock: 200,
      available: true,
      lastUpdated: DateTime.now(),
    ),
    Supplier_Products(
      ide: 3,
      productName: "Butter 500g",
      supplierName: "Dairy World",
      buyPrice: 4.25,
      stock: 0,
      available: false,
      lastUpdated: DateTime.now(),
    ),
     Supplier_Products(
      ide: 3,
      productName: "Butter 500g",
      supplierName: "Dairy World",
      buyPrice: 4.25,
      stock: 0,
      available: false,
      lastUpdated: DateTime.now(),
    ),
  ];

  List<Supplier_Products> get filteredProducts {
    return products.where((product) {
      final searchMatch = product.productName
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          product.supplierName
              .toLowerCase()
              .contains(searchController.text.toLowerCase());

      bool statusMatch = true;

      if (selectedFilter == "Available") {
        statusMatch = product.available;
      } else if (selectedFilter == "Unavailable") {
        statusMatch = !product.available;
      }

      return searchMatch && statusMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      body:
          Row(
            children: [
              AdminPanel(selectedIndex: 4,),
              Expanded(
                child: Column(
                  children: [
                    AppbarDashboard(),
                    Header(title: "Supplier Products",
                    subtitle: "Manage supplier product offerings and pricing",
                    showAddButton: true,buttonText: "Add Supplier Offer",
                    onAddPressed: () {
                      
                    },),
                    SizedBox(height: 30,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                         
                            const SizedBox(height: 40),
                                
                           SearchAndFilters(
                             searchController: searchController,
                             selectedFilter: selectedFilter,
                             showFilters: true,
                             onSearchChanged: (value) {
                               setState(() {});
                             },
                             onFilterChanged: (value) {
                               setState(() {
                                 selectedFilter = value;
                               });
                            },
                           ),
                            const SizedBox(height: 40),
                                
                            Expanded(
                              child:  ListView.builder(
    itemCount: filteredProducts.length,
    itemBuilder: (context, index) {
      final product = filteredProducts[index];

      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  size: 18,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ID: ${product.ide}",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 2,
                child: Text(product.supplierName),
              ),

              Expanded(
                child: Text(
                  "\$${product.buyPrice.toStringAsFixed(2)}",
                ),
              ),

              Expanded(
                child: Text(
                  product.stock.toString(),
                ),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: product.available
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    product.available
                        ? "Available"
                        : "Unavailable",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: product.available
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  "${product.lastUpdated.day}/${product.lastUpdated.month}/${product.lastUpdated.year}",
                  ),
                 ),
                ],
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
                  ],
                ),
              ),
            ],
          ),
 );
  }
    }