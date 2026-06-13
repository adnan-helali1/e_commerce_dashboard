import 'package:e_commerce_dashboard/app/features/dashboard/ui/sales_management.dart';
import 'package:flutter/material.dart';

class Sale {
  final String saleId;
  final String store;
  final String items;
  final String total;
  final String cost;
  final String profit;
  final String status;
  final Color statusColor;

  Sale({
    required this.saleId,
    required this.store,
    required this.items,
    required this.total,
    required this.cost,
    required this.profit,
    required this.status,
    required this.statusColor,
  });
}

class SalesList extends StatefulWidget {
  SalesList({super.key});

  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  final List<Sale> sales = [
    Sale(
      saleId: "#SL001",
      store: "SuperMart Downtown",
      items: "5",
      total: "\$25.50",
      cost: "\$17.00",
      profit: "\$8.50",
      status: "Completed",
      statusColor: Color(0xFF10B981),
    ),
    Sale(
      saleId: "#SL002",
      store: "SuperMart East",
      items: "3",
      total: "\$18.99",
      cost: "\$12.00",
      profit: "\$6.99",
      status: "Completed",
      statusColor: Color(0xFF10B981),
    ),
    Sale(
      saleId: "#SL003",
      store: "SuperMart West",
      items: "4",
      total: "\$16.40",
      cost: "\$9.97",
      profit: "\$6.43",
      status: "Pending",
      statusColor: Color(0xFFF59E0B),
    ),
     Sale(
      saleId: "#SL003",
      store: "SuperMart West",
      items: "4",
      total: "\$16.40",
      cost: "\$9.97",
      profit: "\$6.43",
      status: "Pending",
      statusColor: Color(0xFFF59E0B),
    ),
     Sale(
      saleId: "#SL003",
      store: "SuperMart West",
      items: "4",
      total: "\$16.40",
      cost: "\$9.97",
      profit: "\$6.43",
      status: "Pending",
      statusColor: Color(0xFFF59E0B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Expanded(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Expanded(flex: 1, child: Text("Sale ID")),
                  Expanded(flex: 2, child: Text("Store")),
                  Expanded(child: Text("Items")),
                  Expanded(child: Text("Total")),
                  Expanded(child: Text("Cost")),
                  Expanded(child: Text("Profit")),
                  Expanded(child: Text("Status")),
                ],
              ),
            ),
        
            const SizedBox(height: 10),
        
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  final sale = sales[index];
        
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(sale.saleId),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(sale.store),
                          ),
                          Expanded(
                            child: Text(sale.items),
                          ),
                          Expanded(
                            child: Text(sale.total),
                          ),
                          Expanded(
                            child: Text(sale.cost),
                          ),
                          Expanded(
                            child: Text(sale.profit),
                          ),
                          Expanded(
                            child: StatusChip(
                              text: sale.status,
                              color: sale.statusColor,
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
    );
  }
}