import 'package:flutter/material.dart';

class Suplier extends StatelessWidget {
  List<Map<String, dynamic>> suppliers = [
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
  {
    "name": "PepsiCo",
    "products": 64,
    "orders": 18,
    "status": "Pending",
  },
  {
    "name": "Coca Cola Co.",
    "products": 150,
    "orders": 41,
    "status": "Active",
  },
  {
    "name": "Unilever",
    "products": 95,
    "orders": 27,
    "status": "Inactive",
  },
];
   Suplier({super.key,
  required this.suppliers,
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
          const Icon(Icons.groups_outlined),

          const SizedBox(width: 8),

          const Text(
            "Suppliers Summary",
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

      /// Scrollable Suppliers List
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: suppliers.length,
          itemBuilder: (context, index) {
            final supplier = suppliers[index];

            Color statusColor =
                supplier["status"] == "Active"
                    ? Colors.green
                    : supplier["status"] == "Pending"
                        ? Colors.orange
                        : Colors.red;

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

                  /// Supplier Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.business,
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Supplier Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          supplier["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "${supplier["products"]} Products",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "${supplier["orders"]} Orders",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Status Section
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5, ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(
                            0.12,
                          ),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          supplier["status"],
                          style: TextStyle(
                            color: statusColor,
                            fontWeight:
                                FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.grey,
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