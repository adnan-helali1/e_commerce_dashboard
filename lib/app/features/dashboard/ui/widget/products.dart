import 'package:flutter/material.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_container.dart';

class Products extends StatelessWidget {
 List<Map<String, dynamic>> products = [
    {"name": "Product A", "unitsSold": 150, "profit": 3000},
    {"name": "Product B", "unitsSold": 120, "profit": 2400},
    {"name": "Product C", "unitsSold": 100, "profit": 2000},
    {"name": "Product D", "unitsSold": 80, "profit": 1600},
    {"name": "Product E", "unitsSold": 60, "profit": 1200},
  ];
   Products({super.key,
  required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BigContainer(
      colorcontainer: Colors.white70,
       height: 250,
        width: 400,
      children:[ Column(
             children: [
      
      /// Header
      Row( mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.trending_up_rounded),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            "Top Selling Products",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("View All"),
        ),
      ],
             ),
      
             const SizedBox(height: 24),
      
             /// Products
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade50,
                ),
                child: Text(
                  "#${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
                    
              const SizedBox(width: 16),
                    
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["name"].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      "${product["unitsSold"]} units sold",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
                    
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${product["profit"]}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "profit",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
                        ],
                      ),
                    );
               }),
            ),
          ],
        ),]
    );
    
    }}