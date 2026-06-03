 import 'package:e_commerce_dashboard/app/core/helpers/app_bar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/dashboard_layout.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/gragh.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/big_container.dart';
class New extends StatelessWidget {
 final Widget n;
   const New({
    super.key,
    required this.n,
    });
 @override
  Widget build(BuildContext context) {
    return BigContainer(
                          height: 500,
                          width: 550,colorcontainer: Colors.white70,
                          children: [Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text('Sales Over Time'),
                              SizedBox(height: 200,
                              width: 400,
                              child: n),
                             
                            ],),
                          )],
                        );
  }
}
