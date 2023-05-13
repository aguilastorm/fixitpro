import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/navigation/router/routes.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
    ], child: const FixItProApp());
  }
}

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
        theme: AppTheme.lightTheme);
  }
}
