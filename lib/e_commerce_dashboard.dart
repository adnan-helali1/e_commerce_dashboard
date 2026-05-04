import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceDashboard extends StatelessWidget {
  const ECommerceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'B2B Admin Dashboard',
          debugShowCheckedModeBanner: false,
          // initialRoute: Routes.admincategoriesscreen,
          // onGenerateRoute: appRouter.generateRoute,
          // theme: lightTheme,
          // darkTheme: darkTheme,
          // themeMode: mode,
        );
      },
    );
  }
}
