import 'package:flutter/material.dart';

class Systemalerts extends StatelessWidget {
  List<Map<String, dynamic>> alerts = [
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
  {
    "title": "Order Delayed",
    "message": "Purchase Order #PO-203 is delayed.",
    "time": "1 hour ago",
    "type": "error",
  },
  {
    "title": "System Backup Completed",
    "message": "Daily backup completed successfully.",
    "time": "2 hours ago",
    "type": "info",
  },
  {
    "title": "Payment Received",
    "message": "Invoice INV-109 has been paid.",
    "time": "3 hours ago",
    "type": "success",
  },
];
 Systemalerts({super.key,
 required this.alerts,
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
          const Icon(Icons.notifications_active_outlined),

          const SizedBox(width: 8),

          const Text(
            "System Alerts",
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

      /// Alerts List
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: alerts.length,
          itemBuilder: (context, index) {

            final alert = alerts[index];

            IconData icon;
            Color color;

            switch (alert["type"]) {
              case "success":
                icon = Icons.check_circle_outline;
                color = Colors.green;
                break;

              case "warning":
                icon = Icons.warning_amber_rounded;
                color = Colors.orange;
                break;

              case "error":
                icon = Icons.error_outline;
                color = Colors.red;
                break;

              default:
                icon = Icons.info_outline;
                color = Colors.blue;
            }

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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  /// Alert Icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                    ),
                  ),

                  const SizedBox(width: 14),

                  /// Alert Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          alert["title"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          alert["message"],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          alert["time"],
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10), const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey,
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