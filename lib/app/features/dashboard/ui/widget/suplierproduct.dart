import 'package:flutter/material.dart';

class SupplierProducts extends StatelessWidget {
  List<Map<String, dynamic>> supplierProducts = [
  {
    "name": "Coca Cola 330ml",
    "supplier": "Coca Cola Co.",
    "stock": 120,
    "price": 1.25,
  },
  {
    "name": "Pepsi 330ml",
    "supplier": "PepsiCo",
    "stock": 85,
    "price": 1.15,
  },
  {
    "name": "Orange Juice",
    "supplier": "Fresh Drinks",
    "stock": 42,
    "price": 2.50,
  },
  {
    "name": "Chocolate Bar",
    "supplier": "Nestle",
    "stock": 200,
    "price": 0.99,
  },
  {
    "name": "Potato Chips",
    "supplier": "Lays",
    "stock": 67,
    "price": 1.75,
  },
];
 SupplierProducts({super.key,
  required this.supplierProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 500,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.grey.shade200,
    ),
  ),
  child: Column(
    children: [

      /// Header
      Row(
        children: [
          const Icon(Icons.inventory_2_outlined),

          const SizedBox(width: 8),

          const Text(
            "Supplier Products",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          OutlinedButton(
            onPressed: () {},
            child: const Text("View All"),
          ),
        ],
      ),

      const SizedBox(height: 20),

      /// Scrollable List
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: supplierProducts.length,
          itemBuilder: (context, index) {
            final product = supplierProducts[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [

                  /// Product Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.inventory,
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          product["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          product["supplier"],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Stock: ${product["stock"]}",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Price
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [

                      Text(
                        "\$${product["price"]}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Available",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  ),
);
    
    }}