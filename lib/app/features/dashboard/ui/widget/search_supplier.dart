/*import 'package:flutter/material.dart';
class SupplierProduct {
  final int id;
  final String productName;
  final String supplierName;
  final double buyPrice;
  final int stock;
  final bool available;
  final DateTime lastUpdated;

  SupplierProduct({
    required this.id,
    required this.productName,
    required this.supplierName,
    required this.buyPrice,
    required this.stock,
    required this.available,
    required this.lastUpdated,
  });}
  class SupplierProductsPage extends StatefulWidget {
  const SupplierProductsPage({super.key});

  @override
  State<SupplierProductsPage> createState() =>
      _SupplierProductsPageState();
}


class _SupplierProductsPageState extends State<_SupplierProductsPageState> {
   final TextEditingController searchController =
      TextEditingController();

  String selectedFilter = "All";

  final List<SupplierProduct> products = [
    SupplierProduct(
      id: 1,
      productName: "Organic Milk 1L",
      supplierName: "FreshDairy Co.",
      buyPrice: 2.50,
      stock: 150,
      available: true,
      lastUpdated: DateTime.now(),
    ),
    SupplierProduct(
      id: 2,
      productName: "Organic Milk 1L",
      supplierName: "GreenFarm Suppliers",
      buyPrice: 2.35,
      stock: 200,
      available: true,
      lastUpdated: DateTime.now(),
    ),
    SupplierProduct(
      id: 3,
      productName: "Butter 500g",
      supplierName: "Dairy World",
      buyPrice: 4.25,
      stock: 0,
      available: false,
      lastUpdated: DateTime.now(),
    ),
  ];

  List<SupplierProduct> get filteredProducts {
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
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: "Search offers...",
              prefixIcon:
                  const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
       FilterButton("All"),
        const SizedBox(width: 8),
        FilterButton("Available"),
        const SizedBox(width: 8),
        FilterButton("Unavailable"),
      ],
    );
  }
}*/