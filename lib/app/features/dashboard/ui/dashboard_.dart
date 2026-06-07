 import 'package:e_commerce_dashboard/app/core/helpers/app_bar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/dashboard_layout.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/circule.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/gragh.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/recentsalescard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/suplierproduct.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/systemalerts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DashBoard());
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Expanded(
          child:  DashboardLayout(),
        )
    ));
  }
}

