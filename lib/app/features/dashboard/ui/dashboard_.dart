 import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
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
      home: AdminPanel(),
    );
  }
}

