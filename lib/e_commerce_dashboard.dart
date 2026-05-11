import 'package:e_commerce_dashboard/app/core/routing/app_router.dart';
import 'package:e_commerce_dashboard/app/core/routing/routes.dart';
import 'package:e_commerce_dashboard/app/core/theme/dark_theme.dart';
import 'package:e_commerce_dashboard/app/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceDashboard extends StatelessWidget {
  const ECommerceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'B2B Admin Dashboard',
          debugShowCheckedModeBanner: false,
          //   initialRoute: Routes.admincategoriesscreen,
          // onGenerateRoute: appRouter.generateRoute,
          theme: lightTheme,
          darkTheme: darkTheme,
          // themeMode: mode,
        );
      },
    );
  }
}
