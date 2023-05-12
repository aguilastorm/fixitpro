import 'package:flutter/material.dart';
import 'common/navigation/router/routes.dart';

class FixItProApp extends StatelessWidget {
  const FixItProApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FixItPro App',
      initialRoute: AppRoutes.initialRoutes,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
