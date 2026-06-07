 import 'package:flutter/material.dart';

class RecentSalesCard extends StatelessWidget {
  const RecentSalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Header
          Row(
            children: [
              Icon(
                Icons.attach_money_rounded,
                color: Colors.grey.shade700,
              ),
              const SizedBox(width: 8),
              const Text(
                "Recent Sales",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("View All Sales"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Sales List
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return const SaleTile(
                  saleId: "SAL-001",
                  customer: "SuperMart Downtown",
                  itemsCount: 3,
                  date: "2026-05-02",
                  time: "09:30",
                  amount: "\$10.97",
                  profit: "+\$4.47 profit",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SaleTile extends StatelessWidget {
  final String saleId;
  final String customer;
  final int itemsCount;
  final String date;
  final String time;
  final String amount;
  final String profit;

  const SaleTile({
    super.key,
    required this.saleId,
    required this.customer,
    required this.itemsCount,
    required this.date,
    required this.time,
    required this.amount,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            /// Left Side
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    saleId,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    customer,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 10),
                   Text(
                    "$itemsCount items • $date $time",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            /// Right Side
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.grey,
                ),

                const SizedBox(height: 20),

                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  profit,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}