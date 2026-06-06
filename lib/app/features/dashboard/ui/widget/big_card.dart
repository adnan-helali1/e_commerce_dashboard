 import 'package:e_commerce_dashboard/app/core/helpers/app_bar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/dashboard_layout.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/gragh.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_container.dart';
class BigCard extends StatelessWidget {
 final Widget childcard;
 final String title;
   const BigCard({
    super.key,
    required this.childcard,
    required this.title,
    });
 @override
  Widget build(BuildContext context) {
    return BigContainer(
                          height: 400,
                          width: 800,colorcontainer: Colors.white70,
                          children: [Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               Row(
        children: [
          const Icon(Icons.groups_outlined),

          const SizedBox(width: 8),

           Text(title,
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

      const SizedBox(height: 50),
                              SizedBox(height: 200,
                              width: 400,
                              child: childcard),
                             
                            ],),
                          )],
                        );
  }
}
