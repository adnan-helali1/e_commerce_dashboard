import 'package:e_commerce_dashboard/app/features/dashboard/ui/dashboard_.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Routes.dashboard':
            return MaterialPageRoute(
              builder: (_) => const DashBoard(),
            );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Admin Categories Screen")),
            ),
          
        );
        
    }
  }
}
